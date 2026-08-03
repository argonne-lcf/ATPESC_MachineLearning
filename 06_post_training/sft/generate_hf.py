from transformers import AutoModelForCausalLM, AutoTokenizer
import argparse
import os
import torch


CHATML_TEMPLATE_PATH = os.path.join(os.path.dirname(__file__), "chatml.jinja")


def format_prompt(tokenizer, user_text, raw=False):
    if raw:
        return user_text
    messages = [{"role": "user", "content": user_text}]
    return tokenizer.apply_chat_template(
        messages, tokenize=False, add_generation_prompt=True
    )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--raw", action="store_true",
                        help="Pass prompts as raw text (no chat template). "
                             "Use for base models or to compare with/without template.")
    parser.add_argument("--interactive", action="store_true",
                        help="Enter interactive prompt after running test prompts.")
    args = parser.parse_args()

    MODEL_PATH = os.getenv('MODEL_PATH', "Qwen/Qwen2.5-0.5B")
    device = "xpu" if hasattr(torch, "xpu") and torch.xpu.is_available() else "cpu"
    tokenizer = AutoTokenizer.from_pretrained(MODEL_PATH)
    model = AutoModelForCausalLM.from_pretrained(MODEL_PATH).to(device)

    if not args.raw and not tokenizer.chat_template:
        with open(CHATML_TEMPLATE_PATH) as f:
            tokenizer.chat_template = f.read()

    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    # Stop generation at <|im_end|> (ChatML turn boundary)
    stop_token_ids = [tokenizer.eos_token_id]
    im_end_id = tokenizer.convert_tokens_to_ids("<|im_end|>")
    if im_end_id != tokenizer.unk_token_id:
        stop_token_ids.append(im_end_id)

    mode = "raw text" if args.raw else "chat template"
    print(f"Mode: {mode}  stop_ids={stop_token_ids}")

    prompts = [
        "Who are you?",
        "The capital of France is",
        "What is the capital of France?",
        "What is the capital of France? What is the capital of Spain?",
        "Why is the sky blue?",
    ]

    for i, prompt in enumerate(prompts):
        chat_input = format_prompt(tokenizer, prompt, raw=args.raw)
        inputs = tokenizer(chat_input, return_tensors="pt").to(model.device)
        output_ids = model.generate(**inputs, max_new_tokens=128, do_sample=True, temperature=0.8, top_p=0.95, eos_token_id=stop_token_ids)
        generated_text = tokenizer.decode(output_ids[0][inputs.input_ids.shape[1]:], skip_special_tokens=False).replace("<|im_end|>", "").strip()
        print(f"\n--- Prompt {i} --------------")
        print(f"Prompt: {prompt!r}, Generated text: {generated_text!r}")
        print(f"\n-----------------------------")

    if not args.interactive:
        return

    print("\n\nInteractive mode (Ctrl-C to exit)")
    try:
        while True:
            user_input = input("\n> ")
            if not user_input.strip():
                continue
            chat_input = format_prompt(tokenizer, user_input, raw=args.raw)
            inputs = tokenizer(chat_input, return_tensors="pt").to(model.device)
            output_ids = model.generate(**inputs, max_new_tokens=128, do_sample=True, temperature=0.8, top_p=0.95, eos_token_id=stop_token_ids)
            generated_text = tokenizer.decode(output_ids[0][inputs.input_ids.shape[1]:], skip_special_tokens=False).replace("<|im_end|>", "").strip()
            print(generated_text)
    except (KeyboardInterrupt, EOFError):
        print("\nBye!")


if __name__ == '__main__':
    main()
