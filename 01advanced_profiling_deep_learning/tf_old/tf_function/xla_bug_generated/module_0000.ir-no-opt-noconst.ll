target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_41 = external constant [4 x i8], align 64
@buffer_for_constant_61 = external constant [4 x i8], align 64
@0 = external dso_local unnamed_addr constant [4 x i8]
@1 = external dso_local unnamed_addr constant [8 x i8]
@2 = external dso_local unnamed_addr constant [4 x i8]
@3 = external dso_local unnamed_addr constant [4 x i8]
@4 = external dso_local unnamed_addr constant [4 x i8]
@5 = external dso_local unnamed_addr constant [4 x i8]
@6 = external dso_local unnamed_addr constant [4 x i8]
@7 = external dso_local unnamed_addr constant [4 x i8]
@8 = external dso_local unnamed_addr constant [4 x i8]
@9 = external dso_local unnamed_addr constant [4 x i8]
@10 = external dso_local unnamed_addr constant [4 x i8]
@11 = external dso_local unnamed_addr constant [4 x i8]
@12 = external dso_local unnamed_addr constant [4 x i8]
@13 = external dso_local unnamed_addr constant [4 x i8]
@14 = external dso_local unnamed_addr constant [4 x i8]
@15 = external dso_local unnamed_addr constant [4 x i8]
@16 = external dso_local unnamed_addr constant [4 x i8]
@17 = external dso_local unnamed_addr constant [4 x i8]
@18 = external dso_local unnamed_addr constant [4 x i8]
@19 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache_0 = external dso_local addrspace(3) global [1 x [32 x [33 x float]]]
@20 = external dso_local unnamed_addr constant [4 x i8]
@21 = external dso_local unnamed_addr constant [4 x i8]
@22 = external dso_local unnamed_addr constant [4 x i8]
@23 = external dso_local unnamed_addr constant [4 x i8]
@24 = external dso_local unnamed_addr constant [4 x i8]
@25 = external dso_local unnamed_addr constant [8 x i8]
@26 = external dso_local unnamed_addr constant [8 x i8]
@27 = external dso_local unnamed_addr constant [4 x i8]
@28 = external dso_local unnamed_addr constant [4 x i8]
@29 = external dso_local unnamed_addr constant [4 x i8]
@30 = external dso_local unnamed_addr constant [4 x i8]
@31 = external dso_local unnamed_addr constant [4 x i8]
@32 = external dso_local unnamed_addr constant [4 x i8]
@33 = external dso_local unnamed_addr constant [4 x i8]
@34 = external dso_local unnamed_addr constant [4 x i8]
@35 = external dso_local unnamed_addr constant [8 x i8]
@36 = external dso_local unnamed_addr constant [8 x i8]
@37 = external dso_local unnamed_addr constant [4 x i8]
@38 = external dso_local unnamed_addr constant [4 x i8]
@39 = external dso_local unnamed_addr constant [4 x i8]
@40 = external dso_local unnamed_addr constant [4 x i8]
@41 = external dso_local unnamed_addr constant [4 x i8]
@42 = external dso_local unnamed_addr constant [8 x i8]
@43 = external dso_local unnamed_addr constant [8 x i8]
@44 = external dso_local unnamed_addr constant [4 x i8]
@45 = external dso_local unnamed_addr constant [4 x i8]
@46 = external dso_local unnamed_addr constant [4 x i8]
@47 = external dso_local unnamed_addr constant [4 x i8]
@48 = external dso_local unnamed_addr constant [4 x i8]
@49 = external dso_local unnamed_addr constant [8 x i8]
@50 = external dso_local unnamed_addr constant [8 x i8]
@51 = external dso_local unnamed_addr constant [4 x i8]
@52 = external dso_local unnamed_addr constant [4 x i8]
@53 = external dso_local unnamed_addr constant [4 x i8]
@54 = external dso_local unnamed_addr constant [4 x i8]
@55 = external dso_local unnamed_addr constant [4 x i8]
@56 = external dso_local unnamed_addr constant [8 x i8]
@57 = external dso_local unnamed_addr constant [8 x i8]
@58 = external dso_local unnamed_addr constant [4 x i8]
@59 = external dso_local unnamed_addr constant [4 x i8]
@60 = external dso_local unnamed_addr constant [4 x i8]
@61 = external dso_local unnamed_addr constant [4 x i8]
@62 = external dso_local unnamed_addr constant [4 x i8]
@63 = external dso_local unnamed_addr constant [8 x i8]
@64 = external dso_local unnamed_addr constant [8 x i8]
@65 = external dso_local unnamed_addr constant [4 x i8]
@66 = external dso_local unnamed_addr constant [4 x i8]
@67 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache_01 = external dso_local addrspace(3) global [2 x [32 x [33 x float]]]
@68 = external dso_local unnamed_addr constant [4 x i8]
@69 = external dso_local unnamed_addr constant [4 x i8]
@70 = external dso_local unnamed_addr constant [4 x i8]
@71 = external dso_local unnamed_addr constant [4 x i8]
@72 = external dso_local unnamed_addr constant [4 x i8]
@73 = external dso_local unnamed_addr constant [4 x i8]
@74 = external dso_local unnamed_addr constant [4 x i8]
@75 = external dso_local unnamed_addr constant [4 x i8]
@76 = external dso_local unnamed_addr constant [4 x i8]
@77 = external dso_local unnamed_addr constant [4 x i8]
@78 = external dso_local unnamed_addr constant [4 x i8]
@79 = external dso_local unnamed_addr constant [4 x i8]
@80 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache_02 = external dso_local addrspace(3) global [1 x [32 x float]]
@81 = external dso_local unnamed_addr constant [4 x i8]
@82 = external dso_local unnamed_addr constant [4 x i8]
@83 = external dso_local unnamed_addr constant [4 x i8]
@84 = external dso_local unnamed_addr constant [4 x i8]
@85 = external dso_local unnamed_addr constant [4 x i8]
@86 = external dso_local unnamed_addr constant [4 x i8]
@87 = external dso_local unnamed_addr constant [4 x i8]
@88 = external dso_local unnamed_addr constant [4 x i8]
@89 = external dso_local unnamed_addr constant [4 x i8]
@90 = external dso_local unnamed_addr constant [4 x i8]
@91 = external dso_local unnamed_addr constant [4 x i8]
@92 = external dso_local unnamed_addr constant [4 x i8]
@93 = external dso_local unnamed_addr constant [4 x i8]
@94 = external dso_local unnamed_addr constant [4 x i8]
@95 = external dso_local unnamed_addr constant [4 x i8]
@96 = external dso_local unnamed_addr constant [4 x i8]
@97 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache_03 = external dso_local addrspace(3) global [1 x [32 x float]]
@98 = external dso_local unnamed_addr constant [4 x i8]
@99 = external dso_local unnamed_addr constant [4 x i8]
@100 = external dso_local unnamed_addr constant [4 x i8]
@101 = external dso_local unnamed_addr constant [4 x i8]
@102 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache_04 = external dso_local addrspace(3) global [1 x [32 x float]]
@103 = external dso_local unnamed_addr constant [4 x i8]
@104 = external dso_local unnamed_addr constant [4 x i8]
@105 = external dso_local unnamed_addr constant [4 x i8]
@106 = external dso_local unnamed_addr constant [4 x i8]
@107 = external dso_local unnamed_addr constant [4 x i8]
@108 = external dso_local unnamed_addr constant [4 x i8]
@109 = external dso_local unnamed_addr constant [4 x i8]
@110 = external dso_local unnamed_addr constant [4 x i8]
@111 = external dso_local unnamed_addr constant [4 x i8]
@112 = external dso_local unnamed_addr constant [4 x i8]
@113 = external dso_local unnamed_addr constant [4 x i8]
@114 = external dso_local unnamed_addr constant [4 x i8]
@115 = external dso_local unnamed_addr constant [4 x i8]
@116 = external dso_local unnamed_addr constant [4 x i8]
@117 = external dso_local unnamed_addr constant [4 x i8]
@118 = external dso_local unnamed_addr constant [4 x i8]
@119 = external dso_local unnamed_addr constant [4 x i8]
@120 = external dso_local unnamed_addr constant [4 x i8]
@121 = external dso_local unnamed_addr constant [4 x i8]
@122 = external dso_local unnamed_addr constant [4 x i8]
@123 = external dso_local unnamed_addr constant [4 x i8]
@124 = external dso_local unnamed_addr constant [4 x i8]
@125 = external dso_local unnamed_addr constant [4 x i8]
@126 = external dso_local unnamed_addr constant [4 x i8]
@127 = external dso_local unnamed_addr constant [4 x i8]
@128 = external dso_local unnamed_addr constant [4 x i8]
@129 = external dso_local unnamed_addr constant [4 x i8]
@130 = external dso_local unnamed_addr constant [4 x i8]
@131 = external dso_local unnamed_addr constant [4 x i8]
@132 = external dso_local unnamed_addr constant [4 x i8]
@133 = external dso_local unnamed_addr constant [4 x i8]
@134 = external dso_local unnamed_addr constant [4 x i8]
@135 = external dso_local unnamed_addr constant [4 x i8]
@136 = external dso_local unnamed_addr constant [4 x i8]
@137 = external dso_local unnamed_addr constant [4 x i8]
@138 = external dso_local unnamed_addr constant [4 x i8]
@139 = external dso_local unnamed_addr constant [4 x i8]
@140 = external dso_local unnamed_addr constant [4 x i8]
@141 = external dso_local unnamed_addr constant [4 x i8]
@142 = external dso_local unnamed_addr constant [4 x i8]
@143 = external dso_local unnamed_addr constant [4 x i8]
@144 = external dso_local unnamed_addr constant [4 x i8]
@145 = external dso_local unnamed_addr constant [4 x i8]
@146 = external dso_local unnamed_addr constant [4 x i8]
@147 = external dso_local unnamed_addr constant [4 x i8]
@148 = external dso_local unnamed_addr constant [4 x i8]
@149 = external dso_local unnamed_addr constant [4 x i8]
@150 = external dso_local unnamed_addr constant [4 x i8]
@151 = external dso_local unnamed_addr constant [4 x i8]
@152 = external dso_local unnamed_addr constant [4 x i8]
@153 = external dso_local unnamed_addr constant [4 x i8]
@154 = external dso_local unnamed_addr constant [4 x i8]
@155 = external dso_local unnamed_addr constant [4 x i8]
@156 = external dso_local unnamed_addr constant [4 x i8]
@157 = external dso_local unnamed_addr constant [4 x i8]
@158 = external dso_local unnamed_addr constant [4 x i8]
@159 = external dso_local unnamed_addr constant [4 x i8]
@160 = external dso_local unnamed_addr constant [4 x i8]
@161 = external dso_local unnamed_addr constant [4 x i8]
@162 = external dso_local unnamed_addr constant [4 x i8]
@163 = external dso_local unnamed_addr constant [4 x i8]
@164 = external dso_local unnamed_addr constant [4 x i8]
@165 = external dso_local unnamed_addr constant [4 x i8]
@166 = external dso_local unnamed_addr constant [4 x i8]
@167 = external dso_local unnamed_addr constant [4 x i8]
@168 = external dso_local unnamed_addr constant [4 x i8]
@169 = external dso_local unnamed_addr constant [4 x i8]
@170 = external dso_local unnamed_addr constant [4 x i8]
@171 = external dso_local unnamed_addr constant [4 x i8]
@172 = external dso_local unnamed_addr constant [4 x i8]
@173 = external dso_local unnamed_addr constant [4 x i8]
@174 = external dso_local unnamed_addr constant [4 x i8]
@175 = external dso_local unnamed_addr constant [4 x i8]
@176 = external dso_local unnamed_addr constant [4 x i8]
@177 = external dso_local unnamed_addr constant [4 x i8]
@178 = external dso_local unnamed_addr constant [4 x i8]
@179 = external dso_local unnamed_addr constant [4 x i8]
@180 = external dso_local unnamed_addr constant [4 x i8]
@181 = external dso_local unnamed_addr constant [4 x i8]
@182 = external dso_local unnamed_addr constant [4 x i8]
@183 = external dso_local unnamed_addr constant [4 x i8]
@184 = external dso_local unnamed_addr constant [4 x i8]
@185 = external dso_local unnamed_addr constant [4 x i8]
@186 = external dso_local unnamed_addr constant [4 x i8]
@187 = external dso_local unnamed_addr constant [4 x i8]
@188 = external dso_local unnamed_addr constant [4 x i8]
@189 = external dso_local unnamed_addr constant [4 x i8]
@190 = external dso_local unnamed_addr constant [4 x i8]
@191 = external dso_local unnamed_addr constant [4 x i8]
@192 = external dso_local unnamed_addr constant [4 x i8]
@193 = external dso_local unnamed_addr constant [4 x i8]
@194 = external dso_local unnamed_addr constant [4 x i8]

define void @fusion_31(i8* noalias align 16 dereferenceable(8) %alloc81, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc85, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %arg3.4.raw = getelementptr inbounds i8, i8* %alloc85, i64 0
  %arg3.4.typed = bitcast i8* %arg3.4.raw to float*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg2.3.raw = getelementptr inbounds i8, i8* %alloc81, i64 0
  %arg2.3.typed = bitcast i8* %arg2.3.raw to i64*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !64
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %fusion.31.in_bounds-true, label %fusion.31.in_bounds-after

fusion.31.in_bounds-after:                        ; preds = %fusion.31.in_bounds-true, %entry
  ret void

fusion.31.in_bounds-true:                         ; preds = %entry
  %param_1.170 = load float, float* %arg3.4.typed, align 4, !invariant.load !65
  %4 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %param_2.199 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %param_3.90 = load i64, i64* %arg2.3.typed, align 8, !invariant.load !65
  %5 = load i64, i64* bitcast ([8 x i8]* @1 to i64*), align 8
  %6 = add i64 %param_3.90, %5
  %7 = sitofp i64 %6 to float
  %8 = call float @__nv_powf(float %param_2.199, float %7)
  %subtract.31 = fsub float %4, %8
  %9 = call float @__nv_sqrtf(float %subtract.31)
  %multiply.39 = fmul float %param_1.170, %9
  %10 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %param_0.87 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %11 = call float @__nv_powf(float %param_0.87, float %7)
  %subtract.30 = fsub float %10, %11
  %divide.11 = fdiv float %multiply.39, %subtract.30
  store float %divide.11, float* %fusion.31.typed, align 4
  br label %fusion.31.in_bounds-after
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind readnone
declare float @__nv_powf(float, float) #0

; Function Attrs: nounwind readnone
declare float @__nv_sqrtf(float) #0

define void @copy_32(i8* noalias align 64 dereferenceable(3200) %alloc29, i8* noalias align 16 dereferenceable(3200) %alloc30, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %copy.32.raw = getelementptr inbounds i8, i8* %alloc29, i64 0
  %copy.32.typed = bitcast i8* %copy.32.raw to [32 x [1 x [5 x [5 x float]]]]*
  %arg7.8.raw = getelementptr inbounds i8, i8* %alloc30, i64 0
  %arg7.8.typed = bitcast i8* %arg7.8.raw to [5 x [5 x [1 x [32 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %2 = mul nuw nsw i32 %0, 200
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 5
  %5 = udiv i32 %linear_index_base, 5
  %6 = urem i32 %5, 5
  %7 = udiv i32 %linear_index_base, 25
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index_base, 25
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 5
  %12 = udiv i32 %linear_index1, 5
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index1, 25
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index1, 25
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 5
  %19 = udiv i32 %linear_index2, 5
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index2, 25
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 25
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 5
  %26 = udiv i32 %linear_index3, 5
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index3, 25
  %29 = urem i32 %28, 1
  %30 = udiv i32 %linear_index3, 25
  %31 = icmp ult i32 %linear_index_base, 800
  br i1 %31, label %copy.32.in_bounds-true, label %copy.32.in_bounds-after

copy.32.in_bounds-after:                          ; preds = %copy.32.in_bounds-true, %entry
  ret void

copy.32.in_bounds-true:                           ; preds = %entry
  %32 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %6, i32 %4, i32 0, i32 %9
  %33 = load float, float* %32, align 4, !invariant.load !65
  %34 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.32.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  store float %33, float* %35, align 4
  %36 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %13, i32 %11, i32 0, i32 %16
  %37 = load float, float* %36, align 4, !invariant.load !65
  %38 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.32.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %37, float* %39, align 4
  %40 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %20, i32 %18, i32 0, i32 %23
  %41 = load float, float* %40, align 4, !invariant.load !65
  %42 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.32.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index2
  store float %41, float* %43, align 4
  %44 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %27, i32 %25, i32 0, i32 %30
  %45 = load float, float* %44, align 4, !invariant.load !65
  %46 = bitcast [32 x [1 x [5 x [5 x float]]]]* %copy.32.typed to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  store float %45, float* %47, align 4
  br label %copy.32.in_bounds-after
}

define void @broadcast_84(i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 16 dereferenceable(40) %alloc63, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %broadcast.84.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %broadcast.84.typed = bitcast i8* %broadcast.84.raw to [1024 x [10 x float]]*
  %arg14.15.raw = getelementptr inbounds i8, i8* %alloc63, i64 0
  %arg14.15.typed = bitcast i8* %arg14.15.raw to [10 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10240
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index, 10
  %6 = icmp ult i32 %linear_index, 10240
  br i1 %6, label %broadcast.84.in_bounds-true, label %broadcast.84.in_bounds-after

broadcast.84.in_bounds-after:                     ; preds = %broadcast.84.in_bounds-true, %entry
  ret void

broadcast.84.in_bounds-true:                      ; preds = %entry
  %7 = urem i32 %linear_index, 10
  %8 = bitcast [10 x float]* %arg14.15.typed to float*
  %9 = getelementptr inbounds float, float* %8, i32 %7
  %10 = load float, float* %9, align 4, !invariant.load !65
  %11 = bitcast [1024 x [10 x float]]* %broadcast.84.typed to float*
  %12 = getelementptr inbounds float, float* %11, i32 %linear_index
  store float %10, float* %12, align 4
  br label %broadcast.84.in_bounds-after
}

define void @copy_33(i8* noalias align 64 dereferenceable(204800) %alloc15, i8* noalias align 16 dereferenceable(204800) %alloc16, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %copy.33.raw = getelementptr inbounds i8, i8* %alloc15, i64 0
  %copy.33.typed = bitcast i8* %copy.33.raw to [64 x [32 x [5 x [5 x float]]]]*
  %arg9.10.raw = getelementptr inbounds i8, i8* %alloc16, i64 0
  %arg9.10.typed = bitcast i8* %arg9.10.raw to [5 x [5 x [32 x [64 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !69
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 12800
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 5
  %5 = udiv i32 %linear_index_base, 5
  %6 = urem i32 %5, 5
  %7 = udiv i32 %linear_index_base, 25
  %8 = urem i32 %7, 32
  %9 = udiv i32 %linear_index_base, 800
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 5
  %12 = udiv i32 %linear_index1, 5
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index1, 25
  %15 = urem i32 %14, 32
  %16 = udiv i32 %linear_index1, 800
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 5
  %19 = udiv i32 %linear_index2, 5
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index2, 25
  %22 = urem i32 %21, 32
  %23 = udiv i32 %linear_index2, 800
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 5
  %26 = udiv i32 %linear_index3, 5
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index3, 25
  %29 = urem i32 %28, 32
  %30 = udiv i32 %linear_index3, 800
  %31 = icmp ult i32 %linear_index_base, 51200
  br i1 %31, label %copy.33.in_bounds-true, label %copy.33.in_bounds-after

copy.33.in_bounds-after:                          ; preds = %copy.33.in_bounds-true, %entry
  ret void

copy.33.in_bounds-true:                           ; preds = %entry
  %32 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %6, i32 %4, i32 %8, i32 %9
  %33 = load float, float* %32, align 4, !invariant.load !65
  %34 = bitcast [64 x [32 x [5 x [5 x float]]]]* %copy.33.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  store float %33, float* %35, align 4
  %36 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %13, i32 %11, i32 %15, i32 %16
  %37 = load float, float* %36, align 4, !invariant.load !65
  %38 = bitcast [64 x [32 x [5 x [5 x float]]]]* %copy.33.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %37, float* %39, align 4
  %40 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %20, i32 %18, i32 %22, i32 %23
  %41 = load float, float* %40, align 4, !invariant.load !65
  %42 = bitcast [64 x [32 x [5 x [5 x float]]]]* %copy.33.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index2
  store float %41, float* %43, align 4
  %44 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %27, i32 %25, i32 %29, i32 %30
  %45 = load float, float* %44, align 4, !invariant.load !65
  %46 = bitcast [64 x [32 x [5 x [5 x float]]]]* %copy.33.typed to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  store float %45, float* %47, align 4
  br label %copy.33.in_bounds-after
}

define void @broadcast_77(i8* noalias align 64 dereferenceable(819200) %alloc9, i8* noalias align 16 dereferenceable(512) %alloc40, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %broadcast.77.raw = getelementptr inbounds i8, i8* %alloc9, i64 0
  %broadcast.77.typed = bitcast i8* %broadcast.77.raw to [1024 x [128 x float]]*
  %arg12.13.raw = getelementptr inbounds i8, i8* %alloc40, i64 0
  %arg12.13.typed = bitcast i8* %arg12.13.raw to [128 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !71
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 131072
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 131072
  br i1 %6, label %broadcast.77.in_bounds-true, label %broadcast.77.in_bounds-after

broadcast.77.in_bounds-after:                     ; preds = %broadcast.77.in_bounds-true, %entry
  ret void

broadcast.77.in_bounds-true:                      ; preds = %entry
  %7 = urem i32 %linear_index, 128
  %8 = bitcast [128 x float]* %arg12.13.typed to float*
  %9 = getelementptr inbounds float, float* %8, i32 %7
  %10 = load float, float* %9, align 4, !invariant.load !65
  %11 = bitcast [1024 x [128 x float]]* %broadcast.77.typed to float*
  %12 = getelementptr inbounds float, float* %11, i32 %linear_index
  store float %10, float* %12, align 4
  br label %broadcast.77.in_bounds-after
}

define void @copy_34(i8* noalias align 16 dereferenceable(819200) %alloc10, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %copy.34.raw = getelementptr inbounds i8, i8* %temp_buf, i64 233606464
  %copy.34.typed = bitcast i8* %copy.34.raw to [128 x [64 x [5 x [5 x float]]]]*
  %arg11.12.raw = getelementptr inbounds i8, i8* %alloc10, i64 0
  %arg11.12.typed = bitcast i8* %arg11.12.raw to [5 x [5 x [64 x [128 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 51200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 5
  %5 = udiv i32 %linear_index_base, 5
  %6 = urem i32 %5, 5
  %7 = udiv i32 %linear_index_base, 25
  %8 = urem i32 %7, 64
  %9 = udiv i32 %linear_index_base, 1600
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 5
  %12 = udiv i32 %linear_index1, 5
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index1, 25
  %15 = urem i32 %14, 64
  %16 = udiv i32 %linear_index1, 1600
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 5
  %19 = udiv i32 %linear_index2, 5
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index2, 25
  %22 = urem i32 %21, 64
  %23 = udiv i32 %linear_index2, 1600
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 5
  %26 = udiv i32 %linear_index3, 5
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index3, 25
  %29 = urem i32 %28, 64
  %30 = udiv i32 %linear_index3, 1600
  %31 = icmp ult i32 %linear_index_base, 204800
  br i1 %31, label %copy.34.in_bounds-true, label %copy.34.in_bounds-after

copy.34.in_bounds-after:                          ; preds = %copy.34.in_bounds-true, %entry
  ret void

copy.34.in_bounds-true:                           ; preds = %entry
  %32 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %6, i32 %4, i32 %8, i32 %9
  %33 = load float, float* %32, align 4, !invariant.load !65
  %34 = bitcast [128 x [64 x [5 x [5 x float]]]]* %copy.34.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  store float %33, float* %35, align 4
  %36 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %13, i32 %11, i32 %15, i32 %16
  %37 = load float, float* %36, align 4, !invariant.load !65
  %38 = bitcast [128 x [64 x [5 x [5 x float]]]]* %copy.34.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %37, float* %39, align 4
  %40 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %20, i32 %18, i32 %22, i32 %23
  %41 = load float, float* %40, align 4, !invariant.load !65
  %42 = bitcast [128 x [64 x [5 x [5 x float]]]]* %copy.34.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index2
  store float %41, float* %43, align 4
  %44 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %27, i32 %25, i32 %29, i32 %30
  %45 = load float, float* %44, align 4, !invariant.load !65
  %46 = bitcast [128 x [64 x [5 x [5 x float]]]]* %copy.34.typed to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  store float %45, float* %47, align 4
  br label %copy.34.in_bounds-after
}

define void @reduce_window_66(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer4 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce-window.66.invar_address.window.3 = alloca i32, align 4
  %reduce-window.66.invar_address.window.2 = alloca i32, align 4
  %reduce-window.66.invar_address.window.1 = alloca i32, align 4
  %reduce-window.66.invar_address.window.0 = alloca i32, align 4
  %reduce_window_accum_ptr = alloca float, align 4
  %reduce-window.66.raw = getelementptr inbounds i8, i8* %temp_buf, i64 169643328
  %reduce-window.66.typed = bitcast i8* %reduce-window.66.raw to [1024 x [64 x [10 x [10 x float]]]]*
  %get-tuple-element.79.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %get-tuple-element.79.typed = bitcast i8* %get-tuple-element.79.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 6553600
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index, 10
  %6 = urem i32 %5, 10
  %7 = udiv i32 %linear_index, 100
  %8 = urem i32 %7, 64
  %9 = udiv i32 %linear_index, 6400
  %10 = icmp ult i32 %linear_index, 6553600
  br i1 %10, label %reduce-window.66.in_bounds-true, label %reduce-window.66.in_bounds-after

reduce-window.66.in_bounds-after:                 ; preds = %reduce-window.66.loop_exit.window.0, %entry
  ret void

reduce-window.66.in_bounds-true:                  ; preds = %entry
  %11 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %11, float* %reduce_window_accum_ptr, align 4
  store i32 0, i32* %reduce-window.66.invar_address.window.0, align 4
  br label %reduce-window.66.loop_header.window.0

reduce-window.66.loop_header.window.0:            ; preds = %reduce-window.66.loop_exit.window.1, %reduce-window.66.in_bounds-true
  %reduce-window.66.indvar.window.0 = load i32, i32* %reduce-window.66.invar_address.window.0, align 4
  %12 = icmp uge i32 %reduce-window.66.indvar.window.0, 1
  br i1 %12, label %reduce-window.66.loop_exit.window.0, label %reduce-window.66.loop_body.window.0

reduce-window.66.loop_body.window.0:              ; preds = %reduce-window.66.loop_header.window.0
  store i32 0, i32* %reduce-window.66.invar_address.window.1, align 4
  br label %reduce-window.66.loop_header.window.1

reduce-window.66.loop_header.window.1:            ; preds = %reduce-window.66.loop_exit.window.2, %reduce-window.66.loop_body.window.0
  %reduce-window.66.indvar.window.1 = load i32, i32* %reduce-window.66.invar_address.window.1, align 4
  %13 = icmp uge i32 %reduce-window.66.indvar.window.1, 1
  br i1 %13, label %reduce-window.66.loop_exit.window.1, label %reduce-window.66.loop_body.window.1

reduce-window.66.loop_body.window.1:              ; preds = %reduce-window.66.loop_header.window.1
  store i32 0, i32* %reduce-window.66.invar_address.window.2, align 4
  br label %reduce-window.66.loop_header.window.2

reduce-window.66.loop_header.window.2:            ; preds = %reduce-window.66.loop_exit.window.3, %reduce-window.66.loop_body.window.1
  %reduce-window.66.indvar.window.2 = load i32, i32* %reduce-window.66.invar_address.window.2, align 4
  %14 = icmp uge i32 %reduce-window.66.indvar.window.2, 2
  br i1 %14, label %reduce-window.66.loop_exit.window.2, label %reduce-window.66.loop_body.window.2

reduce-window.66.loop_body.window.2:              ; preds = %reduce-window.66.loop_header.window.2
  store i32 0, i32* %reduce-window.66.invar_address.window.3, align 4
  br label %reduce-window.66.loop_header.window.3

reduce-window.66.loop_header.window.3:            ; preds = %in_bounds-after, %reduce-window.66.loop_body.window.2
  %reduce-window.66.indvar.window.3 = load i32, i32* %reduce-window.66.invar_address.window.3, align 4
  %15 = icmp uge i32 %reduce-window.66.indvar.window.3, 2
  br i1 %15, label %reduce-window.66.loop_exit.window.3, label %reduce-window.66.loop_body.window.3

reduce-window.66.loop_body.window.3:              ; preds = %reduce-window.66.loop_header.window.3
  %16 = mul nsw i32 %9, 1
  %17 = mul nsw i32 %reduce-window.66.indvar.window.0, 1
  %18 = add nsw i32 %16, %17
  %19 = sub nsw i32 %18, 0
  %20 = srem i32 %19, 1
  %21 = icmp eq i32 %20, 0
  %22 = and i1 true, %21
  %23 = sdiv i32 %19, 1
  %24 = icmp ult i32 %23, 1024
  %25 = and i1 %22, %24
  %26 = mul nsw i32 %8, 1
  %27 = mul nsw i32 %reduce-window.66.indvar.window.1, 1
  %28 = add nsw i32 %26, %27
  %29 = sub nsw i32 %28, 0
  %30 = srem i32 %29, 1
  %31 = icmp eq i32 %30, 0
  %32 = and i1 %25, %31
  %33 = sdiv i32 %29, 1
  %34 = icmp ult i32 %33, 64
  %35 = and i1 %32, %34
  %36 = mul nsw i32 %6, 2
  %37 = mul nsw i32 %reduce-window.66.indvar.window.2, 1
  %38 = add nsw i32 %36, %37
  %39 = sub nsw i32 %38, 0
  %40 = srem i32 %39, 1
  %41 = icmp eq i32 %40, 0
  %42 = and i1 %35, %41
  %43 = sdiv i32 %39, 1
  %44 = icmp ult i32 %43, 20
  %45 = and i1 %42, %44
  %46 = mul nsw i32 %4, 2
  %47 = mul nsw i32 %reduce-window.66.indvar.window.3, 1
  %48 = add nsw i32 %46, %47
  %49 = sub nsw i32 %48, 0
  %50 = srem i32 %49, 1
  %51 = icmp eq i32 %50, 0
  %52 = and i1 %45, %51
  %53 = sdiv i32 %49, 1
  %54 = icmp ult i32 %53, 20
  %55 = and i1 %52, %54
  br i1 %55, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %invar.inc3 = add nuw nsw i32 %reduce-window.66.indvar.window.3, 1
  store i32 %invar.inc3, i32* %reduce-window.66.invar_address.window.3, align 4
  br label %reduce-window.66.loop_header.window.3

reduce-window.66.loop_exit.window.3:              ; preds = %reduce-window.66.loop_header.window.3
  %invar.inc2 = add nuw nsw i32 %reduce-window.66.indvar.window.2, 1
  store i32 %invar.inc2, i32* %reduce-window.66.invar_address.window.2, align 4
  br label %reduce-window.66.loop_header.window.2

reduce-window.66.loop_exit.window.2:              ; preds = %reduce-window.66.loop_header.window.2
  %invar.inc1 = add nuw nsw i32 %reduce-window.66.indvar.window.1, 1
  store i32 %invar.inc1, i32* %reduce-window.66.invar_address.window.1, align 4
  br label %reduce-window.66.loop_header.window.1

reduce-window.66.loop_exit.window.1:              ; preds = %reduce-window.66.loop_header.window.1
  %invar.inc = add nuw nsw i32 %reduce-window.66.indvar.window.0, 1
  store i32 %invar.inc, i32* %reduce-window.66.invar_address.window.0, align 4
  br label %reduce-window.66.loop_header.window.0

reduce-window.66.loop_exit.window.0:              ; preds = %reduce-window.66.loop_header.window.0
  %56 = load float, float* %reduce_window_accum_ptr, align 4
  %57 = bitcast [1024 x [64 x [10 x [10 x float]]]]* %reduce-window.66.typed to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index
  store float %56, float* %58, align 4
  br label %reduce-window.66.in_bounds-after

in_bounds-true:                                   ; preds = %reduce-window.66.loop_body.window.3
  %59 = getelementptr inbounds [1024 x [64 x [20 x [20 x float]]]], [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed, i32 0, i32 %23, i32 %33, i32 %43, i32 %53
  %60 = load float, float* %59, align 4, !invariant.load !65
  %61 = load float, float* %reduce_window_accum_ptr, align 4
  store float %61, float* %parameter_buffer, align 4
  store float %60, float* %parameter_buffer4, align 4
  call void @max_F32_62(float* %parameter_buffer, float* %parameter_buffer4, float* %return_buffer)
  %62 = load float, float* %return_buffer, align 4
  store float %62, float* %reduce_window_accum_ptr, align 4
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce-window.66.loop_body.window.3
  br label %in_bounds-after
}

define internal void @max_F32_62(float* dereferenceable(4) %lhs.63.typed, float* dereferenceable(4) %rhs.64.typed, float* dereferenceable(4) %output_arg) {
entry:
  %maximum.65.typed = alloca float, align 4
  %0 = load float, float* %lhs.63.typed, align 4
  %1 = load float, float* %rhs.64.typed, align 4
  %2 = call float @llvm.maxnum.f32(float %0, float %1)
  store float %2, float* %maximum.65.typed, align 4
  %load_ret_value = load float, float* %maximum.65.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

define void @fusion_45(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.45.raw = getelementptr inbounds i8, i8* %temp_buf, i64 195857728
  %fusion.45.typed = bitcast i8* %fusion.45.raw to [1024 x [4608 x float]]*
  %get-tuple-element.80.raw = getelementptr inbounds i8, i8* %temp_buf, i64 214732096
  %get-tuple-element.80.typed = bitcast i8* %get-tuple-element.80.raw to [1024 x [128 x [6 x [6 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1179648
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 4608
  %5 = udiv i32 %linear_index_base, 4608
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 4608
  %8 = udiv i32 %linear_index1, 4608
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 4608
  %11 = udiv i32 %linear_index2, 4608
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 4608
  %14 = udiv i32 %linear_index3, 4608
  %15 = icmp ult i32 %linear_index_base, 4718592
  br i1 %15, label %fusion.45.in_bounds-true, label %fusion.45.in_bounds-after

fusion.45.in_bounds-after:                        ; preds = %fusion.45.in_bounds-true, %entry
  ret void

fusion.45.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 128
  %19 = udiv i32 %17, 128
  %20 = urem i32 %19, 6
  %21 = udiv i32 %19, 6
  %22 = udiv i32 %21, 6
  %23 = mul nuw nsw i32 %5, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 1024
  %param_0.70 = getelementptr inbounds [1024 x [128 x [6 x [6 x float]]]], [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed, i32 0, i32 %24, i32 %18, i32 %21, i32 %20
  %param_0.704 = load float, float* %param_0.70, align 4, !invariant.load !65
  %26 = bitcast [1024 x [4608 x float]]* %fusion.45.typed to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  store float %param_0.704, float* %27, align 4
  %28 = mul nuw nsw i32 %7, 1
  %29 = add nuw nsw i32 0, %28
  %30 = urem i32 %29, 128
  %31 = udiv i32 %29, 128
  %32 = urem i32 %31, 6
  %33 = udiv i32 %31, 6
  %34 = udiv i32 %33, 6
  %35 = mul nuw nsw i32 %8, 1
  %36 = add nuw nsw i32 0, %35
  %37 = udiv i32 %36, 1024
  %param_0.705 = getelementptr inbounds [1024 x [128 x [6 x [6 x float]]]], [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed, i32 0, i32 %36, i32 %30, i32 %33, i32 %32
  %param_0.706 = load float, float* %param_0.705, align 4, !invariant.load !65
  %38 = bitcast [1024 x [4608 x float]]* %fusion.45.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %param_0.706, float* %39, align 4
  %40 = mul nuw nsw i32 %10, 1
  %41 = add nuw nsw i32 0, %40
  %42 = urem i32 %41, 128
  %43 = udiv i32 %41, 128
  %44 = urem i32 %43, 6
  %45 = udiv i32 %43, 6
  %46 = udiv i32 %45, 6
  %47 = mul nuw nsw i32 %11, 1
  %48 = add nuw nsw i32 0, %47
  %49 = udiv i32 %48, 1024
  %param_0.707 = getelementptr inbounds [1024 x [128 x [6 x [6 x float]]]], [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed, i32 0, i32 %48, i32 %42, i32 %45, i32 %44
  %param_0.708 = load float, float* %param_0.707, align 4, !invariant.load !65
  %50 = bitcast [1024 x [4608 x float]]* %fusion.45.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index2
  store float %param_0.708, float* %51, align 4
  %52 = mul nuw nsw i32 %13, 1
  %53 = add nuw nsw i32 0, %52
  %54 = urem i32 %53, 128
  %55 = udiv i32 %53, 128
  %56 = urem i32 %55, 6
  %57 = udiv i32 %55, 6
  %58 = udiv i32 %57, 6
  %59 = mul nuw nsw i32 %14, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 1024
  %param_0.709 = getelementptr inbounds [1024 x [128 x [6 x [6 x float]]]], [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed, i32 0, i32 %60, i32 %54, i32 %57, i32 %56
  %param_0.7010 = load float, float* %param_0.709, align 4, !invariant.load !65
  %62 = bitcast [1024 x [4608 x float]]* %fusion.45.typed to float*
  %63 = getelementptr inbounds float, float* %62, i32 %linear_index3
  store float %param_0.7010, float* %63, align 4
  br label %fusion.45.in_bounds-after
}

define void @fusion_48(i8* noalias align 64 dereferenceable(819200) %alloc8, i8* noalias align 64 dereferenceable(819200) %alloc9, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.48.raw = getelementptr inbounds i8, i8* %alloc8, i64 0
  %fusion.48.typed = bitcast i8* %fusion.48.raw to [1024 x [128 x float]]*
  %custom-call.12.raw = getelementptr inbounds i8, i8* %alloc9, i64 0
  %custom-call.12.typed = bitcast i8* %custom-call.12.raw to [1024 x [128 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !71
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 128
  %8 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 128
  %11 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 128
  %14 = udiv i32 %linear_index3, 128
  %15 = icmp ult i32 %linear_index_base, 131072
  br i1 %15, label %fusion.48.in_bounds-true, label %fusion.48.in_bounds-after

fusion.48.in_bounds-after:                        ; preds = %fusion.48.in_bounds-true, %entry
  ret void

fusion.48.in_bounds-true:                         ; preds = %entry
  %16 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %17 = bitcast [1024 x [128 x float]]* %custom-call.12.typed to float*
  %param_0.97 = getelementptr inbounds float, float* %17, i32 %linear_index_base
  %param_0.974 = load float, float* %param_0.97, align 4, !invariant.load !65
  %18 = call float @llvm.maxnum.f32(float %16, float %param_0.974)
  %19 = bitcast [1024 x [128 x float]]* %fusion.48.typed to float*
  %20 = getelementptr inbounds float, float* %19, i32 %linear_index_base
  store float %18, float* %20, align 4
  %21 = load float, float* bitcast ([4 x i8]* @4 to float*), align 4
  %22 = bitcast [1024 x [128 x float]]* %custom-call.12.typed to float*
  %param_0.975 = getelementptr inbounds float, float* %22, i32 %linear_index1
  %param_0.976 = load float, float* %param_0.975, align 4, !invariant.load !65
  %23 = call float @llvm.maxnum.f32(float %21, float %param_0.976)
  %24 = bitcast [1024 x [128 x float]]* %fusion.48.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index1
  store float %23, float* %25, align 4
  %26 = load float, float* bitcast ([4 x i8]* @5 to float*), align 4
  %27 = bitcast [1024 x [128 x float]]* %custom-call.12.typed to float*
  %param_0.977 = getelementptr inbounds float, float* %27, i32 %linear_index2
  %param_0.978 = load float, float* %param_0.977, align 4, !invariant.load !65
  %28 = call float @llvm.maxnum.f32(float %26, float %param_0.978)
  %29 = bitcast [1024 x [128 x float]]* %fusion.48.typed to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index2
  store float %28, float* %30, align 4
  %31 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  %32 = bitcast [1024 x [128 x float]]* %custom-call.12.typed to float*
  %param_0.979 = getelementptr inbounds float, float* %32, i32 %linear_index3
  %param_0.9710 = load float, float* %param_0.979, align 4, !invariant.load !65
  %33 = call float @llvm.maxnum.f32(float %31, float %param_0.9710)
  %34 = bitcast [1024 x [128 x float]]* %fusion.48.typed to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index3
  store float %33, float* %35, align 4
  br label %fusion.48.in_bounds-after
}

define void @reduce(i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer34 = alloca float, align 4
  %parameter_buffer33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %reduce.inner.invar_address.reduction_dim.129 = alloca i32, align 4
  %accumulator_025 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %reduce.inner.invar_address.reduction_dim.119 = alloca i32, align 4
  %accumulator_015 = alloca float, align 4
  %parameter_buffer14 = alloca float, align 4
  %parameter_buffer13 = alloca float, align 4
  %return_buffer12 = alloca float, align 4
  %reduce.inner.invar_address.reduction_dim.19 = alloca i32, align 4
  %accumulator_05 = alloca float, align 4
  %parameter_buffer4 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %reduce.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %reduce.typed = bitcast i8* %reduce.raw to [1024 x float]*
  %custom-call.14.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %custom-call.14.typed = bitcast i8* %custom-call.14.raw to [1024 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %4 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %6 = udiv i32 %linear_index3, 1
  %7 = icmp ult i32 %linear_index_base, 1024
  br i1 %7, label %reduce.in_bounds-true, label %reduce.in_bounds-after

reduce.in_bounds-after:                           ; preds = %reduce.inner.loop_exit.reduction_dim.126, %entry
  ret void

reduce.in_bounds-true:                            ; preds = %entry
  %8 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %8, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.inner.loop_header.reduction_dim.1

reduce.inner.loop_header.reduction_dim.1:         ; preds = %reduce.inner.loop_body.reduction_dim.1, %reduce.in_bounds-true
  %reduce.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.inner.loop_exit.reduction_dim.1, label %reduce.inner.loop_body.reduction_dim.1

reduce.inner.loop_body.reduction_dim.1:           ; preds = %reduce.inner.loop_header.reduction_dim.1
  %10 = load float, float* %accumulator_0, align 4
  %11 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %custom-call.14.typed, i32 0, i32 %3, i32 %reduce.inner.indvar.reduction_dim.1
  %12 = load float, float* %11, align 4, !invariant.load !65
  store float %10, float* %parameter_buffer, align 4
  store float %12, float* %parameter_buffer4, align 4
  call void @scalar_max_computation(float* %parameter_buffer, float* %parameter_buffer4, float* %return_buffer)
  %13 = load float, float* %return_buffer, align 4
  store float %13, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.inner.loop_header.reduction_dim.1

reduce.inner.loop_exit.reduction_dim.1:           ; preds = %reduce.inner.loop_header.reduction_dim.1
  %14 = load float, float* %accumulator_0, align 4
  %15 = bitcast [1024 x float]* %reduce.typed to float*
  %16 = getelementptr inbounds float, float* %15, i32 %linear_index_base
  store float %14, float* %16, align 4
  %17 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %17, float* %accumulator_05, align 4
  store i32 0, i32* %reduce.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.inner.loop_header.reduction_dim.17

reduce.inner.loop_header.reduction_dim.17:        ; preds = %reduce.inner.loop_body.reduction_dim.18, %reduce.inner.loop_exit.reduction_dim.1
  %reduce.inner.indvar.reduction_dim.110 = load i32, i32* %reduce.inner.invar_address.reduction_dim.19, align 4
  %18 = icmp uge i32 %reduce.inner.indvar.reduction_dim.110, 10
  br i1 %18, label %reduce.inner.loop_exit.reduction_dim.16, label %reduce.inner.loop_body.reduction_dim.18

reduce.inner.loop_body.reduction_dim.18:          ; preds = %reduce.inner.loop_header.reduction_dim.17
  %19 = load float, float* %accumulator_05, align 4
  %20 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %custom-call.14.typed, i32 0, i32 %4, i32 %reduce.inner.indvar.reduction_dim.110
  %21 = load float, float* %20, align 4, !invariant.load !65
  store float %19, float* %parameter_buffer13, align 4
  store float %21, float* %parameter_buffer14, align 4
  call void @scalar_max_computation(float* %parameter_buffer13, float* %parameter_buffer14, float* %return_buffer12)
  %22 = load float, float* %return_buffer12, align 4
  store float %22, float* %accumulator_05, align 4
  %invar.inc11 = add nuw nsw i32 %reduce.inner.indvar.reduction_dim.110, 1
  store i32 %invar.inc11, i32* %reduce.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.inner.loop_header.reduction_dim.17

reduce.inner.loop_exit.reduction_dim.16:          ; preds = %reduce.inner.loop_header.reduction_dim.17
  %23 = load float, float* %accumulator_05, align 4
  %24 = bitcast [1024 x float]* %reduce.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index1
  store float %23, float* %25, align 4
  %26 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %26, float* %accumulator_015, align 4
  store i32 0, i32* %reduce.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.inner.loop_header.reduction_dim.117

reduce.inner.loop_header.reduction_dim.117:       ; preds = %reduce.inner.loop_body.reduction_dim.118, %reduce.inner.loop_exit.reduction_dim.16
  %reduce.inner.indvar.reduction_dim.120 = load i32, i32* %reduce.inner.invar_address.reduction_dim.119, align 4
  %27 = icmp uge i32 %reduce.inner.indvar.reduction_dim.120, 10
  br i1 %27, label %reduce.inner.loop_exit.reduction_dim.116, label %reduce.inner.loop_body.reduction_dim.118

reduce.inner.loop_body.reduction_dim.118:         ; preds = %reduce.inner.loop_header.reduction_dim.117
  %28 = load float, float* %accumulator_015, align 4
  %29 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %custom-call.14.typed, i32 0, i32 %5, i32 %reduce.inner.indvar.reduction_dim.120
  %30 = load float, float* %29, align 4, !invariant.load !65
  store float %28, float* %parameter_buffer23, align 4
  store float %30, float* %parameter_buffer24, align 4
  call void @scalar_max_computation(float* %parameter_buffer23, float* %parameter_buffer24, float* %return_buffer22)
  %31 = load float, float* %return_buffer22, align 4
  store float %31, float* %accumulator_015, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, i32* %reduce.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.inner.loop_header.reduction_dim.117

reduce.inner.loop_exit.reduction_dim.116:         ; preds = %reduce.inner.loop_header.reduction_dim.117
  %32 = load float, float* %accumulator_015, align 4
  %33 = bitcast [1024 x float]* %reduce.typed to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index2
  store float %32, float* %34, align 4
  %35 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %35, float* %accumulator_025, align 4
  store i32 0, i32* %reduce.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.inner.loop_header.reduction_dim.127

reduce.inner.loop_header.reduction_dim.127:       ; preds = %reduce.inner.loop_body.reduction_dim.128, %reduce.inner.loop_exit.reduction_dim.116
  %reduce.inner.indvar.reduction_dim.130 = load i32, i32* %reduce.inner.invar_address.reduction_dim.129, align 4
  %36 = icmp uge i32 %reduce.inner.indvar.reduction_dim.130, 10
  br i1 %36, label %reduce.inner.loop_exit.reduction_dim.126, label %reduce.inner.loop_body.reduction_dim.128

reduce.inner.loop_body.reduction_dim.128:         ; preds = %reduce.inner.loop_header.reduction_dim.127
  %37 = load float, float* %accumulator_025, align 4
  %38 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %custom-call.14.typed, i32 0, i32 %6, i32 %reduce.inner.indvar.reduction_dim.130
  %39 = load float, float* %38, align 4, !invariant.load !65
  store float %37, float* %parameter_buffer33, align 4
  store float %39, float* %parameter_buffer34, align 4
  call void @scalar_max_computation(float* %parameter_buffer33, float* %parameter_buffer34, float* %return_buffer32)
  %40 = load float, float* %return_buffer32, align 4
  store float %40, float* %accumulator_025, align 4
  %invar.inc31 = add nuw nsw i32 %reduce.inner.indvar.reduction_dim.130, 1
  store i32 %invar.inc31, i32* %reduce.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.inner.loop_header.reduction_dim.127

reduce.inner.loop_exit.reduction_dim.126:         ; preds = %reduce.inner.loop_header.reduction_dim.127
  %41 = load float, float* %accumulator_025, align 4
  %42 = bitcast [1024 x float]* %reduce.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index3
  store float %41, float* %43, align 4
  br label %reduce.in_bounds-after
}

define internal void @scalar_max_computation(float* dereferenceable(4) %scalar_lhs.typed, float* dereferenceable(4) %scalar_rhs.typed, float* dereferenceable(4) %output_arg) {
entry:
  %maximum.typed = alloca float, align 4
  %0 = load float, float* %scalar_lhs.typed, align 4
  %1 = load float, float* %scalar_rhs.typed, align 4
  %2 = call float @llvm.maxnum.f32(float %0, float %1)
  store float %2, float* %maximum.typed, align 4
  %load_ret_value = load float, float* %maximum.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_44(i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.44.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %fusion.44.typed = bitcast i8* %fusion.44.raw to [1024 x [10 x float]]*
  %custom-call.14.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %custom-call.14.typed = bitcast i8* %custom-call.14.raw to [1024 x [10 x float]]*
  %reduce.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %reduce.typed = bitcast i8* %reduce.raw to [1024 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2560
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 10
  %8 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 10
  %11 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 10
  %14 = udiv i32 %linear_index3, 10
  %15 = icmp ult i32 %linear_index_base, 10240
  br i1 %15, label %fusion.44.in_bounds-true, label %fusion.44.in_bounds-after

fusion.44.in_bounds-after:                        ; preds = %fusion.44.in_bounds-true, %entry
  ret void

fusion.44.in_bounds-true:                         ; preds = %entry
  %16 = bitcast [1024 x [10 x float]]* %custom-call.14.typed to float*
  %param_0.67 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %param_0.674 = load float, float* %param_0.67, align 4
  %17 = udiv i32 %linear_index_base, 10
  %18 = bitcast [1024 x float]* %reduce.typed to float*
  %param_1.132 = getelementptr inbounds float, float* %18, i32 %17
  %param_1.1325 = load float, float* %param_1.132, align 4, !invariant.load !65
  %subtract.37 = fsub float %param_0.674, %param_1.1325
  %19 = call float @__nv_expf(float %subtract.37)
  %20 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %21 = getelementptr inbounds float, float* %20, i32 %linear_index_base
  store float %19, float* %21, align 4
  %22 = bitcast [1024 x [10 x float]]* %custom-call.14.typed to float*
  %param_0.676 = getelementptr inbounds float, float* %22, i32 %linear_index1
  %param_0.677 = load float, float* %param_0.676, align 4
  %23 = udiv i32 %linear_index1, 10
  %24 = bitcast [1024 x float]* %reduce.typed to float*
  %param_1.1328 = getelementptr inbounds float, float* %24, i32 %23
  %param_1.1329 = load float, float* %param_1.1328, align 4, !invariant.load !65
  %subtract.3710 = fsub float %param_0.677, %param_1.1329
  %25 = call float @__nv_expf(float %subtract.3710)
  %26 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  store float %25, float* %27, align 4
  %28 = bitcast [1024 x [10 x float]]* %custom-call.14.typed to float*
  %param_0.6711 = getelementptr inbounds float, float* %28, i32 %linear_index2
  %param_0.6712 = load float, float* %param_0.6711, align 4
  %29 = udiv i32 %linear_index2, 10
  %30 = bitcast [1024 x float]* %reduce.typed to float*
  %param_1.13213 = getelementptr inbounds float, float* %30, i32 %29
  %param_1.13214 = load float, float* %param_1.13213, align 4, !invariant.load !65
  %subtract.3715 = fsub float %param_0.6712, %param_1.13214
  %31 = call float @__nv_expf(float %subtract.3715)
  %32 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index2
  store float %31, float* %33, align 4
  %34 = bitcast [1024 x [10 x float]]* %custom-call.14.typed to float*
  %param_0.6716 = getelementptr inbounds float, float* %34, i32 %linear_index3
  %param_0.6717 = load float, float* %param_0.6716, align 4
  %35 = udiv i32 %linear_index3, 10
  %36 = bitcast [1024 x float]* %reduce.typed to float*
  %param_1.13218 = getelementptr inbounds float, float* %36, i32 %35
  %param_1.13219 = load float, float* %param_1.13218, align 4, !invariant.load !65
  %subtract.3720 = fsub float %param_0.6717, %param_1.13219
  %37 = call float @__nv_expf(float %subtract.3720)
  %38 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index3
  store float %37, float* %39, align 4
  br label %fusion.44.in_bounds-after
}

; Function Attrs: nounwind readnone
declare float @__nv_expf(float) #0

define void @reduce_1(i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer34 = alloca float, align 4
  %parameter_buffer33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %reduce.1.inner.invar_address.reduction_dim.129 = alloca i32, align 4
  %accumulator_025 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %reduce.1.inner.invar_address.reduction_dim.119 = alloca i32, align 4
  %accumulator_015 = alloca float, align 4
  %parameter_buffer14 = alloca float, align 4
  %parameter_buffer13 = alloca float, align 4
  %return_buffer12 = alloca float, align 4
  %reduce.1.inner.invar_address.reduction_dim.19 = alloca i32, align 4
  %accumulator_05 = alloca float, align 4
  %parameter_buffer4 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.1.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %reduce.1.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %reduce.1.typed = bitcast i8* %reduce.1.raw to [1024 x float]*
  %fusion.44.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %fusion.44.typed = bitcast i8* %fusion.44.raw to [1024 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %4 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %6 = udiv i32 %linear_index3, 1
  %7 = icmp ult i32 %linear_index_base, 1024
  br i1 %7, label %reduce.1.in_bounds-true, label %reduce.1.in_bounds-after

reduce.1.in_bounds-after:                         ; preds = %reduce.1.inner.loop_exit.reduction_dim.126, %entry
  ret void

reduce.1.in_bounds-true:                          ; preds = %entry
  %8 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_41 to float*), align 4, !invariant.load !65
  store float %8, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.1.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.1

reduce.1.inner.loop_header.reduction_dim.1:       ; preds = %reduce.1.inner.loop_body.reduction_dim.1, %reduce.1.in_bounds-true
  %reduce.1.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.1.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.1.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.1.inner.loop_exit.reduction_dim.1, label %reduce.1.inner.loop_body.reduction_dim.1

reduce.1.inner.loop_body.reduction_dim.1:         ; preds = %reduce.1.inner.loop_header.reduction_dim.1
  %10 = load float, float* %accumulator_0, align 4
  %11 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %3, i32 %reduce.1.inner.indvar.reduction_dim.1
  %12 = load float, float* %11, align 4, !invariant.load !65
  store float %10, float* %parameter_buffer, align 4
  store float %12, float* %parameter_buffer4, align 4
  call void @scalar_add_computation(float* %parameter_buffer, float* %parameter_buffer4, float* %return_buffer)
  %13 = load float, float* %return_buffer, align 4
  store float %13, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.1.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.1.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.1

reduce.1.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.1.inner.loop_header.reduction_dim.1
  %14 = load float, float* %accumulator_0, align 4
  %15 = bitcast [1024 x float]* %reduce.1.typed to float*
  %16 = getelementptr inbounds float, float* %15, i32 %linear_index_base
  store float %14, float* %16, align 4
  %17 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_41 to float*), align 4, !invariant.load !65
  store float %17, float* %accumulator_05, align 4
  store i32 0, i32* %reduce.1.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.17

reduce.1.inner.loop_header.reduction_dim.17:      ; preds = %reduce.1.inner.loop_body.reduction_dim.18, %reduce.1.inner.loop_exit.reduction_dim.1
  %reduce.1.inner.indvar.reduction_dim.110 = load i32, i32* %reduce.1.inner.invar_address.reduction_dim.19, align 4
  %18 = icmp uge i32 %reduce.1.inner.indvar.reduction_dim.110, 10
  br i1 %18, label %reduce.1.inner.loop_exit.reduction_dim.16, label %reduce.1.inner.loop_body.reduction_dim.18

reduce.1.inner.loop_body.reduction_dim.18:        ; preds = %reduce.1.inner.loop_header.reduction_dim.17
  %19 = load float, float* %accumulator_05, align 4
  %20 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %4, i32 %reduce.1.inner.indvar.reduction_dim.110
  %21 = load float, float* %20, align 4, !invariant.load !65
  store float %19, float* %parameter_buffer13, align 4
  store float %21, float* %parameter_buffer14, align 4
  call void @scalar_add_computation(float* %parameter_buffer13, float* %parameter_buffer14, float* %return_buffer12)
  %22 = load float, float* %return_buffer12, align 4
  store float %22, float* %accumulator_05, align 4
  %invar.inc11 = add nuw nsw i32 %reduce.1.inner.indvar.reduction_dim.110, 1
  store i32 %invar.inc11, i32* %reduce.1.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.17

reduce.1.inner.loop_exit.reduction_dim.16:        ; preds = %reduce.1.inner.loop_header.reduction_dim.17
  %23 = load float, float* %accumulator_05, align 4
  %24 = bitcast [1024 x float]* %reduce.1.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index1
  store float %23, float* %25, align 4
  %26 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_41 to float*), align 4, !invariant.load !65
  store float %26, float* %accumulator_015, align 4
  store i32 0, i32* %reduce.1.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.117

reduce.1.inner.loop_header.reduction_dim.117:     ; preds = %reduce.1.inner.loop_body.reduction_dim.118, %reduce.1.inner.loop_exit.reduction_dim.16
  %reduce.1.inner.indvar.reduction_dim.120 = load i32, i32* %reduce.1.inner.invar_address.reduction_dim.119, align 4
  %27 = icmp uge i32 %reduce.1.inner.indvar.reduction_dim.120, 10
  br i1 %27, label %reduce.1.inner.loop_exit.reduction_dim.116, label %reduce.1.inner.loop_body.reduction_dim.118

reduce.1.inner.loop_body.reduction_dim.118:       ; preds = %reduce.1.inner.loop_header.reduction_dim.117
  %28 = load float, float* %accumulator_015, align 4
  %29 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %5, i32 %reduce.1.inner.indvar.reduction_dim.120
  %30 = load float, float* %29, align 4, !invariant.load !65
  store float %28, float* %parameter_buffer23, align 4
  store float %30, float* %parameter_buffer24, align 4
  call void @scalar_add_computation(float* %parameter_buffer23, float* %parameter_buffer24, float* %return_buffer22)
  %31 = load float, float* %return_buffer22, align 4
  store float %31, float* %accumulator_015, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.1.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, i32* %reduce.1.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.117

reduce.1.inner.loop_exit.reduction_dim.116:       ; preds = %reduce.1.inner.loop_header.reduction_dim.117
  %32 = load float, float* %accumulator_015, align 4
  %33 = bitcast [1024 x float]* %reduce.1.typed to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index2
  store float %32, float* %34, align 4
  %35 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_41 to float*), align 4, !invariant.load !65
  store float %35, float* %accumulator_025, align 4
  store i32 0, i32* %reduce.1.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.127

reduce.1.inner.loop_header.reduction_dim.127:     ; preds = %reduce.1.inner.loop_body.reduction_dim.128, %reduce.1.inner.loop_exit.reduction_dim.116
  %reduce.1.inner.indvar.reduction_dim.130 = load i32, i32* %reduce.1.inner.invar_address.reduction_dim.129, align 4
  %36 = icmp uge i32 %reduce.1.inner.indvar.reduction_dim.130, 10
  br i1 %36, label %reduce.1.inner.loop_exit.reduction_dim.126, label %reduce.1.inner.loop_body.reduction_dim.128

reduce.1.inner.loop_body.reduction_dim.128:       ; preds = %reduce.1.inner.loop_header.reduction_dim.127
  %37 = load float, float* %accumulator_025, align 4
  %38 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %6, i32 %reduce.1.inner.indvar.reduction_dim.130
  %39 = load float, float* %38, align 4, !invariant.load !65
  store float %37, float* %parameter_buffer33, align 4
  store float %39, float* %parameter_buffer34, align 4
  call void @scalar_add_computation(float* %parameter_buffer33, float* %parameter_buffer34, float* %return_buffer32)
  %40 = load float, float* %return_buffer32, align 4
  store float %40, float* %accumulator_025, align 4
  %invar.inc31 = add nuw nsw i32 %reduce.1.inner.indvar.reduction_dim.130, 1
  store i32 %invar.inc31, i32* %reduce.1.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.1.inner.loop_header.reduction_dim.127

reduce.1.inner.loop_exit.reduction_dim.126:       ; preds = %reduce.1.inner.loop_header.reduction_dim.127
  %41 = load float, float* %accumulator_025, align 4
  %42 = bitcast [1024 x float]* %reduce.1.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index3
  store float %41, float* %43, align 4
  br label %reduce.1.in_bounds-after
}

define internal void @scalar_add_computation(float* dereferenceable(4) %scalar_lhs.1.typed, float* dereferenceable(4) %scalar_rhs.1.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.typed = alloca float, align 4
  %0 = load float, float* %scalar_lhs.1.typed, align 4
  %1 = load float, float* %scalar_rhs.1.typed, align 4
  %add = fadd float %0, %1
  store float %add, float* %add.typed, align 4
  %load_ret_value = load float, float* %add.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_47(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.47.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.47.typed = bitcast i8* %fusion.47.raw to [1024 x [10 x float]]*
  %fusion.44.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %fusion.44.typed = bitcast i8* %fusion.44.raw to [1024 x [10 x float]]*
  %reduce.1.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %reduce.1.typed = bitcast i8* %reduce.1.raw to [1024 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2560
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 10
  %8 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 10
  %11 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 10
  %14 = udiv i32 %linear_index3, 10
  %15 = icmp ult i32 %linear_index_base, 10240
  br i1 %15, label %fusion.47.in_bounds-true, label %fusion.47.in_bounds-after

fusion.47.in_bounds-after:                        ; preds = %fusion.47.in_bounds-true, %entry
  ret void

fusion.47.in_bounds-true:                         ; preds = %entry
  %16 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %17 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %param_0.99 = getelementptr inbounds float, float* %17, i32 %linear_index_base
  %param_0.994 = load float, float* %param_0.99, align 4, !invariant.load !65
  %18 = udiv i32 %linear_index_base, 10
  %19 = bitcast [1024 x float]* %reduce.1.typed to float*
  %param_1.184 = getelementptr inbounds float, float* %19, i32 %18
  %param_1.1845 = load float, float* %param_1.184, align 4, !invariant.load !65
  %divide.16 = fdiv float %param_0.994, %param_1.1845
  %20 = load float, float* bitcast ([4 x i8]* @8 to float*), align 4
  %21 = fcmp uge float %16, %divide.16
  %22 = select i1 %21, float %16, float %divide.16
  %23 = fcmp ule float %20, %22
  %24 = select i1 %23, float %20, float %22
  %25 = call float @__nv_logf(float %24)
  %26 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  store float %25, float* %27, align 4
  %28 = load float, float* bitcast ([4 x i8]* @9 to float*), align 4
  %29 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %param_0.996 = getelementptr inbounds float, float* %29, i32 %linear_index1
  %param_0.997 = load float, float* %param_0.996, align 4, !invariant.load !65
  %30 = udiv i32 %linear_index1, 10
  %31 = bitcast [1024 x float]* %reduce.1.typed to float*
  %param_1.1848 = getelementptr inbounds float, float* %31, i32 %30
  %param_1.1849 = load float, float* %param_1.1848, align 4, !invariant.load !65
  %divide.1610 = fdiv float %param_0.997, %param_1.1849
  %32 = load float, float* bitcast ([4 x i8]* @10 to float*), align 4
  %33 = fcmp uge float %28, %divide.1610
  %34 = select i1 %33, float %28, float %divide.1610
  %35 = fcmp ule float %32, %34
  %36 = select i1 %35, float %32, float %34
  %37 = call float @__nv_logf(float %36)
  %38 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index1
  store float %37, float* %39, align 4
  %40 = load float, float* bitcast ([4 x i8]* @11 to float*), align 4
  %41 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %param_0.9911 = getelementptr inbounds float, float* %41, i32 %linear_index2
  %param_0.9912 = load float, float* %param_0.9911, align 4, !invariant.load !65
  %42 = udiv i32 %linear_index2, 10
  %43 = bitcast [1024 x float]* %reduce.1.typed to float*
  %param_1.18413 = getelementptr inbounds float, float* %43, i32 %42
  %param_1.18414 = load float, float* %param_1.18413, align 4, !invariant.load !65
  %divide.1615 = fdiv float %param_0.9912, %param_1.18414
  %44 = load float, float* bitcast ([4 x i8]* @12 to float*), align 4
  %45 = fcmp uge float %40, %divide.1615
  %46 = select i1 %45, float %40, float %divide.1615
  %47 = fcmp ule float %44, %46
  %48 = select i1 %47, float %44, float %46
  %49 = call float @__nv_logf(float %48)
  %50 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index2
  store float %49, float* %51, align 4
  %52 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %53 = bitcast [1024 x [10 x float]]* %fusion.44.typed to float*
  %param_0.9916 = getelementptr inbounds float, float* %53, i32 %linear_index3
  %param_0.9917 = load float, float* %param_0.9916, align 4, !invariant.load !65
  %54 = udiv i32 %linear_index3, 10
  %55 = bitcast [1024 x float]* %reduce.1.typed to float*
  %param_1.18418 = getelementptr inbounds float, float* %55, i32 %54
  %param_1.18419 = load float, float* %param_1.18418, align 4, !invariant.load !65
  %divide.1620 = fdiv float %param_0.9917, %param_1.18419
  %56 = load float, float* bitcast ([4 x i8]* @14 to float*), align 4
  %57 = fcmp uge float %52, %divide.1620
  %58 = select i1 %57, float %52, float %divide.1620
  %59 = fcmp ule float %56, %58
  %60 = select i1 %59, float %56, float %58
  %61 = call float @__nv_logf(float %60)
  %62 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %63 = getelementptr inbounds float, float* %62, i32 %linear_index3
  store float %61, float* %63, align 4
  br label %fusion.47.in_bounds-after
}

; Function Attrs: nounwind readnone
declare float @__nv_logf(float) #0

define void @reduce_129(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(5120) %alloc21, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer34 = alloca float, align 4
  %parameter_buffer33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %reduce.129.inner.invar_address.reduction_dim.129 = alloca i32, align 4
  %accumulator_025 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %reduce.129.inner.invar_address.reduction_dim.119 = alloca i32, align 4
  %accumulator_015 = alloca float, align 4
  %parameter_buffer14 = alloca float, align 4
  %parameter_buffer13 = alloca float, align 4
  %return_buffer12 = alloca float, align 4
  %reduce.129.inner.invar_address.reduction_dim.19 = alloca i32, align 4
  %accumulator_05 = alloca float, align 4
  %parameter_buffer4 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.129.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %reduce.129.raw = getelementptr inbounds i8, i8* %alloc21, i64 0
  %reduce.129.typed = bitcast i8* %reduce.129.raw to [1024 x float]*
  %fusion.47.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.47.typed = bitcast i8* %fusion.47.raw to [1024 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %4 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %6 = udiv i32 %linear_index3, 1
  %7 = icmp ult i32 %linear_index_base, 1024
  br i1 %7, label %reduce.129.in_bounds-true, label %reduce.129.in_bounds-after

reduce.129.in_bounds-after:                       ; preds = %reduce.129.inner.loop_exit.reduction_dim.126, %entry
  ret void

reduce.129.in_bounds-true:                        ; preds = %entry
  %8 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %8, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.129.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.1

reduce.129.inner.loop_header.reduction_dim.1:     ; preds = %reduce.129.inner.loop_body.reduction_dim.1, %reduce.129.in_bounds-true
  %reduce.129.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.129.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.129.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.129.inner.loop_exit.reduction_dim.1, label %reduce.129.inner.loop_body.reduction_dim.1

reduce.129.inner.loop_body.reduction_dim.1:       ; preds = %reduce.129.inner.loop_header.reduction_dim.1
  %10 = load float, float* %accumulator_0, align 4
  %11 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %3, i32 %reduce.129.inner.indvar.reduction_dim.1
  %12 = load float, float* %11, align 4, !invariant.load !65
  store float %10, float* %parameter_buffer, align 4
  store float %12, float* %parameter_buffer4, align 4
  call void @max_float__125(float* %parameter_buffer, float* %parameter_buffer4, float* %return_buffer)
  %13 = load float, float* %return_buffer, align 4
  store float %13, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.129.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.129.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.1

reduce.129.inner.loop_exit.reduction_dim.1:       ; preds = %reduce.129.inner.loop_header.reduction_dim.1
  %14 = load float, float* %accumulator_0, align 4
  %15 = bitcast [1024 x float]* %reduce.129.typed to float*
  %16 = getelementptr inbounds float, float* %15, i32 %linear_index_base
  store float %14, float* %16, align 4
  %17 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %17, float* %accumulator_05, align 4
  store i32 0, i32* %reduce.129.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.17

reduce.129.inner.loop_header.reduction_dim.17:    ; preds = %reduce.129.inner.loop_body.reduction_dim.18, %reduce.129.inner.loop_exit.reduction_dim.1
  %reduce.129.inner.indvar.reduction_dim.110 = load i32, i32* %reduce.129.inner.invar_address.reduction_dim.19, align 4
  %18 = icmp uge i32 %reduce.129.inner.indvar.reduction_dim.110, 10
  br i1 %18, label %reduce.129.inner.loop_exit.reduction_dim.16, label %reduce.129.inner.loop_body.reduction_dim.18

reduce.129.inner.loop_body.reduction_dim.18:      ; preds = %reduce.129.inner.loop_header.reduction_dim.17
  %19 = load float, float* %accumulator_05, align 4
  %20 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %4, i32 %reduce.129.inner.indvar.reduction_dim.110
  %21 = load float, float* %20, align 4, !invariant.load !65
  store float %19, float* %parameter_buffer13, align 4
  store float %21, float* %parameter_buffer14, align 4
  call void @max_float__125(float* %parameter_buffer13, float* %parameter_buffer14, float* %return_buffer12)
  %22 = load float, float* %return_buffer12, align 4
  store float %22, float* %accumulator_05, align 4
  %invar.inc11 = add nuw nsw i32 %reduce.129.inner.indvar.reduction_dim.110, 1
  store i32 %invar.inc11, i32* %reduce.129.inner.invar_address.reduction_dim.19, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.17

reduce.129.inner.loop_exit.reduction_dim.16:      ; preds = %reduce.129.inner.loop_header.reduction_dim.17
  %23 = load float, float* %accumulator_05, align 4
  %24 = bitcast [1024 x float]* %reduce.129.typed to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index1
  store float %23, float* %25, align 4
  %26 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %26, float* %accumulator_015, align 4
  store i32 0, i32* %reduce.129.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.117

reduce.129.inner.loop_header.reduction_dim.117:   ; preds = %reduce.129.inner.loop_body.reduction_dim.118, %reduce.129.inner.loop_exit.reduction_dim.16
  %reduce.129.inner.indvar.reduction_dim.120 = load i32, i32* %reduce.129.inner.invar_address.reduction_dim.119, align 4
  %27 = icmp uge i32 %reduce.129.inner.indvar.reduction_dim.120, 10
  br i1 %27, label %reduce.129.inner.loop_exit.reduction_dim.116, label %reduce.129.inner.loop_body.reduction_dim.118

reduce.129.inner.loop_body.reduction_dim.118:     ; preds = %reduce.129.inner.loop_header.reduction_dim.117
  %28 = load float, float* %accumulator_015, align 4
  %29 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %5, i32 %reduce.129.inner.indvar.reduction_dim.120
  %30 = load float, float* %29, align 4, !invariant.load !65
  store float %28, float* %parameter_buffer23, align 4
  store float %30, float* %parameter_buffer24, align 4
  call void @max_float__125(float* %parameter_buffer23, float* %parameter_buffer24, float* %return_buffer22)
  %31 = load float, float* %return_buffer22, align 4
  store float %31, float* %accumulator_015, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.129.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, i32* %reduce.129.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.117

reduce.129.inner.loop_exit.reduction_dim.116:     ; preds = %reduce.129.inner.loop_header.reduction_dim.117
  %32 = load float, float* %accumulator_015, align 4
  %33 = bitcast [1024 x float]* %reduce.129.typed to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index2
  store float %32, float* %34, align 4
  %35 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_61 to float*), align 4, !invariant.load !65
  store float %35, float* %accumulator_025, align 4
  store i32 0, i32* %reduce.129.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.127

reduce.129.inner.loop_header.reduction_dim.127:   ; preds = %reduce.129.inner.loop_body.reduction_dim.128, %reduce.129.inner.loop_exit.reduction_dim.116
  %reduce.129.inner.indvar.reduction_dim.130 = load i32, i32* %reduce.129.inner.invar_address.reduction_dim.129, align 4
  %36 = icmp uge i32 %reduce.129.inner.indvar.reduction_dim.130, 10
  br i1 %36, label %reduce.129.inner.loop_exit.reduction_dim.126, label %reduce.129.inner.loop_body.reduction_dim.128

reduce.129.inner.loop_body.reduction_dim.128:     ; preds = %reduce.129.inner.loop_header.reduction_dim.127
  %37 = load float, float* %accumulator_025, align 4
  %38 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %6, i32 %reduce.129.inner.indvar.reduction_dim.130
  %39 = load float, float* %38, align 4, !invariant.load !65
  store float %37, float* %parameter_buffer33, align 4
  store float %39, float* %parameter_buffer34, align 4
  call void @max_float__125(float* %parameter_buffer33, float* %parameter_buffer34, float* %return_buffer32)
  %40 = load float, float* %return_buffer32, align 4
  store float %40, float* %accumulator_025, align 4
  %invar.inc31 = add nuw nsw i32 %reduce.129.inner.indvar.reduction_dim.130, 1
  store i32 %invar.inc31, i32* %reduce.129.inner.invar_address.reduction_dim.129, align 4
  br label %reduce.129.inner.loop_header.reduction_dim.127

reduce.129.inner.loop_exit.reduction_dim.126:     ; preds = %reduce.129.inner.loop_header.reduction_dim.127
  %41 = load float, float* %accumulator_025, align 4
  %42 = bitcast [1024 x float]* %reduce.129.typed to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index3
  store float %41, float* %43, align 4
  br label %reduce.129.in_bounds-after
}

define internal void @max_float__125(float* dereferenceable(4) %x.126.typed, float* dereferenceable(4) %y.127.typed, float* dereferenceable(4) %output_arg) {
entry:
  %maximum.128.typed = alloca float, align 4
  %0 = load float, float* %x.126.typed, align 4
  %1 = load float, float* %y.127.typed, align 4
  %2 = call float @llvm.maxnum.f32(float %0, float %1)
  store float %2, float* %maximum.128.typed, align 4
  %load_ret_value = load float, float* %maximum.128.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_49(i8* noalias align 64 dereferenceable(819200) %alloc7, i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(5120) %alloc21, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.49.raw = getelementptr inbounds i8, i8* %alloc7, i64 0
  %fusion.49.typed = bitcast i8* %fusion.49.raw to [1024 x [10 x float]]*
  %fusion.47.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.47.typed = bitcast i8* %fusion.47.raw to [1024 x [10 x float]]*
  %reduce.129.raw = getelementptr inbounds i8, i8* %alloc21, i64 0
  %reduce.129.typed = bitcast i8* %reduce.129.raw to [1024 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2560
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 10
  %8 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 10
  %11 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 10
  %14 = udiv i32 %linear_index3, 10
  %15 = icmp ult i32 %linear_index_base, 10240
  br i1 %15, label %fusion.49.in_bounds-true, label %fusion.49.in_bounds-after

fusion.49.in_bounds-after:                        ; preds = %fusion.49.in_bounds-true, %entry
  ret void

fusion.49.in_bounds-true:                         ; preds = %entry
  %16 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %param_0.106 = getelementptr inbounds float, float* %16, i32 %linear_index_base
  %param_0.1064 = load float, float* %param_0.106, align 4, !invariant.load !65
  %17 = udiv i32 %linear_index_base, 10
  %18 = bitcast [1024 x float]* %reduce.129.typed to float*
  %param_1.192 = getelementptr inbounds float, float* %18, i32 %17
  %param_1.1925 = load float, float* %param_1.192, align 4, !invariant.load !65
  %subtract.59 = fsub float %param_0.1064, %param_1.1925
  %19 = call float @__nv_expf(float %subtract.59)
  %20 = bitcast [1024 x [10 x float]]* %fusion.49.typed to float*
  %21 = getelementptr inbounds float, float* %20, i32 %linear_index_base
  store float %19, float* %21, align 4
  %22 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %param_0.1066 = getelementptr inbounds float, float* %22, i32 %linear_index1
  %param_0.1067 = load float, float* %param_0.1066, align 4, !invariant.load !65
  %23 = udiv i32 %linear_index1, 10
  %24 = bitcast [1024 x float]* %reduce.129.typed to float*
  %param_1.1928 = getelementptr inbounds float, float* %24, i32 %23
  %param_1.1929 = load float, float* %param_1.1928, align 4, !invariant.load !65
  %subtract.5910 = fsub float %param_0.1067, %param_1.1929
  %25 = call float @__nv_expf(float %subtract.5910)
  %26 = bitcast [1024 x [10 x float]]* %fusion.49.typed to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  store float %25, float* %27, align 4
  %28 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %param_0.10611 = getelementptr inbounds float, float* %28, i32 %linear_index2
  %param_0.10612 = load float, float* %param_0.10611, align 4, !invariant.load !65
  %29 = udiv i32 %linear_index2, 10
  %30 = bitcast [1024 x float]* %reduce.129.typed to float*
  %param_1.19213 = getelementptr inbounds float, float* %30, i32 %29
  %param_1.19214 = load float, float* %param_1.19213, align 4, !invariant.load !65
  %subtract.5915 = fsub float %param_0.10612, %param_1.19214
  %31 = call float @__nv_expf(float %subtract.5915)
  %32 = bitcast [1024 x [10 x float]]* %fusion.49.typed to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index2
  store float %31, float* %33, align 4
  %34 = bitcast [1024 x [10 x float]]* %fusion.47.typed to float*
  %param_0.10616 = getelementptr inbounds float, float* %34, i32 %linear_index3
  %param_0.10617 = load float, float* %param_0.10616, align 4, !invariant.load !65
  %35 = udiv i32 %linear_index3, 10
  %36 = bitcast [1024 x float]* %reduce.129.typed to float*
  %param_1.19218 = getelementptr inbounds float, float* %36, i32 %35
  %param_1.19219 = load float, float* %param_1.19218, align 4, !invariant.load !65
  %subtract.5920 = fsub float %param_0.10617, %param_1.19219
  %37 = call float @__nv_expf(float %subtract.5920)
  %38 = bitcast [1024 x [10 x float]]* %fusion.49.typed to float*
  %39 = getelementptr inbounds float, float* %38, i32 %linear_index3
  store float %37, float* %39, align 4
  br label %fusion.49.in_bounds-after
}

define void @fusion_58(i8* noalias align 64 dereferenceable(819200) %alloc7, i8* noalias align 64 dereferenceable(5120) %alloc19, i8* noalias align 64 dereferenceable(5120) %alloc20, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer45 = alloca float, align 4
  %parameter_buffer44 = alloca float, align 4
  %return_buffer43 = alloca float, align 4
  %reduce.14.inner.invar_address.reduction_dim.138 = alloca i32, align 4
  %accumulator_034 = alloca float, align 4
  %parameter_buffer33 = alloca float, align 4
  %parameter_buffer32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %reduce.14.inner.invar_address.reduction_dim.126 = alloca i32, align 4
  %accumulator_022 = alloca float, align 4
  %parameter_buffer21 = alloca float, align 4
  %parameter_buffer20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %reduce.14.inner.invar_address.reduction_dim.114 = alloca i32, align 4
  %accumulator_010 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.14.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %fusion.58.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056000
  %fusion.58.typed = bitcast i8* %fusion.58.raw to [2 x i8*]*
  %fusion.58.raw1 = getelementptr inbounds i8, i8* %alloc19, i64 0
  %fusion.58.typed2 = bitcast i8* %fusion.58.raw1 to [1024 x float]*
  %fusion.58.raw3 = getelementptr inbounds i8, i8* %alloc20, i64 0
  %fusion.58.typed4 = bitcast i8* %fusion.58.raw3 to [1024 x float]*
  %fusion.49.raw = getelementptr inbounds i8, i8* %alloc7, i64 0
  %fusion.49.typed = bitcast i8* %fusion.49.raw to [1024 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %7 = mul nuw nsw i32 %5, 256
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %linear_index5 = add nuw nsw i32 %linear_index_base, 1
  %9 = udiv i32 %linear_index5, 1
  %linear_index6 = add nuw nsw i32 %linear_index_base, 2
  %10 = udiv i32 %linear_index6, 1
  %linear_index7 = add nuw nsw i32 %linear_index_base, 3
  %11 = udiv i32 %linear_index7, 1
  %12 = icmp ult i32 %linear_index_base, 1024
  br i1 %12, label %fusion.58.in_bounds-true, label %fusion.58.in_bounds-after

fusion.58.in_bounds-after:                        ; preds = %reduce.14.inner.loop_exit.reduction_dim.135, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %13 = bitcast [1024 x float]* %fusion.58.typed2 to i8*
  %14 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.58.typed, i64 0, i64 0
  store i8* %13, i8** %14, align 8
  %15 = bitcast [1024 x float]* %fusion.58.typed4 to i8*
  %16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.58.typed, i64 0, i64 1
  store i8* %15, i8** %16, align 8
  br label %emit_mof_tuple-after

fusion.58.in_bounds-true:                         ; preds = %emit_mof_tuple-after
  %17 = load float, float* bitcast ([4 x i8]* @15 to float*), align 4
  store float %17, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.14.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.1

reduce.14.inner.loop_header.reduction_dim.1:      ; preds = %reduce.14.inner.loop_body.reduction_dim.1, %fusion.58.in_bounds-true
  %reduce.14.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.14.inner.invar_address.reduction_dim.1, align 4
  %18 = icmp uge i32 %reduce.14.inner.indvar.reduction_dim.1, 10
  br i1 %18, label %reduce.14.inner.loop_exit.reduction_dim.1, label %reduce.14.inner.loop_body.reduction_dim.1

reduce.14.inner.loop_body.reduction_dim.1:        ; preds = %reduce.14.inner.loop_header.reduction_dim.1
  %19 = load float, float* %accumulator_0, align 4
  %param_0.159 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %8, i32 %reduce.14.inner.indvar.reduction_dim.1
  %param_0.1598 = load float, float* %param_0.159, align 4, !invariant.load !65
  store float %19, float* %parameter_buffer, align 4
  store float %param_0.1598, float* %parameter_buffer9, align 4
  call void @add_float__135(float* %parameter_buffer, float* %parameter_buffer9, float* %return_buffer)
  %20 = load float, float* %return_buffer, align 4
  store float %20, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.14.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.14.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.1

reduce.14.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.14.inner.loop_header.reduction_dim.1
  %21 = load float, float* %accumulator_0, align 4
  %22 = call float @__nv_logf(float %21)
  %23 = insertvalue { float, float } undef, float %22, 0
  %24 = insertvalue { float, float } %23, float %21, 1
  %25 = extractvalue { float, float } %24, 0
  %26 = bitcast [1024 x float]* %fusion.58.typed2 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  store float %25, float* %27, align 4
  %28 = extractvalue { float, float } %24, 1
  %29 = bitcast [1024 x float]* %fusion.58.typed4 to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index_base
  store float %28, float* %30, align 4
  %31 = load float, float* bitcast ([4 x i8]* @16 to float*), align 4
  store float %31, float* %accumulator_010, align 4
  store i32 0, i32* %reduce.14.inner.invar_address.reduction_dim.114, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.112

reduce.14.inner.loop_header.reduction_dim.112:    ; preds = %reduce.14.inner.loop_body.reduction_dim.113, %reduce.14.inner.loop_exit.reduction_dim.1
  %reduce.14.inner.indvar.reduction_dim.115 = load i32, i32* %reduce.14.inner.invar_address.reduction_dim.114, align 4
  %32 = icmp uge i32 %reduce.14.inner.indvar.reduction_dim.115, 10
  br i1 %32, label %reduce.14.inner.loop_exit.reduction_dim.111, label %reduce.14.inner.loop_body.reduction_dim.113

reduce.14.inner.loop_body.reduction_dim.113:      ; preds = %reduce.14.inner.loop_header.reduction_dim.112
  %33 = load float, float* %accumulator_010, align 4
  %param_0.15917 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %9, i32 %reduce.14.inner.indvar.reduction_dim.115
  %param_0.15918 = load float, float* %param_0.15917, align 4, !invariant.load !65
  store float %33, float* %parameter_buffer20, align 4
  store float %param_0.15918, float* %parameter_buffer21, align 4
  call void @add_float__135(float* %parameter_buffer20, float* %parameter_buffer21, float* %return_buffer19)
  %34 = load float, float* %return_buffer19, align 4
  store float %34, float* %accumulator_010, align 4
  %invar.inc16 = add nuw nsw i32 %reduce.14.inner.indvar.reduction_dim.115, 1
  store i32 %invar.inc16, i32* %reduce.14.inner.invar_address.reduction_dim.114, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.112

reduce.14.inner.loop_exit.reduction_dim.111:      ; preds = %reduce.14.inner.loop_header.reduction_dim.112
  %35 = load float, float* %accumulator_010, align 4
  %36 = call float @__nv_logf(float %35)
  %37 = insertvalue { float, float } undef, float %36, 0
  %38 = insertvalue { float, float } %37, float %35, 1
  %39 = extractvalue { float, float } %38, 0
  %40 = bitcast [1024 x float]* %fusion.58.typed2 to float*
  %41 = getelementptr inbounds float, float* %40, i32 %linear_index5
  store float %39, float* %41, align 4
  %42 = extractvalue { float, float } %38, 1
  %43 = bitcast [1024 x float]* %fusion.58.typed4 to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index5
  store float %42, float* %44, align 4
  %45 = load float, float* bitcast ([4 x i8]* @17 to float*), align 4
  store float %45, float* %accumulator_022, align 4
  store i32 0, i32* %reduce.14.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.124

reduce.14.inner.loop_header.reduction_dim.124:    ; preds = %reduce.14.inner.loop_body.reduction_dim.125, %reduce.14.inner.loop_exit.reduction_dim.111
  %reduce.14.inner.indvar.reduction_dim.127 = load i32, i32* %reduce.14.inner.invar_address.reduction_dim.126, align 4
  %46 = icmp uge i32 %reduce.14.inner.indvar.reduction_dim.127, 10
  br i1 %46, label %reduce.14.inner.loop_exit.reduction_dim.123, label %reduce.14.inner.loop_body.reduction_dim.125

reduce.14.inner.loop_body.reduction_dim.125:      ; preds = %reduce.14.inner.loop_header.reduction_dim.124
  %47 = load float, float* %accumulator_022, align 4
  %param_0.15929 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %10, i32 %reduce.14.inner.indvar.reduction_dim.127
  %param_0.15930 = load float, float* %param_0.15929, align 4, !invariant.load !65
  store float %47, float* %parameter_buffer32, align 4
  store float %param_0.15930, float* %parameter_buffer33, align 4
  call void @add_float__135(float* %parameter_buffer32, float* %parameter_buffer33, float* %return_buffer31)
  %48 = load float, float* %return_buffer31, align 4
  store float %48, float* %accumulator_022, align 4
  %invar.inc28 = add nuw nsw i32 %reduce.14.inner.indvar.reduction_dim.127, 1
  store i32 %invar.inc28, i32* %reduce.14.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.124

reduce.14.inner.loop_exit.reduction_dim.123:      ; preds = %reduce.14.inner.loop_header.reduction_dim.124
  %49 = load float, float* %accumulator_022, align 4
  %50 = call float @__nv_logf(float %49)
  %51 = insertvalue { float, float } undef, float %50, 0
  %52 = insertvalue { float, float } %51, float %49, 1
  %53 = extractvalue { float, float } %52, 0
  %54 = bitcast [1024 x float]* %fusion.58.typed2 to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index6
  store float %53, float* %55, align 4
  %56 = extractvalue { float, float } %52, 1
  %57 = bitcast [1024 x float]* %fusion.58.typed4 to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index6
  store float %56, float* %58, align 4
  %59 = load float, float* bitcast ([4 x i8]* @18 to float*), align 4
  store float %59, float* %accumulator_034, align 4
  store i32 0, i32* %reduce.14.inner.invar_address.reduction_dim.138, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.136

reduce.14.inner.loop_header.reduction_dim.136:    ; preds = %reduce.14.inner.loop_body.reduction_dim.137, %reduce.14.inner.loop_exit.reduction_dim.123
  %reduce.14.inner.indvar.reduction_dim.139 = load i32, i32* %reduce.14.inner.invar_address.reduction_dim.138, align 4
  %60 = icmp uge i32 %reduce.14.inner.indvar.reduction_dim.139, 10
  br i1 %60, label %reduce.14.inner.loop_exit.reduction_dim.135, label %reduce.14.inner.loop_body.reduction_dim.137

reduce.14.inner.loop_body.reduction_dim.137:      ; preds = %reduce.14.inner.loop_header.reduction_dim.136
  %61 = load float, float* %accumulator_034, align 4
  %param_0.15941 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %11, i32 %reduce.14.inner.indvar.reduction_dim.139
  %param_0.15942 = load float, float* %param_0.15941, align 4, !invariant.load !65
  store float %61, float* %parameter_buffer44, align 4
  store float %param_0.15942, float* %parameter_buffer45, align 4
  call void @add_float__135(float* %parameter_buffer44, float* %parameter_buffer45, float* %return_buffer43)
  %62 = load float, float* %return_buffer43, align 4
  store float %62, float* %accumulator_034, align 4
  %invar.inc40 = add nuw nsw i32 %reduce.14.inner.indvar.reduction_dim.139, 1
  store i32 %invar.inc40, i32* %reduce.14.inner.invar_address.reduction_dim.138, align 4
  br label %reduce.14.inner.loop_header.reduction_dim.136

reduce.14.inner.loop_exit.reduction_dim.135:      ; preds = %reduce.14.inner.loop_header.reduction_dim.136
  %63 = load float, float* %accumulator_034, align 4
  %64 = call float @__nv_logf(float %63)
  %65 = insertvalue { float, float } undef, float %64, 0
  %66 = insertvalue { float, float } %65, float %63, 1
  %67 = extractvalue { float, float } %66, 0
  %68 = bitcast [1024 x float]* %fusion.58.typed2 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index7
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float } %66, 1
  %71 = bitcast [1024 x float]* %fusion.58.typed4 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index7
  store float %70, float* %72, align 4
  br label %fusion.58.in_bounds-after
}

define internal void @add_float__135(float* dereferenceable(4) %x.136.typed, float* dereferenceable(4) %y.137.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.138.typed = alloca float, align 4
  %0 = load float, float* %x.136.typed, align 4
  %1 = load float, float* %y.137.typed, align 4
  %add.138 = fadd float %0, %1
  store float %add.138, float* %add.138.typed, align 4
  %load_ret_value = load float, float* %add.138.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_57(i8* noalias align 64 dereferenceable(2359296) %alloc3, i8* noalias align 64 dereferenceable(819200) %alloc7, i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(5120) %alloc20, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 16 dereferenceable(4096) %alloc26, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %result_from_other_lane42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %parameter_buffer27 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.11.clone.1.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %output_y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result.0 = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %fusion.57.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055936
  %fusion.57.typed = bitcast i8* %fusion.57.raw to [2 x i8*]*
  %fusion.57.raw1 = getelementptr inbounds i8, i8* %temp_buf, i64 1140850688
  %fusion.57.typed2 = bitcast i8* %fusion.57.raw1 to [10 x float]*
  %fusion.57.raw3 = getelementptr inbounds i8, i8* %alloc3, i64 0
  %fusion.57.typed4 = bitcast i8* %fusion.57.raw3 to [1024 x [10 x float]]*
  %fusion.44.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %fusion.44.typed = bitcast i8* %fusion.44.raw to [1024 x [10 x float]]*
  %reduce.1.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %reduce.1.typed = bitcast i8* %reduce.1.raw to [1024 x float]*
  %arg0.1.raw = getelementptr inbounds i8, i8* %alloc26, i64 0
  %arg0.1.typed = bitcast i8* %arg0.1.raw to [1024 x i32]*
  %fusion.49.raw = getelementptr inbounds i8, i8* %alloc7, i64 0
  %fusion.49.typed = bitcast i8* %fusion.49.raw to [1024 x [10 x float]]*
  %get-tuple-element.119.raw = getelementptr inbounds i8, i8* %alloc20, i64 0
  %get-tuple-element.119.typed = bitcast i8* %get-tuple-element.119.raw to [1024 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !64
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_atomic_update-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %2 = load float, float* bitcast ([4 x i8]* @19 to float*), align 4
  %3 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  store float %2, float* %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %thread_id.x = urem i32 %4, 32
  %thread_id.y = udiv i32 %4, 32
  %lane_id = urem i32 %4, 32
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %6 = udiv i32 %5, 1
  %7 = urem i32 %6, 1
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 1
  %10 = udiv i32 %5, 1
  %block_origin.z = mul i32 %10, 1
  %11 = icmp eq i32 %9, 0
  %tile_bound = select i1 %11, i32 1024, i32 4096
  %12 = icmp eq i32 %7, 0
  %tile_bound5 = select i1 %12, i32 10, i32 32
  %tile_origin.1 = mul i32 %9, 4096
  %tile_origin.2 = mul i32 %7, 32
  %13 = add i32 %tile_origin.2, %thread_id.x
  %14 = sub i32 %tile_bound, %thread_id.y
  %15 = add i32 %14, 32
  %16 = add i32 %15, -1
  %17 = udiv i32 %16, 32
  store i32 0, i32* %output_y_in_tile.invar_address, align 4
  br label %output_y_in_tile.loop_header

output_y_in_tile.loop_header:                     ; preds = %output_x_in_tile-after, %reduce-group-0-true
  %output_y_in_tile.indvar = load i32, i32* %output_y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %output_y_in_tile.indvar, %17
  br i1 %18, label %output_y_in_tile.loop_exit, label %output_y_in_tile.loop_body

output_y_in_tile.loop_body:                       ; preds = %output_y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %output_y_in_tile.indvar, 1
  store i32 %invar.inc, i32* %output_y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %output_y_in_tile.indvar, 0
  %20 = mul i32 %output_y_in_tile.indvar, 32
  %21 = add i32 %thread_id.y, %20
  %22 = add i32 %tile_origin.1, %21
  %x_loc = add i32 0, %thread_id.x
  %23 = add i32 %13, 0
  %24 = icmp ult i32 %x_loc, %tile_bound5
  br i1 %24, label %output_x_in_tile-true, label %output_x_in_tile-after

output_x_in_tile-after:                           ; preds = %reduce.11.clone.1.inner.loop_exit.reduction_dim.1, %output_y_in_tile.loop_body
  br label %output_y_in_tile.loop_header, !llvm.loop !74

output_y_in_tile.loop_exit:                       ; preds = %output_y_in_tile.loop_header
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %thread_id.x33 = urem i32 %25, 32
  %thread_id.y34 = udiv i32 %25, 32
  %lane_id35 = urem i32 %25, 32
  %26 = add i32 %tile_origin.1, %thread_id.x33
  %27 = add i32 %tile_origin.2, %thread_id.y34
  %28 = add i32 %27, 0
  %29 = mul i32 %block_origin.z, 10
  %30 = add i32 %29, %28
  %31 = udiv i32 %30, 1
  %output_element_address = getelementptr inbounds [10 x float], [10 x float]* %fusion.57.typed2, i32 0, i32 %31
  %current_output = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  %32 = getelementptr inbounds [1 x [32 x [33 x float]]], [1 x [32 x [33 x float]]] addrspace(3)* @shared_cache_0, i32 0, i32 0, i32 %thread_id.x33, i32 %thread_id.y34
  %shmem_output_address = addrspacecast float addrspace(3)* %32 to float*
  %33 = load float, float* %current_output, align 4
  store float %33, float* %shmem_output_address, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [32 x [33 x float]]], [1 x [32 x [33 x float]]] addrspace(3)* @shared_cache_0, i32 0, i32 0, i32 %thread_id.y34, i32 %thread_id.x33
  %34 = addrspacecast float addrspace(3)* %shmem_transposed_addr to float*
  %partial_reduction_result = load float, float* %34, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result, i32 16, i32 31)
  store float %35, float* %result_from_other_lane, align 4
  call void @add_float__183(float* %34, float* %result_from_other_lane, float* %34)
  %partial_reduction_result37 = load float, float* %34, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 8, i32 31)
  store float %36, float* %result_from_other_lane36, align 4
  call void @add_float__183(float* %34, float* %result_from_other_lane36, float* %34)
  %partial_reduction_result39 = load float, float* %34, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 4, i32 31)
  store float %37, float* %result_from_other_lane38, align 4
  call void @add_float__183(float* %34, float* %result_from_other_lane38, float* %34)
  %partial_reduction_result41 = load float, float* %34, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %38, float* %result_from_other_lane40, align 4
  call void @add_float__183(float* %34, float* %result_from_other_lane40, float* %34)
  %partial_reduction_result43 = load float, float* %34, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 1, i32 31)
  store float %39, float* %result_from_other_lane42, align 4
  call void @add_float__183(float* %34, float* %result_from_other_lane42, float* %34)
  %40 = icmp ult i32 %thread_id.x33, %tile_bound
  %41 = icmp ult i32 %thread_id.y34, %tile_bound5
  %42 = and i1 %41, %40
  %43 = icmp eq i32 %lane_id35, 0
  %44 = and i1 %42, %43
  br i1 %44, label %reduction_atomic_update-true, label %reduction_atomic_update-after

reduction_atomic_update-after:                    ; preds = %reduction_atomic_update-true, %output_y_in_tile.loop_exit
  br label %reduce-group-0-after

output_x_in_tile-true:                            ; preds = %output_y_in_tile.loop_body
  %param_0.161 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %22, i32 %23
  %param_0.1616 = load float, float* %param_0.161, align 4, !invariant.load !65
  %param_1.260 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.1.typed, i32 0, i32 %22
  %param_1.2607 = load float, float* %param_1.260, align 4, !invariant.load !65
  %divide.34.clone.1 = fdiv float %param_0.1616, %param_1.2607
  %45 = load float, float* bitcast ([4 x i8]* @20 to float*), align 4
  %compare.40.clone.1 = fcmp ole float %divide.34.clone.1, %45
  %46 = zext i1 %compare.40.clone.1 to i8
  %47 = call float @llvm.minnum.f32(float %divide.34.clone.1, float %45)
  %48 = load float, float* bitcast ([4 x i8]* @21 to float*), align 4
  %compare.39.clone.1 = fcmp oge float %47, %48
  %49 = zext i1 %compare.39.clone.1 to i8
  %50 = load float, float* bitcast ([4 x i8]* @22 to float*), align 4
  %51 = fcmp uge float %48, %divide.34.clone.1
  %52 = select i1 %51, float %48, float %divide.34.clone.1
  %53 = fcmp ule float %45, %52
  %54 = select i1 %53, float %45, float %52
  %divide.33.clone.1 = fdiv float %50, %54
  %55 = load float, float* bitcast ([4 x i8]* @23 to float*), align 4
  %param_3.165 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %22, i32 %23
  %param_3.1658 = load float, float* %param_3.165, align 4, !invariant.load !65
  %param_4.137 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.119.typed, i32 0, i32 %22
  %param_4.1379 = load float, float* %param_4.137, align 4, !invariant.load !65
  %divide.32.clone.1 = fdiv float %param_3.1658, %param_4.1379
  %param_2.302 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %22
  %param_2.30210 = load i32, i32* %param_2.302, align 4, !invariant.load !65
  %56 = sitofp i32 %param_2.30210 to float
  %57 = fptosi float %56 to i64
  %58 = mul nuw nsw i32 %23, 1
  %59 = add nuw nsw i32 0, %58
  %60 = zext i32 %59 to i64
  %61 = icmp eq i64 %57, %60
  %62 = zext i1 %61 to i8
  %63 = load float, float* bitcast ([4 x i8]* @24 to float*), align 4
  %64 = trunc i8 %62 to i1
  %65 = select i1 %64, float %50, float %63
  %66 = load i64, i64* bitcast ([8 x i8]* @25 to i64*), align 8
  %67 = icmp sle i64 %66, %57
  %68 = zext i1 %67 to i8
  %69 = load i64, i64* bitcast ([8 x i8]* @26 to i64*), align 8
  %70 = icmp slt i64 %57, %69
  %71 = zext i1 %70 to i8
  %72 = and i8 %68, %71
  %73 = load float, float* bitcast ([4 x i8]* @27 to float*), align 4
  %74 = load float, float* bitcast ([4 x i8]* @28 to float*), align 4
  %75 = trunc i8 %72 to i1
  %76 = select i1 %75, float %73, float %74
  %add.40.clone.1 = fadd float %65, %76
  %subtract.65.clone.1 = fsub float %divide.32.clone.1, %add.40.clone.1
  %multiply.53.clone.1 = fmul float %55, %subtract.65.clone.1
  %multiply.52.clone.1 = fmul float %divide.33.clone.1, %multiply.53.clone.1
  %77 = trunc i8 %49 to i1
  %78 = select i1 %77, float %multiply.52.clone.1, float %63
  %79 = trunc i8 %46 to i1
  %80 = select i1 %79, float %78, float %63
  %81 = load float, float* bitcast ([4 x i8]* @29 to float*), align 4
  store float %81, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.11.clone.1.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.clone.1.inner.loop_header.reduction_dim.1

reduce.11.clone.1.inner.loop_header.reduction_dim.1: ; preds = %reduce.11.clone.1.inner.loop_body.reduction_dim.1, %output_x_in_tile-true
  %reduce.11.clone.1.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.11.clone.1.inner.invar_address.reduction_dim.1, align 4
  %82 = icmp uge i32 %reduce.11.clone.1.inner.indvar.reduction_dim.1, 10
  br i1 %82, label %reduce.11.clone.1.inner.loop_exit.reduction_dim.1, label %reduce.11.clone.1.inner.loop_body.reduction_dim.1

reduce.11.clone.1.inner.loop_body.reduction_dim.1: ; preds = %reduce.11.clone.1.inner.loop_header.reduction_dim.1
  %83 = load float, float* %accumulator_0, align 4
  %param_0.16112 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %22, i32 %reduce.11.clone.1.inner.indvar.reduction_dim.1
  %param_0.16113 = load float, float* %param_0.16112, align 4, !invariant.load !65
  %param_1.26014 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.1.typed, i32 0, i32 %22
  %param_1.26015 = load float, float* %param_1.26014, align 4, !invariant.load !65
  %divide.34.clone.116 = fdiv float %param_0.16113, %param_1.26015
  %84 = load float, float* bitcast ([4 x i8]* @30 to float*), align 4
  %compare.40.clone.117 = fcmp ole float %divide.34.clone.116, %84
  %85 = zext i1 %compare.40.clone.117 to i8
  %86 = call float @llvm.minnum.f32(float %divide.34.clone.116, float %84)
  %87 = load float, float* bitcast ([4 x i8]* @31 to float*), align 4
  %compare.39.clone.118 = fcmp oge float %86, %87
  %88 = zext i1 %compare.39.clone.118 to i8
  %89 = load float, float* bitcast ([4 x i8]* @32 to float*), align 4
  %90 = fcmp uge float %87, %divide.34.clone.116
  %91 = select i1 %90, float %87, float %divide.34.clone.116
  %92 = fcmp ule float %84, %91
  %93 = select i1 %92, float %84, float %91
  %divide.33.clone.119 = fdiv float %89, %93
  %94 = load float, float* bitcast ([4 x i8]* @33 to float*), align 4
  %param_3.16520 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.49.typed, i32 0, i32 %22, i32 %reduce.11.clone.1.inner.indvar.reduction_dim.1
  %param_3.16521 = load float, float* %param_3.16520, align 4, !invariant.load !65
  %param_4.13722 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.119.typed, i32 0, i32 %22
  %param_4.13723 = load float, float* %param_4.13722, align 4, !invariant.load !65
  %divide.32.clone.124 = fdiv float %param_3.16521, %param_4.13723
  %param_2.30225 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %22
  %param_2.30226 = load i32, i32* %param_2.30225, align 4, !invariant.load !65
  %95 = sitofp i32 %param_2.30226 to float
  %96 = fptosi float %95 to i64
  %97 = mul nuw nsw i32 %reduce.11.clone.1.inner.indvar.reduction_dim.1, 1
  %98 = add nuw nsw i32 0, %97
  %99 = zext i32 %98 to i64
  %100 = icmp eq i64 %96, %99
  %101 = zext i1 %100 to i8
  %102 = load float, float* bitcast ([4 x i8]* @34 to float*), align 4
  %103 = trunc i8 %101 to i1
  %104 = select i1 %103, float %89, float %102
  %105 = load i64, i64* bitcast ([8 x i8]* @35 to i64*), align 8
  %106 = icmp sle i64 %105, %96
  %107 = zext i1 %106 to i8
  %108 = load i64, i64* bitcast ([8 x i8]* @36 to i64*), align 8
  %109 = icmp slt i64 %96, %108
  %110 = zext i1 %109 to i8
  %111 = and i8 %107, %110
  %112 = load float, float* bitcast ([4 x i8]* @37 to float*), align 4
  %113 = load float, float* bitcast ([4 x i8]* @38 to float*), align 4
  %114 = trunc i8 %111 to i1
  %115 = select i1 %114, float %112, float %113
  %add.42.clone.1 = fadd float %104, %115
  %subtract.67.clone.1 = fsub float %divide.32.clone.124, %add.42.clone.1
  %multiply.59.clone.1 = fmul float %94, %subtract.67.clone.1
  %multiply.58.clone.1 = fmul float %divide.33.clone.119, %multiply.59.clone.1
  %116 = trunc i8 %88 to i1
  %117 = select i1 %116, float %multiply.58.clone.1, float %102
  %118 = trunc i8 %85 to i1
  %119 = select i1 %118, float %117, float %102
  %multiply.57.clone.1 = fmul float %119, %divide.34.clone.116
  store float %83, float* %parameter_buffer, align 4
  store float %multiply.57.clone.1, float* %parameter_buffer27, align 4
  call void @PartitionedCall_gradients_mnist_classifier_StatefulPartitionedCall_grad_PartitionedCall_gradients_dense_1_Softmax_grad_Sum_reduction_170(float* %parameter_buffer, float* %parameter_buffer27, float* %return_buffer)
  %120 = load float, float* %return_buffer, align 4
  store float %120, float* %accumulator_0, align 4
  %invar.inc11 = add nuw nsw i32 %reduce.11.clone.1.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc11, i32* %reduce.11.clone.1.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.clone.1.inner.loop_header.reduction_dim.1

reduce.11.clone.1.inner.loop_exit.reduction_dim.1: ; preds = %reduce.11.clone.1.inner.loop_header.reduction_dim.1
  %121 = load float, float* %accumulator_0, align 4
  %subtract.33.clone.1 = fsub float %80, %121
  %param_0.16128 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.44.typed, i32 0, i32 %22, i32 %23
  %param_0.16129 = load float, float* %param_0.16128, align 4, !invariant.load !65
  %param_1.26030 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.1.typed, i32 0, i32 %22
  %param_1.26031 = load float, float* %param_1.26030, align 4, !invariant.load !65
  %divide.34.clone.132 = fdiv float %param_0.16129, %param_1.26031
  %multiply.41.clone.1 = fmul float %subtract.33.clone.1, %divide.34.clone.132
  store float %multiply.41.clone.1, float* %reduction_input_address, align 4
  %122 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__183(float* %122, float* %reduction_input_address, float* %122)
  %123 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.57.typed4, i32 0, i32 %22, i32 %23
  store float %multiply.41.clone.1, float* %123, align 4
  br label %output_x_in_tile-after

reduction_atomic_update-true:                     ; preds = %output_y_in_tile.loop_exit
  %source = load float, float* %34, align 4
  %124 = atomicrmw fadd float* %output_element_address, float %source seq_cst
  br label %reduction_atomic_update-after
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

define internal void @PartitionedCall_gradients_mnist_classifier_StatefulPartitionedCall_grad_PartitionedCall_gradients_dense_1_Softmax_grad_Sum_reduction_170(float* dereferenceable(4) %x.171.typed, float* dereferenceable(4) %y.172.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.173.typed = alloca float, align 4
  %0 = load float, float* %x.171.typed, align 4
  %1 = load float, float* %y.172.typed, align 4
  %add.173 = fadd float %0, %1
  store float %add.173, float* %add.173.typed, align 4
  %load_ret_value = load float, float* %add.173.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define internal void @add_float__183(float* dereferenceable(4) %x.184.typed, float* dereferenceable(4) %y.185.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.186.typed = alloca float, align 4
  %0 = load float, float* %x.184.typed, align 4
  %1 = load float, float* %y.185.typed, align 4
  %add.186 = fadd float %0, %1
  store float %add.186, float* %add.186.typed, align 4
  %load_ret_value = load float, float* %add.186.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: convergent inaccessiblememonly nounwind
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #4

define void @fusion_41(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(5120) %alloc19, i8* noalias align 64 dereferenceable(5120) %alloc21, i8* noalias align 64 dereferenceable(4096) %alloc25, i8* noalias align 16 dereferenceable(4096) %alloc26, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %parameter_buffer74 = alloca float, align 4
  %parameter_buffer73 = alloca float, align 4
  %return_buffer72 = alloca float, align 4
  %reduce.9.inner.invar_address.reduction_dim.157 = alloca i32, align 4
  %accumulator_053 = alloca float, align 4
  %parameter_buffer52 = alloca float, align 4
  %parameter_buffer51 = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %reduce.9.inner.invar_address.reduction_dim.135 = alloca i32, align 4
  %accumulator_031 = alloca float, align 4
  %parameter_buffer30 = alloca float, align 4
  %parameter_buffer29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %reduce.9.inner.invar_address.reduction_dim.113 = alloca i32, align 4
  %accumulator_09 = alloca float, align 4
  %parameter_buffer8 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %return_buffer = alloca float, align 4
  %reduce.9.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %fusion.41.raw = getelementptr inbounds i8, i8* %alloc25, i64 0
  %fusion.41.typed = bitcast i8* %fusion.41.raw to [1024 x float]*
  %get-tuple-element.118.raw = getelementptr inbounds i8, i8* %alloc19, i64 0
  %get-tuple-element.118.typed = bitcast i8* %get-tuple-element.118.raw to [1024 x float]*
  %fusion.47.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.47.typed = bitcast i8* %fusion.47.raw to [1024 x [10 x float]]*
  %reduce.129.raw = getelementptr inbounds i8, i8* %alloc21, i64 0
  %reduce.129.typed = bitcast i8* %reduce.129.raw to [1024 x float]*
  %arg0.1.raw = getelementptr inbounds i8, i8* %alloc26, i64 0
  %arg0.1.typed = bitcast i8* %arg0.1.raw to [1024 x i32]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %4 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %6 = udiv i32 %linear_index3, 1
  %7 = icmp ult i32 %linear_index_base, 1024
  br i1 %7, label %fusion.41.in_bounds-true, label %fusion.41.in_bounds-after

fusion.41.in_bounds-after:                        ; preds = %reduce.9.inner.loop_exit.reduction_dim.154, %entry
  ret void

fusion.41.in_bounds-true:                         ; preds = %entry
  %8 = load float, float* bitcast ([4 x i8]* @39 to float*), align 4
  store float %8, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.9.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.1

reduce.9.inner.loop_header.reduction_dim.1:       ; preds = %reduce.9.inner.loop_body.reduction_dim.1, %fusion.41.in_bounds-true
  %reduce.9.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.9.inner.invar_address.reduction_dim.1, align 4
  %9 = icmp uge i32 %reduce.9.inner.indvar.reduction_dim.1, 10
  br i1 %9, label %reduce.9.inner.loop_exit.reduction_dim.1, label %reduce.9.inner.loop_body.reduction_dim.1

reduce.9.inner.loop_body.reduction_dim.1:         ; preds = %reduce.9.inner.loop_header.reduction_dim.1
  %10 = load float, float* %accumulator_0, align 4
  %param_3.106 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %3
  %param_3.1064 = load i32, i32* %param_3.106, align 4, !invariant.load !65
  %11 = sitofp i32 %param_3.1064 to float
  %12 = fptosi float %11 to i64
  %13 = mul nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.1, 1
  %14 = add nuw nsw i32 0, %13
  %15 = zext i32 %14 to i64
  %16 = icmp eq i64 %12, %15
  %17 = zext i1 %16 to i8
  %18 = load float, float* bitcast ([4 x i8]* @40 to float*), align 4
  %19 = load float, float* bitcast ([4 x i8]* @41 to float*), align 4
  %20 = trunc i8 %17 to i1
  %21 = select i1 %20, float %18, float %19
  %22 = load i64, i64* bitcast ([8 x i8]* @42 to i64*), align 8
  %23 = icmp sle i64 %22, %12
  %24 = zext i1 %23 to i8
  %25 = load i64, i64* bitcast ([8 x i8]* @43 to i64*), align 8
  %26 = icmp slt i64 %12, %25
  %27 = zext i1 %26 to i8
  %28 = and i8 %24, %27
  %29 = load float, float* bitcast ([4 x i8]* @44 to float*), align 4
  %30 = load float, float* bitcast ([4 x i8]* @45 to float*), align 4
  %31 = trunc i8 %28 to i1
  %32 = select i1 %31, float %29, float %30
  %add.34 = fadd float %21, %32
  %33 = fneg float %add.34
  %param_1.195 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %3, i32 %reduce.9.inner.indvar.reduction_dim.1
  %param_1.1955 = load float, float* %param_1.195, align 4, !invariant.load !65
  %param_2.216 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.129.typed, i32 0, i32 %3
  %param_2.2166 = load float, float* %param_2.216, align 4, !invariant.load !65
  %subtract.61 = fsub float %param_1.1955, %param_2.2166
  %param_0.108 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.118.typed, i32 0, i32 %3
  %param_0.1087 = load float, float* %param_0.108, align 4, !invariant.load !65
  %subtract.35 = fsub float %subtract.61, %param_0.1087
  %multiply.45 = fmul float %33, %subtract.35
  store float %10, float* %parameter_buffer, align 4
  store float %multiply.45, float* %parameter_buffer8, align 4
  call void @add_float__148(float* %parameter_buffer, float* %parameter_buffer8, float* %return_buffer)
  %34 = load float, float* %return_buffer, align 4
  store float %34, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.9.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.1

reduce.9.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.9.inner.loop_header.reduction_dim.1
  %35 = load float, float* %accumulator_0, align 4
  %36 = bitcast [1024 x float]* %fusion.41.typed to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index_base
  store float %35, float* %37, align 4
  %38 = load float, float* bitcast ([4 x i8]* @46 to float*), align 4
  store float %38, float* %accumulator_09, align 4
  store i32 0, i32* %reduce.9.inner.invar_address.reduction_dim.113, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.111

reduce.9.inner.loop_header.reduction_dim.111:     ; preds = %reduce.9.inner.loop_body.reduction_dim.112, %reduce.9.inner.loop_exit.reduction_dim.1
  %reduce.9.inner.indvar.reduction_dim.114 = load i32, i32* %reduce.9.inner.invar_address.reduction_dim.113, align 4
  %39 = icmp uge i32 %reduce.9.inner.indvar.reduction_dim.114, 10
  br i1 %39, label %reduce.9.inner.loop_exit.reduction_dim.110, label %reduce.9.inner.loop_body.reduction_dim.112

reduce.9.inner.loop_body.reduction_dim.112:       ; preds = %reduce.9.inner.loop_header.reduction_dim.111
  %40 = load float, float* %accumulator_09, align 4
  %param_3.10616 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %4
  %param_3.10617 = load i32, i32* %param_3.10616, align 4, !invariant.load !65
  %41 = sitofp i32 %param_3.10617 to float
  %42 = fptosi float %41 to i64
  %43 = mul nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.114, 1
  %44 = add nuw nsw i32 0, %43
  %45 = zext i32 %44 to i64
  %46 = icmp eq i64 %42, %45
  %47 = zext i1 %46 to i8
  %48 = load float, float* bitcast ([4 x i8]* @47 to float*), align 4
  %49 = load float, float* bitcast ([4 x i8]* @48 to float*), align 4
  %50 = trunc i8 %47 to i1
  %51 = select i1 %50, float %48, float %49
  %52 = load i64, i64* bitcast ([8 x i8]* @49 to i64*), align 8
  %53 = icmp sle i64 %52, %42
  %54 = zext i1 %53 to i8
  %55 = load i64, i64* bitcast ([8 x i8]* @50 to i64*), align 8
  %56 = icmp slt i64 %42, %55
  %57 = zext i1 %56 to i8
  %58 = and i8 %54, %57
  %59 = load float, float* bitcast ([4 x i8]* @51 to float*), align 4
  %60 = load float, float* bitcast ([4 x i8]* @52 to float*), align 4
  %61 = trunc i8 %58 to i1
  %62 = select i1 %61, float %59, float %60
  %add.3418 = fadd float %51, %62
  %63 = fneg float %add.3418
  %param_1.19519 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %4, i32 %reduce.9.inner.indvar.reduction_dim.114
  %param_1.19520 = load float, float* %param_1.19519, align 4, !invariant.load !65
  %param_2.21621 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.129.typed, i32 0, i32 %4
  %param_2.21622 = load float, float* %param_2.21621, align 4, !invariant.load !65
  %subtract.6123 = fsub float %param_1.19520, %param_2.21622
  %param_0.10824 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.118.typed, i32 0, i32 %4
  %param_0.10825 = load float, float* %param_0.10824, align 4, !invariant.load !65
  %subtract.3526 = fsub float %subtract.6123, %param_0.10825
  %multiply.4527 = fmul float %63, %subtract.3526
  store float %40, float* %parameter_buffer29, align 4
  store float %multiply.4527, float* %parameter_buffer30, align 4
  call void @add_float__148(float* %parameter_buffer29, float* %parameter_buffer30, float* %return_buffer28)
  %64 = load float, float* %return_buffer28, align 4
  store float %64, float* %accumulator_09, align 4
  %invar.inc15 = add nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.114, 1
  store i32 %invar.inc15, i32* %reduce.9.inner.invar_address.reduction_dim.113, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.111

reduce.9.inner.loop_exit.reduction_dim.110:       ; preds = %reduce.9.inner.loop_header.reduction_dim.111
  %65 = load float, float* %accumulator_09, align 4
  %66 = bitcast [1024 x float]* %fusion.41.typed to float*
  %67 = getelementptr inbounds float, float* %66, i32 %linear_index1
  store float %65, float* %67, align 4
  %68 = load float, float* bitcast ([4 x i8]* @53 to float*), align 4
  store float %68, float* %accumulator_031, align 4
  store i32 0, i32* %reduce.9.inner.invar_address.reduction_dim.135, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.133

reduce.9.inner.loop_header.reduction_dim.133:     ; preds = %reduce.9.inner.loop_body.reduction_dim.134, %reduce.9.inner.loop_exit.reduction_dim.110
  %reduce.9.inner.indvar.reduction_dim.136 = load i32, i32* %reduce.9.inner.invar_address.reduction_dim.135, align 4
  %69 = icmp uge i32 %reduce.9.inner.indvar.reduction_dim.136, 10
  br i1 %69, label %reduce.9.inner.loop_exit.reduction_dim.132, label %reduce.9.inner.loop_body.reduction_dim.134

reduce.9.inner.loop_body.reduction_dim.134:       ; preds = %reduce.9.inner.loop_header.reduction_dim.133
  %70 = load float, float* %accumulator_031, align 4
  %param_3.10638 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %5
  %param_3.10639 = load i32, i32* %param_3.10638, align 4, !invariant.load !65
  %71 = sitofp i32 %param_3.10639 to float
  %72 = fptosi float %71 to i64
  %73 = mul nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.136, 1
  %74 = add nuw nsw i32 0, %73
  %75 = zext i32 %74 to i64
  %76 = icmp eq i64 %72, %75
  %77 = zext i1 %76 to i8
  %78 = load float, float* bitcast ([4 x i8]* @54 to float*), align 4
  %79 = load float, float* bitcast ([4 x i8]* @55 to float*), align 4
  %80 = trunc i8 %77 to i1
  %81 = select i1 %80, float %78, float %79
  %82 = load i64, i64* bitcast ([8 x i8]* @56 to i64*), align 8
  %83 = icmp sle i64 %82, %72
  %84 = zext i1 %83 to i8
  %85 = load i64, i64* bitcast ([8 x i8]* @57 to i64*), align 8
  %86 = icmp slt i64 %72, %85
  %87 = zext i1 %86 to i8
  %88 = and i8 %84, %87
  %89 = load float, float* bitcast ([4 x i8]* @58 to float*), align 4
  %90 = load float, float* bitcast ([4 x i8]* @59 to float*), align 4
  %91 = trunc i8 %88 to i1
  %92 = select i1 %91, float %89, float %90
  %add.3440 = fadd float %81, %92
  %93 = fneg float %add.3440
  %param_1.19541 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %5, i32 %reduce.9.inner.indvar.reduction_dim.136
  %param_1.19542 = load float, float* %param_1.19541, align 4, !invariant.load !65
  %param_2.21643 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.129.typed, i32 0, i32 %5
  %param_2.21644 = load float, float* %param_2.21643, align 4, !invariant.load !65
  %subtract.6145 = fsub float %param_1.19542, %param_2.21644
  %param_0.10846 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.118.typed, i32 0, i32 %5
  %param_0.10847 = load float, float* %param_0.10846, align 4, !invariant.load !65
  %subtract.3548 = fsub float %subtract.6145, %param_0.10847
  %multiply.4549 = fmul float %93, %subtract.3548
  store float %70, float* %parameter_buffer51, align 4
  store float %multiply.4549, float* %parameter_buffer52, align 4
  call void @add_float__148(float* %parameter_buffer51, float* %parameter_buffer52, float* %return_buffer50)
  %94 = load float, float* %return_buffer50, align 4
  store float %94, float* %accumulator_031, align 4
  %invar.inc37 = add nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.136, 1
  store i32 %invar.inc37, i32* %reduce.9.inner.invar_address.reduction_dim.135, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.133

reduce.9.inner.loop_exit.reduction_dim.132:       ; preds = %reduce.9.inner.loop_header.reduction_dim.133
  %95 = load float, float* %accumulator_031, align 4
  %96 = bitcast [1024 x float]* %fusion.41.typed to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index2
  store float %95, float* %97, align 4
  %98 = load float, float* bitcast ([4 x i8]* @60 to float*), align 4
  store float %98, float* %accumulator_053, align 4
  store i32 0, i32* %reduce.9.inner.invar_address.reduction_dim.157, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.155

reduce.9.inner.loop_header.reduction_dim.155:     ; preds = %reduce.9.inner.loop_body.reduction_dim.156, %reduce.9.inner.loop_exit.reduction_dim.132
  %reduce.9.inner.indvar.reduction_dim.158 = load i32, i32* %reduce.9.inner.invar_address.reduction_dim.157, align 4
  %99 = icmp uge i32 %reduce.9.inner.indvar.reduction_dim.158, 10
  br i1 %99, label %reduce.9.inner.loop_exit.reduction_dim.154, label %reduce.9.inner.loop_body.reduction_dim.156

reduce.9.inner.loop_body.reduction_dim.156:       ; preds = %reduce.9.inner.loop_header.reduction_dim.155
  %100 = load float, float* %accumulator_053, align 4
  %param_3.10660 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arg0.1.typed, i32 0, i32 %6
  %param_3.10661 = load i32, i32* %param_3.10660, align 4, !invariant.load !65
  %101 = sitofp i32 %param_3.10661 to float
  %102 = fptosi float %101 to i64
  %103 = mul nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.158, 1
  %104 = add nuw nsw i32 0, %103
  %105 = zext i32 %104 to i64
  %106 = icmp eq i64 %102, %105
  %107 = zext i1 %106 to i8
  %108 = load float, float* bitcast ([4 x i8]* @61 to float*), align 4
  %109 = load float, float* bitcast ([4 x i8]* @62 to float*), align 4
  %110 = trunc i8 %107 to i1
  %111 = select i1 %110, float %108, float %109
  %112 = load i64, i64* bitcast ([8 x i8]* @63 to i64*), align 8
  %113 = icmp sle i64 %112, %102
  %114 = zext i1 %113 to i8
  %115 = load i64, i64* bitcast ([8 x i8]* @64 to i64*), align 8
  %116 = icmp slt i64 %102, %115
  %117 = zext i1 %116 to i8
  %118 = and i8 %114, %117
  %119 = load float, float* bitcast ([4 x i8]* @65 to float*), align 4
  %120 = load float, float* bitcast ([4 x i8]* @66 to float*), align 4
  %121 = trunc i8 %118 to i1
  %122 = select i1 %121, float %119, float %120
  %add.3462 = fadd float %111, %122
  %123 = fneg float %add.3462
  %param_1.19563 = getelementptr inbounds [1024 x [10 x float]], [1024 x [10 x float]]* %fusion.47.typed, i32 0, i32 %6, i32 %reduce.9.inner.indvar.reduction_dim.158
  %param_1.19564 = load float, float* %param_1.19563, align 4, !invariant.load !65
  %param_2.21665 = getelementptr inbounds [1024 x float], [1024 x float]* %reduce.129.typed, i32 0, i32 %6
  %param_2.21666 = load float, float* %param_2.21665, align 4, !invariant.load !65
  %subtract.6167 = fsub float %param_1.19564, %param_2.21666
  %param_0.10868 = getelementptr inbounds [1024 x float], [1024 x float]* %get-tuple-element.118.typed, i32 0, i32 %6
  %param_0.10869 = load float, float* %param_0.10868, align 4, !invariant.load !65
  %subtract.3570 = fsub float %subtract.6167, %param_0.10869
  %multiply.4571 = fmul float %123, %subtract.3570
  store float %100, float* %parameter_buffer73, align 4
  store float %multiply.4571, float* %parameter_buffer74, align 4
  call void @add_float__148(float* %parameter_buffer73, float* %parameter_buffer74, float* %return_buffer72)
  %124 = load float, float* %return_buffer72, align 4
  store float %124, float* %accumulator_053, align 4
  %invar.inc59 = add nuw nsw i32 %reduce.9.inner.indvar.reduction_dim.158, 1
  store i32 %invar.inc59, i32* %reduce.9.inner.invar_address.reduction_dim.157, align 4
  br label %reduce.9.inner.loop_header.reduction_dim.155

reduce.9.inner.loop_exit.reduction_dim.154:       ; preds = %reduce.9.inner.loop_header.reduction_dim.155
  %125 = load float, float* %accumulator_053, align 4
  %126 = bitcast [1024 x float]* %fusion.41.typed to float*
  %127 = getelementptr inbounds float, float* %126, i32 %linear_index3
  store float %125, float* %127, align 4
  br label %fusion.41.in_bounds-after
}

define internal void @add_float__148(float* dereferenceable(4) %x.149.typed, float* dereferenceable(4) %y.150.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.151.typed = alloca float, align 4
  %0 = load float, float* %x.149.typed, align 4
  %1 = load float, float* %y.150.typed, align 4
  %add.151 = fadd float %0, %1
  store float %add.151, float* %add.151.typed, align 4
  %load_ret_value = load float, float* %add.151.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_56(i8* noalias align 64 dereferenceable(819200) %alloc7, i8* noalias align 64 dereferenceable(819200) %alloc8, i8* noalias align 64 dereferenceable(819200) %alloc9, i8* noalias align 64 dereferenceable(3200) %alloc29, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %result_from_other_lane39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %output_y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result.0 = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %fusion.56.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055872
  %fusion.56.typed = bitcast i8* %fusion.56.raw to [2 x i8*]*
  %fusion.56.raw1 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %fusion.56.typed2 = bitcast i8* %fusion.56.raw1 to [128 x float]*
  %fusion.56.raw3 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %fusion.56.typed4 = bitcast i8* %fusion.56.raw3 to [1024 x [128 x float]]*
  %custom-call.15.raw = getelementptr inbounds i8, i8* %alloc8, i64 0
  %custom-call.15.typed = bitcast i8* %custom-call.15.raw to [1024 x [128 x float]]*
  %custom-call.12.raw = getelementptr inbounds i8, i8* %alloc9, i64 0
  %custom-call.12.typed = bitcast i8* %custom-call.12.raw to [1024 x [128 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !64
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_atomic_update-after42, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %2 = load float, float* bitcast ([4 x i8]* @67 to float*), align 4
  %3 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  store float %2, float* %3, align 4
  %4 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 1
  store float %2, float* %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %7 = udiv i32 %6, 1
  %8 = urem i32 %7, 2
  %9 = udiv i32 %6, 2
  %10 = urem i32 %9, 1
  %11 = udiv i32 %6, 2
  %block_origin.z = mul i32 %11, 1
  %12 = icmp eq i32 %10, 0
  %tile_bound = select i1 %12, i32 1024, i32 4096
  %13 = icmp eq i32 %8, 1
  %tile_bound5 = select i1 %13, i32 64, i32 64
  %tile_origin.1 = mul i32 %10, 4096
  %tile_origin.2 = mul i32 %8, 64
  %14 = mul i32 %thread_id.x, 2
  %15 = add i32 %tile_origin.2, %14
  %16 = sub i32 %tile_bound, %thread_id.y
  %17 = add i32 %16, 32
  %18 = add i32 %17, -1
  %19 = udiv i32 %18, 32
  store i32 0, i32* %output_y_in_tile.invar_address, align 4
  br label %output_y_in_tile.loop_header

output_y_in_tile.loop_header:                     ; preds = %output_x_in_tile-after10, %reduce-group-0-true
  %output_y_in_tile.indvar = load i32, i32* %output_y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %output_y_in_tile.indvar, %19
  br i1 %20, label %output_y_in_tile.loop_exit, label %output_y_in_tile.loop_body

output_y_in_tile.loop_body:                       ; preds = %output_y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %output_y_in_tile.indvar, 1
  store i32 %invar.inc, i32* %output_y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %output_y_in_tile.indvar, 0
  %22 = mul i32 %output_y_in_tile.indvar, 32
  %23 = add i32 %thread_id.y, %22
  %24 = add i32 %tile_origin.1, %23
  %x_loc = add i32 0, %14
  %25 = add i32 %15, 0
  %26 = icmp ult i32 %x_loc, %tile_bound5
  br i1 %26, label %output_x_in_tile-true, label %output_x_in_tile-after

output_x_in_tile-after:                           ; preds = %output_x_in_tile-true, %output_y_in_tile.loop_body
  %x_loc8 = add i32 1, %14
  %27 = add i32 %15, 1
  %28 = icmp ult i32 %x_loc8, %tile_bound5
  br i1 %28, label %output_x_in_tile-true9, label %output_x_in_tile-after10

output_x_in_tile-after10:                         ; preds = %output_x_in_tile-true9, %output_x_in_tile-after
  br label %output_y_in_tile.loop_header, !llvm.loop !77

output_y_in_tile.loop_exit:                       ; preds = %output_y_in_tile.loop_header
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %thread_id.x16 = urem i32 %29, 32
  %thread_id.y17 = udiv i32 %29, 32
  %lane_id18 = urem i32 %29, 32
  %30 = mul i32 %thread_id.y17, 2
  %31 = add i32 %tile_origin.1, %thread_id.x16
  %32 = add i32 %tile_origin.2, %30
  %33 = add i32 %32, 0
  %34 = mul i32 %block_origin.z, 128
  %35 = add i32 %34, %33
  %36 = udiv i32 %35, 1
  %output_element_address = getelementptr inbounds [128 x float], [128 x float]* %fusion.56.typed2, i32 0, i32 %36
  %current_output = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  %37 = getelementptr inbounds [2 x [32 x [33 x float]]], [2 x [32 x [33 x float]]] addrspace(3)* @shared_cache_01, i32 0, i32 0, i32 %thread_id.x16, i32 %thread_id.y17
  %shmem_output_address = addrspacecast float addrspace(3)* %37 to float*
  %38 = load float, float* %current_output, align 4
  store float %38, float* %shmem_output_address, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [2 x [32 x [33 x float]]], [2 x [32 x [33 x float]]] addrspace(3)* @shared_cache_01, i32 0, i32 0, i32 %thread_id.y17, i32 %thread_id.x16
  %39 = addrspacecast float addrspace(3)* %shmem_transposed_addr to float*
  %partial_reduction_result = load float, float* %39, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result, i32 16, i32 31)
  store float %40, float* %result_from_other_lane, align 4
  call void @add_float__222(float* %39, float* %result_from_other_lane, float* %39)
  %partial_reduction_result20 = load float, float* %39, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 8, i32 31)
  store float %41, float* %result_from_other_lane19, align 4
  call void @add_float__222(float* %39, float* %result_from_other_lane19, float* %39)
  %partial_reduction_result22 = load float, float* %39, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 4, i32 31)
  store float %42, float* %result_from_other_lane21, align 4
  call void @add_float__222(float* %39, float* %result_from_other_lane21, float* %39)
  %partial_reduction_result24 = load float, float* %39, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 2, i32 31)
  store float %43, float* %result_from_other_lane23, align 4
  call void @add_float__222(float* %39, float* %result_from_other_lane23, float* %39)
  %partial_reduction_result26 = load float, float* %39, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %44, float* %result_from_other_lane25, align 4
  call void @add_float__222(float* %39, float* %result_from_other_lane25, float* %39)
  %45 = icmp ult i32 %thread_id.x16, %tile_bound
  %46 = mul i32 %thread_id.y17, 2
  %47 = icmp ult i32 %46, %tile_bound5
  %48 = and i1 %47, %45
  %49 = icmp eq i32 %lane_id18, 0
  %50 = and i1 %48, %49
  br i1 %50, label %reduction_atomic_update-true, label %reduction_atomic_update-after

reduction_atomic_update-after:                    ; preds = %reduction_atomic_update-true, %output_y_in_tile.loop_exit
  %51 = add i32 %32, 1
  %52 = mul i32 %block_origin.z, 128
  %53 = add i32 %52, %51
  %54 = udiv i32 %53, 1
  %output_element_address27 = getelementptr inbounds [128 x float], [128 x float]* %fusion.56.typed2, i32 0, i32 %54
  %current_output28 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 1
  %55 = getelementptr inbounds [2 x [32 x [33 x float]]], [2 x [32 x [33 x float]]] addrspace(3)* @shared_cache_01, i32 0, i32 1, i32 %thread_id.x16, i32 %thread_id.y17
  %shmem_output_address29 = addrspacecast float addrspace(3)* %55 to float*
  %56 = load float, float* %current_output28, align 4
  store float %56, float* %shmem_output_address29, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr30 = getelementptr inbounds [2 x [32 x [33 x float]]], [2 x [32 x [33 x float]]] addrspace(3)* @shared_cache_01, i32 0, i32 1, i32 %thread_id.y17, i32 %thread_id.x16
  %57 = addrspacecast float addrspace(3)* %shmem_transposed_addr30 to float*
  %partial_reduction_result32 = load float, float* %57, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %58, float* %result_from_other_lane31, align 4
  call void @add_float__222(float* %57, float* %result_from_other_lane31, float* %57)
  %partial_reduction_result34 = load float, float* %57, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 8, i32 31)
  store float %59, float* %result_from_other_lane33, align 4
  call void @add_float__222(float* %57, float* %result_from_other_lane33, float* %57)
  %partial_reduction_result36 = load float, float* %57, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 4, i32 31)
  store float %60, float* %result_from_other_lane35, align 4
  call void @add_float__222(float* %57, float* %result_from_other_lane35, float* %57)
  %partial_reduction_result38 = load float, float* %57, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 2, i32 31)
  store float %61, float* %result_from_other_lane37, align 4
  call void @add_float__222(float* %57, float* %result_from_other_lane37, float* %57)
  %partial_reduction_result40 = load float, float* %57, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %62, float* %result_from_other_lane39, align 4
  call void @add_float__222(float* %57, float* %result_from_other_lane39, float* %57)
  %63 = icmp ult i32 %thread_id.x16, %tile_bound
  %64 = mul i32 %thread_id.y17, 2
  %65 = icmp ult i32 %64, %tile_bound5
  %66 = and i1 %65, %63
  %67 = icmp eq i32 %lane_id18, 0
  %68 = and i1 %66, %67
  br i1 %68, label %reduction_atomic_update-true41, label %reduction_atomic_update-after42

reduction_atomic_update-after42:                  ; preds = %reduction_atomic_update-true41, %reduction_atomic_update-after
  br label %reduce-group-0-after

output_x_in_tile-true:                            ; preds = %output_y_in_tile.loop_body
  %69 = load float, float* bitcast ([4 x i8]* @68 to float*), align 4
  %param_1.259 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %custom-call.12.typed, i32 0, i32 %24, i32 %25
  %param_1.2596 = load float, float* %param_1.259, align 4, !invariant.load !65
  %70 = call float @llvm.maxnum.f32(float %69, float %param_1.2596)
  %compare.3.clone.1 = fcmp ogt float %70, %69
  %71 = zext i1 %compare.3.clone.1 to i8
  %param_0.160 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %custom-call.15.typed, i32 0, i32 %24, i32 %25
  %param_0.1607 = load float, float* %param_0.160, align 4, !invariant.load !65
  %72 = trunc i8 %71 to i1
  %73 = select i1 %72, float %param_0.1607, float %69
  store float %73, float* %reduction_input_address, align 4
  %74 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__222(float* %74, float* %reduction_input_address, float* %74)
  %75 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %fusion.56.typed4, i32 0, i32 %24, i32 %25
  store float %73, float* %75, align 4
  br label %output_x_in_tile-after

output_x_in_tile-true9:                           ; preds = %output_x_in_tile-after
  %76 = load float, float* bitcast ([4 x i8]* @69 to float*), align 4
  %param_1.25911 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %custom-call.12.typed, i32 0, i32 %24, i32 %27
  %param_1.25912 = load float, float* %param_1.25911, align 4, !invariant.load !65
  %77 = call float @llvm.maxnum.f32(float %76, float %param_1.25912)
  %compare.3.clone.113 = fcmp ogt float %77, %76
  %78 = zext i1 %compare.3.clone.113 to i8
  %param_0.16014 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %custom-call.15.typed, i32 0, i32 %24, i32 %27
  %param_0.16015 = load float, float* %param_0.16014, align 4, !invariant.load !65
  %79 = trunc i8 %78 to i1
  %80 = select i1 %79, float %param_0.16015, float %76
  store float %80, float* %reduction_input_address, align 4
  %81 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 1
  call void @add_float__222(float* %81, float* %reduction_input_address, float* %81)
  %82 = getelementptr inbounds [1024 x [128 x float]], [1024 x [128 x float]]* %fusion.56.typed4, i32 0, i32 %24, i32 %27
  store float %80, float* %82, align 4
  br label %output_x_in_tile-after10

reduction_atomic_update-true:                     ; preds = %output_y_in_tile.loop_exit
  %source = load float, float* %39, align 4
  %83 = atomicrmw fadd float* %output_element_address, float %source seq_cst
  br label %reduction_atomic_update-after

reduction_atomic_update-true41:                   ; preds = %reduction_atomic_update-after
  %source43 = load float, float* %57, align 4
  %84 = atomicrmw fadd float* %output_element_address27, float %source43 seq_cst
  br label %reduction_atomic_update-after42
}

define internal void @add_float__222(float* dereferenceable(4) %x.223.typed, float* dereferenceable(4) %y.224.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.225.typed = alloca float, align 4
  %0 = load float, float* %x.223.typed, align 4
  %1 = load float, float* %y.224.typed, align 4
  %add.225 = fadd float %0, %1
  store float %add.225, float* %add.225.typed, align 4
  %load_ret_value = load float, float* %add.225.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_6(i8* noalias align 64 dereferenceable(2359296) %alloc1, i8* noalias align 64 dereferenceable(2359296) %alloc2, i8* noalias align 64 dereferenceable(2359296) %alloc3, i8* noalias align 16 dereferenceable(2359296) %alloc4, i8* noalias align 16 dereferenceable(2359296) %alloc5, i8* noalias align 16 dereferenceable(2359296) %alloc6, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.6.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056256
  %fusion.6.typed = bitcast i8* %fusion.6.raw to [3 x i8*]*
  %fusion.6.raw1 = getelementptr inbounds i8, i8* %alloc3, i64 0
  %fusion.6.typed2 = bitcast i8* %fusion.6.raw1 to [4608 x [128 x float]]*
  %fusion.6.raw3 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %fusion.6.typed4 = bitcast i8* %fusion.6.raw3 to [4608 x [128 x float]]*
  %fusion.6.raw5 = getelementptr inbounds i8, i8* %alloc1, i64 0
  %fusion.6.typed6 = bitcast i8* %fusion.6.raw5 to [4608 x [128 x float]]*
  %arg13.14.raw = getelementptr inbounds i8, i8* %alloc4, i64 0
  %arg13.14.typed = bitcast i8* %arg13.14.raw to [4608 x [128 x float]]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg20.21.raw = getelementptr inbounds i8, i8* %alloc5, i64 0
  %arg20.21.typed = bitcast i8* %arg20.21.raw to [4608 x [128 x float]]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %custom-call.17.raw = getelementptr inbounds i8, i8* %alloc3, i64 0
  %custom-call.17.typed = bitcast i8* %custom-call.17.raw to [4608 x [128 x float]]*
  %arg21.22.raw = getelementptr inbounds i8, i8* %alloc6, i64 0
  %arg21.22.typed = bitcast i8* %arg21.22.raw to [4608 x [128 x float]]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !78
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %7 = mul nuw nsw i32 %5, 256
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 147456
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index_base, 128
  %linear_index7 = add nuw nsw i32 %linear_index_base, 1
  %11 = udiv i32 %linear_index7, 1
  %12 = urem i32 %11, 128
  %13 = udiv i32 %linear_index7, 128
  %linear_index8 = add nuw nsw i32 %linear_index_base, 2
  %14 = udiv i32 %linear_index8, 1
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index8, 128
  %linear_index9 = add nuw nsw i32 %linear_index_base, 3
  %17 = udiv i32 %linear_index9, 1
  %18 = urem i32 %17, 128
  %19 = udiv i32 %linear_index9, 128
  %20 = icmp ult i32 %linear_index_base, 589824
  br i1 %20, label %fusion.6.in_bounds-true, label %fusion.6.in_bounds-after

fusion.6.in_bounds-after:                         ; preds = %fusion.6.in_bounds-true, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %21 = bitcast [4608 x [128 x float]]* %fusion.6.typed2 to i8*
  %22 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.6.typed, i64 0, i64 0
  store i8* %21, i8** %22, align 8
  %23 = bitcast [4608 x [128 x float]]* %fusion.6.typed4 to i8*
  %24 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.6.typed, i64 0, i64 1
  store i8* %23, i8** %24, align 8
  %25 = bitcast [4608 x [128 x float]]* %fusion.6.typed6 to i8*
  %26 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.6.typed, i64 0, i64 2
  store i8* %25, i8** %26, align 8
  br label %emit_mof_tuple-after

fusion.6.in_bounds-true:                          ; preds = %emit_mof_tuple-after
  %27 = bitcast [4608 x [128 x float]]* %arg13.14.typed to float*
  %param_0.6 = getelementptr inbounds float, float* %27, i32 %linear_index_base
  %param_0.610 = load float, float* %param_0.6, align 4, !invariant.load !65
  %28 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.287 = getelementptr inbounds float, float* %28, i32 %linear_index_base
  %param_2.28711 = load float, float* %param_2.287, align 4, !invariant.load !65
  %29 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.101 = getelementptr inbounds float, float* %29, i32 %linear_index_base
  %param_4.10112 = load float, float* %param_4.101, align 4
  %30 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28713 = getelementptr inbounds float, float* %30, i32 %linear_index_base
  %param_2.28714 = load float, float* %param_2.28713, align 4, !invariant.load !65
  %subtract.9.clone.1 = fsub float %param_4.10112, %param_2.28714
  %31 = load float, float* bitcast ([4 x i8]* @70 to float*), align 4
  %param_3.139 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.42.clone.1 = fsub float %31, %param_3.139
  %multiply.11.clone.1 = fmul float %subtract.9.clone.1, %subtract.42.clone.1
  %add.9.clone.1 = fadd float %param_2.28711, %multiply.11.clone.1
  %param_1.247 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.8 = fmul float %add.9.clone.1, %param_1.247
  %32 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.94 = getelementptr inbounds float, float* %32, i32 %linear_index_base
  %param_5.9415 = load float, float* %param_5.94, align 4, !invariant.load !65
  %33 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10116 = getelementptr inbounds float, float* %33, i32 %linear_index_base
  %param_4.10117 = load float, float* %param_4.10116, align 4
  %34 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10118 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  %param_4.10119 = load float, float* %param_4.10118, align 4
  %multiply.10.clone.1 = fmul float %param_4.10117, %param_4.10119
  %35 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9420 = getelementptr inbounds float, float* %35, i32 %linear_index_base
  %param_5.9421 = load float, float* %param_5.9420, align 4, !invariant.load !65
  %subtract.8.clone.1 = fsub float %multiply.10.clone.1, %param_5.9421
  %36 = load float, float* bitcast ([4 x i8]* @71 to float*), align 4
  %param_6.79 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.43.clone.1 = fsub float %36, %param_6.79
  %multiply.9.clone.1 = fmul float %subtract.8.clone.1, %subtract.43.clone.1
  %add.8.clone.1 = fadd float %param_5.9415, %multiply.9.clone.1
  %37 = call float @__nv_sqrtf(float %add.8.clone.1)
  %38 = load float, float* bitcast ([4 x i8]* @72 to float*), align 4
  %add.7 = fadd float %37, %38
  %divide.3 = fdiv float %multiply.8, %add.7
  %subtract.7 = fsub float %param_0.610, %divide.3
  %39 = insertvalue { float, float, float } undef, float %subtract.7, 0
  %40 = insertvalue { float, float, float } %39, float %add.9.clone.1, 1
  %41 = insertvalue { float, float, float } %40, float %add.8.clone.1, 2
  %42 = extractvalue { float, float, float } %41, 0
  %43 = bitcast [4608 x [128 x float]]* %fusion.6.typed2 to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index_base
  store float %42, float* %44, align 4
  %45 = extractvalue { float, float, float } %41, 1
  %46 = bitcast [4608 x [128 x float]]* %fusion.6.typed4 to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index_base
  store float %45, float* %47, align 4
  %48 = extractvalue { float, float, float } %41, 2
  %49 = bitcast [4608 x [128 x float]]* %fusion.6.typed6 to float*
  %50 = getelementptr inbounds float, float* %49, i32 %linear_index_base
  store float %48, float* %50, align 4
  %51 = bitcast [4608 x [128 x float]]* %arg13.14.typed to float*
  %param_0.622 = getelementptr inbounds float, float* %51, i32 %linear_index7
  %param_0.623 = load float, float* %param_0.622, align 4, !invariant.load !65
  %52 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28724 = getelementptr inbounds float, float* %52, i32 %linear_index7
  %param_2.28725 = load float, float* %param_2.28724, align 4, !invariant.load !65
  %53 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10126 = getelementptr inbounds float, float* %53, i32 %linear_index7
  %param_4.10127 = load float, float* %param_4.10126, align 4
  %54 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28728 = getelementptr inbounds float, float* %54, i32 %linear_index7
  %param_2.28729 = load float, float* %param_2.28728, align 4, !invariant.load !65
  %subtract.9.clone.130 = fsub float %param_4.10127, %param_2.28729
  %multiply.11.clone.131 = fmul float %subtract.9.clone.130, %subtract.42.clone.1
  %add.9.clone.132 = fadd float %param_2.28725, %multiply.11.clone.131
  %param_1.24733 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.834 = fmul float %add.9.clone.132, %param_1.24733
  %55 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9435 = getelementptr inbounds float, float* %55, i32 %linear_index7
  %param_5.9436 = load float, float* %param_5.9435, align 4, !invariant.load !65
  %56 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10137 = getelementptr inbounds float, float* %56, i32 %linear_index7
  %param_4.10138 = load float, float* %param_4.10137, align 4
  %57 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10139 = getelementptr inbounds float, float* %57, i32 %linear_index7
  %param_4.10140 = load float, float* %param_4.10139, align 4
  %multiply.10.clone.141 = fmul float %param_4.10138, %param_4.10140
  %58 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9442 = getelementptr inbounds float, float* %58, i32 %linear_index7
  %param_5.9443 = load float, float* %param_5.9442, align 4, !invariant.load !65
  %subtract.8.clone.144 = fsub float %multiply.10.clone.141, %param_5.9443
  %multiply.9.clone.145 = fmul float %subtract.8.clone.144, %subtract.43.clone.1
  %add.8.clone.146 = fadd float %param_5.9436, %multiply.9.clone.145
  %59 = call float @__nv_sqrtf(float %add.8.clone.146)
  %60 = load float, float* bitcast ([4 x i8]* @73 to float*), align 4
  %add.747 = fadd float %59, %60
  %divide.348 = fdiv float %multiply.834, %add.747
  %subtract.749 = fsub float %param_0.623, %divide.348
  %61 = insertvalue { float, float, float } undef, float %subtract.749, 0
  %62 = insertvalue { float, float, float } %61, float %add.9.clone.132, 1
  %63 = insertvalue { float, float, float } %62, float %add.8.clone.146, 2
  %64 = extractvalue { float, float, float } %63, 0
  %65 = bitcast [4608 x [128 x float]]* %fusion.6.typed2 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index7
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float, float } %63, 1
  %68 = bitcast [4608 x [128 x float]]* %fusion.6.typed4 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index7
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %63, 2
  %71 = bitcast [4608 x [128 x float]]* %fusion.6.typed6 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index7
  store float %70, float* %72, align 4
  %73 = bitcast [4608 x [128 x float]]* %arg13.14.typed to float*
  %param_0.650 = getelementptr inbounds float, float* %73, i32 %linear_index8
  %param_0.651 = load float, float* %param_0.650, align 4, !invariant.load !65
  %74 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28752 = getelementptr inbounds float, float* %74, i32 %linear_index8
  %param_2.28753 = load float, float* %param_2.28752, align 4, !invariant.load !65
  %75 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10154 = getelementptr inbounds float, float* %75, i32 %linear_index8
  %param_4.10155 = load float, float* %param_4.10154, align 4
  %76 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28756 = getelementptr inbounds float, float* %76, i32 %linear_index8
  %param_2.28757 = load float, float* %param_2.28756, align 4, !invariant.load !65
  %subtract.9.clone.158 = fsub float %param_4.10155, %param_2.28757
  %multiply.11.clone.159 = fmul float %subtract.9.clone.158, %subtract.42.clone.1
  %add.9.clone.160 = fadd float %param_2.28753, %multiply.11.clone.159
  %param_1.24761 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.862 = fmul float %add.9.clone.160, %param_1.24761
  %77 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9463 = getelementptr inbounds float, float* %77, i32 %linear_index8
  %param_5.9464 = load float, float* %param_5.9463, align 4, !invariant.load !65
  %78 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10165 = getelementptr inbounds float, float* %78, i32 %linear_index8
  %param_4.10166 = load float, float* %param_4.10165, align 4
  %79 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10167 = getelementptr inbounds float, float* %79, i32 %linear_index8
  %param_4.10168 = load float, float* %param_4.10167, align 4
  %multiply.10.clone.169 = fmul float %param_4.10166, %param_4.10168
  %80 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9470 = getelementptr inbounds float, float* %80, i32 %linear_index8
  %param_5.9471 = load float, float* %param_5.9470, align 4, !invariant.load !65
  %subtract.8.clone.172 = fsub float %multiply.10.clone.169, %param_5.9471
  %multiply.9.clone.173 = fmul float %subtract.8.clone.172, %subtract.43.clone.1
  %add.8.clone.174 = fadd float %param_5.9464, %multiply.9.clone.173
  %81 = call float @__nv_sqrtf(float %add.8.clone.174)
  %82 = load float, float* bitcast ([4 x i8]* @74 to float*), align 4
  %add.775 = fadd float %81, %82
  %divide.376 = fdiv float %multiply.862, %add.775
  %subtract.777 = fsub float %param_0.651, %divide.376
  %83 = insertvalue { float, float, float } undef, float %subtract.777, 0
  %84 = insertvalue { float, float, float } %83, float %add.9.clone.160, 1
  %85 = insertvalue { float, float, float } %84, float %add.8.clone.174, 2
  %86 = extractvalue { float, float, float } %85, 0
  %87 = bitcast [4608 x [128 x float]]* %fusion.6.typed2 to float*
  %88 = getelementptr inbounds float, float* %87, i32 %linear_index8
  store float %86, float* %88, align 4
  %89 = extractvalue { float, float, float } %85, 1
  %90 = bitcast [4608 x [128 x float]]* %fusion.6.typed4 to float*
  %91 = getelementptr inbounds float, float* %90, i32 %linear_index8
  store float %89, float* %91, align 4
  %92 = extractvalue { float, float, float } %85, 2
  %93 = bitcast [4608 x [128 x float]]* %fusion.6.typed6 to float*
  %94 = getelementptr inbounds float, float* %93, i32 %linear_index8
  store float %92, float* %94, align 4
  %95 = bitcast [4608 x [128 x float]]* %arg13.14.typed to float*
  %param_0.678 = getelementptr inbounds float, float* %95, i32 %linear_index9
  %param_0.679 = load float, float* %param_0.678, align 4, !invariant.load !65
  %96 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28780 = getelementptr inbounds float, float* %96, i32 %linear_index9
  %param_2.28781 = load float, float* %param_2.28780, align 4, !invariant.load !65
  %97 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10182 = getelementptr inbounds float, float* %97, i32 %linear_index9
  %param_4.10183 = load float, float* %param_4.10182, align 4
  %98 = bitcast [4608 x [128 x float]]* %arg20.21.typed to float*
  %param_2.28784 = getelementptr inbounds float, float* %98, i32 %linear_index9
  %param_2.28785 = load float, float* %param_2.28784, align 4, !invariant.load !65
  %subtract.9.clone.186 = fsub float %param_4.10183, %param_2.28785
  %multiply.11.clone.187 = fmul float %subtract.9.clone.186, %subtract.42.clone.1
  %add.9.clone.188 = fadd float %param_2.28781, %multiply.11.clone.187
  %param_1.24789 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.890 = fmul float %add.9.clone.188, %param_1.24789
  %99 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9491 = getelementptr inbounds float, float* %99, i32 %linear_index9
  %param_5.9492 = load float, float* %param_5.9491, align 4, !invariant.load !65
  %100 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10193 = getelementptr inbounds float, float* %100, i32 %linear_index9
  %param_4.10194 = load float, float* %param_4.10193, align 4
  %101 = bitcast [4608 x [128 x float]]* %custom-call.17.typed to float*
  %param_4.10195 = getelementptr inbounds float, float* %101, i32 %linear_index9
  %param_4.10196 = load float, float* %param_4.10195, align 4
  %multiply.10.clone.197 = fmul float %param_4.10194, %param_4.10196
  %102 = bitcast [4608 x [128 x float]]* %arg21.22.typed to float*
  %param_5.9498 = getelementptr inbounds float, float* %102, i32 %linear_index9
  %param_5.9499 = load float, float* %param_5.9498, align 4, !invariant.load !65
  %subtract.8.clone.1100 = fsub float %multiply.10.clone.197, %param_5.9499
  %multiply.9.clone.1101 = fmul float %subtract.8.clone.1100, %subtract.43.clone.1
  %add.8.clone.1102 = fadd float %param_5.9492, %multiply.9.clone.1101
  %103 = call float @__nv_sqrtf(float %add.8.clone.1102)
  %104 = load float, float* bitcast ([4 x i8]* @75 to float*), align 4
  %add.7103 = fadd float %103, %104
  %divide.3104 = fdiv float %multiply.890, %add.7103
  %subtract.7105 = fsub float %param_0.679, %divide.3104
  %105 = insertvalue { float, float, float } undef, float %subtract.7105, 0
  %106 = insertvalue { float, float, float } %105, float %add.9.clone.188, 1
  %107 = insertvalue { float, float, float } %106, float %add.8.clone.1102, 2
  %108 = extractvalue { float, float, float } %107, 0
  %109 = bitcast [4608 x [128 x float]]* %fusion.6.typed2 to float*
  %110 = getelementptr inbounds float, float* %109, i32 %linear_index9
  store float %108, float* %110, align 4
  %111 = extractvalue { float, float, float } %107, 1
  %112 = bitcast [4608 x [128 x float]]* %fusion.6.typed4 to float*
  %113 = getelementptr inbounds float, float* %112, i32 %linear_index9
  store float %111, float* %113, align 4
  %114 = extractvalue { float, float, float } %107, 2
  %115 = bitcast [4608 x [128 x float]]* %fusion.6.typed6 to float*
  %116 = getelementptr inbounds float, float* %115, i32 %linear_index9
  store float %114, float* %116, align 4
  br label %fusion.6.in_bounds-after
}

define void @fusion_36(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.36.raw = getelementptr inbounds i8, i8* %temp_buf, i64 195857728
  %fusion.36.typed = bitcast i8* %fusion.36.raw to [1024 x [128 x [6 x [6 x float]]]]*
  %custom-call.16.raw = getelementptr inbounds i8, i8* %temp_buf, i64 104857600
  %custom-call.16.typed = bitcast i8* %custom-call.16.raw to [1024 x [4608 x float]]*
  %get-tuple-element.80.raw = getelementptr inbounds i8, i8* %temp_buf, i64 214732096
  %get-tuple-element.80.typed = bitcast i8* %get-tuple-element.80.raw to [1024 x [128 x [6 x [6 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1179648
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index_base, 6
  %6 = urem i32 %5, 6
  %7 = udiv i32 %linear_index_base, 36
  %8 = urem i32 %7, 128
  %9 = udiv i32 %linear_index_base, 4608
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 6
  %12 = udiv i32 %linear_index1, 6
  %13 = urem i32 %12, 6
  %14 = udiv i32 %linear_index1, 36
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index1, 4608
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 6
  %19 = udiv i32 %linear_index2, 6
  %20 = urem i32 %19, 6
  %21 = udiv i32 %linear_index2, 36
  %22 = urem i32 %21, 128
  %23 = udiv i32 %linear_index2, 4608
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 6
  %26 = udiv i32 %linear_index3, 6
  %27 = urem i32 %26, 6
  %28 = udiv i32 %linear_index3, 36
  %29 = urem i32 %28, 128
  %30 = udiv i32 %linear_index3, 4608
  %31 = icmp ult i32 %linear_index_base, 4718592
  br i1 %31, label %fusion.36.in_bounds-true, label %fusion.36.in_bounds-after

fusion.36.in_bounds-after:                        ; preds = %fusion.36.in_bounds-true, %entry
  ret void

fusion.36.in_bounds-true:                         ; preds = %entry
  %32 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed to float*
  %param_1.114 = getelementptr inbounds float, float* %32, i32 %linear_index_base
  %param_1.1144 = load float, float* %param_1.114, align 4, !invariant.load !65
  %33 = load float, float* bitcast ([4 x i8]* @76 to float*), align 4
  %compare.2 = fcmp ogt float %param_1.1144, %33
  %34 = zext i1 %compare.2 to i8
  %35 = mul nuw nsw i32 %8, 1
  %36 = add nuw nsw i32 0, %35
  %37 = mul nuw nsw i32 %4, 128
  %38 = add nuw nsw i32 %36, %37
  %39 = mul nuw nsw i32 %6, 768
  %40 = add nuw nsw i32 %38, %39
  %41 = udiv i32 %40, 4608
  %42 = mul nuw nsw i32 %9, 1
  %43 = add nuw nsw i32 0, %42
  %44 = udiv i32 %43, 1024
  %param_0.53 = getelementptr inbounds [1024 x [4608 x float]], [1024 x [4608 x float]]* %custom-call.16.typed, i32 0, i32 %43, i32 %40
  %param_0.535 = load float, float* %param_0.53, align 4, !invariant.load !65
  %45 = trunc i8 %34 to i1
  %46 = select i1 %45, float %param_0.535, float %33
  %47 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %48 = getelementptr inbounds float, float* %47, i32 %linear_index_base
  store float %46, float* %48, align 4
  %49 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed to float*
  %param_1.1146 = getelementptr inbounds float, float* %49, i32 %linear_index1
  %param_1.1147 = load float, float* %param_1.1146, align 4, !invariant.load !65
  %50 = load float, float* bitcast ([4 x i8]* @77 to float*), align 4
  %compare.28 = fcmp ogt float %param_1.1147, %50
  %51 = zext i1 %compare.28 to i8
  %52 = mul nuw nsw i32 %15, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %11, 128
  %55 = add nuw nsw i32 %53, %54
  %56 = mul nuw nsw i32 %13, 768
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 4608
  %59 = mul nuw nsw i32 %16, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 1024
  %param_0.539 = getelementptr inbounds [1024 x [4608 x float]], [1024 x [4608 x float]]* %custom-call.16.typed, i32 0, i32 %60, i32 %57
  %param_0.5310 = load float, float* %param_0.539, align 4, !invariant.load !65
  %62 = trunc i8 %51 to i1
  %63 = select i1 %62, float %param_0.5310, float %50
  %64 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %65 = getelementptr inbounds float, float* %64, i32 %linear_index1
  store float %63, float* %65, align 4
  %66 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed to float*
  %param_1.11411 = getelementptr inbounds float, float* %66, i32 %linear_index2
  %param_1.11412 = load float, float* %param_1.11411, align 4, !invariant.load !65
  %67 = load float, float* bitcast ([4 x i8]* @78 to float*), align 4
  %compare.213 = fcmp ogt float %param_1.11412, %67
  %68 = zext i1 %compare.213 to i8
  %69 = mul nuw nsw i32 %22, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %18, 128
  %72 = add nuw nsw i32 %70, %71
  %73 = mul nuw nsw i32 %20, 768
  %74 = add nuw nsw i32 %72, %73
  %75 = udiv i32 %74, 4608
  %76 = mul nuw nsw i32 %23, 1
  %77 = add nuw nsw i32 0, %76
  %78 = udiv i32 %77, 1024
  %param_0.5314 = getelementptr inbounds [1024 x [4608 x float]], [1024 x [4608 x float]]* %custom-call.16.typed, i32 0, i32 %77, i32 %74
  %param_0.5315 = load float, float* %param_0.5314, align 4, !invariant.load !65
  %79 = trunc i8 %68 to i1
  %80 = select i1 %79, float %param_0.5315, float %67
  %81 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %82 = getelementptr inbounds float, float* %81, i32 %linear_index2
  store float %80, float* %82, align 4
  %83 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %get-tuple-element.80.typed to float*
  %param_1.11416 = getelementptr inbounds float, float* %83, i32 %linear_index3
  %param_1.11417 = load float, float* %param_1.11416, align 4, !invariant.load !65
  %84 = load float, float* bitcast ([4 x i8]* @79 to float*), align 4
  %compare.218 = fcmp ogt float %param_1.11417, %84
  %85 = zext i1 %compare.218 to i8
  %86 = mul nuw nsw i32 %29, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %25, 128
  %89 = add nuw nsw i32 %87, %88
  %90 = mul nuw nsw i32 %27, 768
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 4608
  %93 = mul nuw nsw i32 %30, 1
  %94 = add nuw nsw i32 0, %93
  %95 = udiv i32 %94, 1024
  %param_0.5319 = getelementptr inbounds [1024 x [4608 x float]], [1024 x [4608 x float]]* %custom-call.16.typed, i32 0, i32 %94, i32 %91
  %param_0.5320 = load float, float* %param_0.5319, align 4, !invariant.load !65
  %96 = trunc i8 %85 to i1
  %97 = select i1 %96, float %param_0.5320, float %84
  %98 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %99 = getelementptr inbounds float, float* %98, i32 %linear_index3
  store float %97, float* %99, align 4
  br label %fusion.36.in_bounds-after
}

define void @fusion_18(i8* noalias align 64 dereferenceable(512) %alloc38, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %result_from_other_lane82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %result_from_other_lane78 = alloca float, align 4
  %result_from_other_lane76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %result_from_other_lane72 = alloca float, align 4
  %result_from_other_lane70 = alloca float, align 4
  %result_from_other_lane68 = alloca float, align 4
  %result_from_other_lane66 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %output_y_in_tile.invar_address = alloca i32, align 4
  %loop_z.invar_address = alloca i32, align 4
  %partial_reduction_result.0 = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %fusion.18.raw = getelementptr inbounds i8, i8* %alloc38, i64 0
  %fusion.18.typed = bitcast i8* %fusion.18.raw to [128 x float]*
  %fusion.36.raw = getelementptr inbounds i8, i8* %temp_buf, i64 195857728
  %fusion.36.typed = bitcast i8* %fusion.36.raw to [1024 x [128 x [6 x [6 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !64
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %2 = load float, float* bitcast ([4 x i8]* @80 to float*), align 4
  %3 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  store float %2, float* %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %thread_id.x = urem i32 %4, 32
  %thread_id.y = udiv i32 %4, 32
  %lane_id = urem i32 %4, 32
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %6 = udiv i32 %5, 1
  %7 = urem i32 %6, 1
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %5, 128
  %block_origin.z = mul i32 %10, 8
  %11 = icmp eq i32 %9, 127
  %tile_bound = select i1 %11, i32 1, i32 1
  %12 = icmp eq i32 %7, 0
  %tile_bound1 = select i1 %12, i32 36, i32 256
  %tile_origin.1 = mul i32 %9, 1
  %tile_origin.2 = mul i32 %7, 256
  %13 = udiv i32 %block_origin.z, 8
  %14 = icmp eq i32 127, %13
  %15 = select i1 %14, i32 8, i32 8
  store i32 0, i32* %loop_z.invar_address, align 4
  br label %loop_z.loop_header

loop_z.loop_header:                               ; preds = %output_y_in_tile.loop_exit, %reduce-group-0-true
  %loop_z.indvar = load i32, i32* %loop_z.invar_address, align 4
  %16 = icmp uge i32 %loop_z.indvar, %15
  br i1 %16, label %loop_z.loop_exit, label %loop_z.loop_body

loop_z.loop_body:                                 ; preds = %loop_z.loop_header
  %invar.inc = add nuw nsw i32 %loop_z.indvar, 1
  store i32 %invar.inc, i32* %loop_z.invar_address, align 4
  %17 = icmp eq i32 %loop_z.indvar, 0
  %18 = add i32 %block_origin.z, %loop_z.indvar
  %19 = mul i32 %thread_id.x, 2
  %20 = add i32 %tile_origin.2, %19
  %21 = sub i32 %tile_bound, %thread_id.y
  %22 = add i32 %21, 1
  %23 = add i32 %22, -1
  %24 = udiv i32 %23, 1
  store i32 0, i32* %output_y_in_tile.invar_address, align 4
  br label %output_y_in_tile.loop_header

output_y_in_tile.loop_header:                     ; preds = %output_is_full_tile-after, %loop_z.loop_body
  %output_y_in_tile.indvar = load i32, i32* %output_y_in_tile.invar_address, align 4
  %25 = icmp uge i32 %output_y_in_tile.indvar, %24
  br i1 %25, label %output_y_in_tile.loop_exit, label %output_y_in_tile.loop_body

output_y_in_tile.loop_body:                       ; preds = %output_y_in_tile.loop_header
  %invar.inc2 = add nuw nsw i32 %output_y_in_tile.indvar, 1
  store i32 %invar.inc2, i32* %output_y_in_tile.invar_address, align 4
  %26 = icmp eq i32 %output_y_in_tile.indvar, 0
  %27 = mul i32 %output_y_in_tile.indvar, 1
  %28 = add i32 %thread_id.y, %27
  %29 = icmp eq i32 256, %tile_bound1
  br i1 %29, label %output_is_full_tile-true, label %output_is_full_tile-false

output_is_full_tile-after:                        ; preds = %output_x_in_tile-after60, %output_is_full_tile-true
  br label %output_y_in_tile.loop_header, !llvm.loop !81

output_y_in_tile.loop_exit:                       ; preds = %output_y_in_tile.loop_header
  br label %loop_z.loop_header, !llvm.loop !82

loop_z.loop_exit:                                 ; preds = %loop_z.loop_header
  %30 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %thread_id.x63 = urem i32 %30, 32
  %thread_id.y64 = udiv i32 %30, 32
  %lane_id65 = urem i32 %30, 32
  %31 = mul i32 %thread_id.x63, 2
  %32 = add i32 %tile_origin.1, %thread_id.y64
  %33 = add i32 %tile_origin.2, %31
  %34 = add i32 %33, 0
  %35 = udiv i32 %32, 1
  %output_element_address = getelementptr inbounds [128 x float], [128 x float]* %fusion.18.typed, i32 0, i32 %35
  %current_output = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  %partial_reduction_result = load float, float* %current_output, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result, i32 16, i32 31)
  store float %36, float* %result_from_other_lane, align 4
  call void @add_float__263(float* %current_output, float* %result_from_other_lane, float* %current_output)
  %partial_reduction_result67 = load float, float* %current_output, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 8, i32 31)
  store float %37, float* %result_from_other_lane66, align 4
  call void @add_float__263(float* %current_output, float* %result_from_other_lane66, float* %current_output)
  %partial_reduction_result69 = load float, float* %current_output, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result69, i32 4, i32 31)
  store float %38, float* %result_from_other_lane68, align 4
  call void @add_float__263(float* %current_output, float* %result_from_other_lane68, float* %current_output)
  %partial_reduction_result71 = load float, float* %current_output, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 2, i32 31)
  store float %39, float* %result_from_other_lane70, align 4
  call void @add_float__263(float* %current_output, float* %result_from_other_lane70, float* %current_output)
  %partial_reduction_result73 = load float, float* %current_output, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result73, i32 1, i32 31)
  store float %40, float* %result_from_other_lane72, align 4
  call void @add_float__263(float* %current_output, float* %result_from_other_lane72, float* %current_output)
  %41 = udiv i32 %thread_id.x63, 32
  %42 = icmp eq i32 %lane_id65, 0
  br i1 %42, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %loop_z.loop_exit
  call void @llvm.nvvm.barrier0()
  %43 = icmp eq i32 %41, 0
  br i1 %43, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_atomic_update-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

output_is_full_tile-true:                         ; preds = %output_y_in_tile.loop_body
  %44 = add i32 %tile_origin.1, %28
  %x_loc = add i32 0, %19
  %45 = add i32 %20, 0
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %44, 36
  %49 = add nuw nsw i32 %47, %48
  %50 = mul nuw nsw i32 %18, 4608
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 1
  %53 = urem i32 %52, 36
  %54 = udiv i32 %51, 36
  %55 = urem i32 %54, 128
  %56 = udiv i32 %51, 4608
  %57 = mul nuw nsw i32 %53, 1
  %58 = add nuw nsw i32 0, %57
  %59 = urem i32 %58, 6
  %60 = udiv i32 %58, 6
  %61 = udiv i32 %60, 6
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 128
  %65 = mul nuw nsw i32 %56, 1
  %66 = add nuw nsw i32 0, %65
  %67 = udiv i32 %66, 1024
  %68 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.77 = getelementptr inbounds float, float* %68, i32 %51
  %param_0.773 = load float, float* %param_0.77, align 4, !invariant.load !65
  store float %param_0.773, float* %reduction_input_address, align 4
  %69 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %69, float* %reduction_input_address, float* %69)
  %x_loc4 = add i32 1, %19
  %70 = add i32 %20, 1
  %71 = mul nuw nsw i32 %70, 1
  %72 = add nuw nsw i32 0, %71
  %73 = mul nuw nsw i32 %44, 36
  %74 = add nuw nsw i32 %72, %73
  %75 = mul nuw nsw i32 %18, 4608
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 36
  %79 = udiv i32 %76, 36
  %80 = urem i32 %79, 128
  %81 = udiv i32 %76, 4608
  %82 = mul nuw nsw i32 %78, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 6
  %85 = udiv i32 %83, 6
  %86 = udiv i32 %85, 6
  %87 = mul nuw nsw i32 %80, 1
  %88 = add nuw nsw i32 0, %87
  %89 = udiv i32 %88, 128
  %90 = mul nuw nsw i32 %81, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 1024
  %93 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.775 = getelementptr inbounds float, float* %93, i32 %76
  %param_0.776 = load float, float* %param_0.775, align 4, !invariant.load !65
  store float %param_0.776, float* %reduction_input_address, align 4
  %94 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %94, float* %reduction_input_address, float* %94)
  %x_loc7 = add i32 64, %19
  %95 = add i32 %20, 64
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %44, 36
  %99 = add nuw nsw i32 %97, %98
  %100 = mul nuw nsw i32 %18, 4608
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 36
  %104 = udiv i32 %101, 36
  %105 = urem i32 %104, 128
  %106 = udiv i32 %101, 4608
  %107 = mul nuw nsw i32 %103, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 6
  %110 = udiv i32 %108, 6
  %111 = udiv i32 %110, 6
  %112 = mul nuw nsw i32 %105, 1
  %113 = add nuw nsw i32 0, %112
  %114 = udiv i32 %113, 128
  %115 = mul nuw nsw i32 %106, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 1024
  %118 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.778 = getelementptr inbounds float, float* %118, i32 %101
  %param_0.779 = load float, float* %param_0.778, align 4, !invariant.load !65
  store float %param_0.779, float* %reduction_input_address, align 4
  %119 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %119, float* %reduction_input_address, float* %119)
  %x_loc10 = add i32 65, %19
  %120 = add i32 %20, 65
  %121 = mul nuw nsw i32 %120, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %44, 36
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %18, 4608
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 36
  %129 = udiv i32 %126, 36
  %130 = urem i32 %129, 128
  %131 = udiv i32 %126, 4608
  %132 = mul nuw nsw i32 %128, 1
  %133 = add nuw nsw i32 0, %132
  %134 = urem i32 %133, 6
  %135 = udiv i32 %133, 6
  %136 = udiv i32 %135, 6
  %137 = mul nuw nsw i32 %130, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 128
  %140 = mul nuw nsw i32 %131, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 1024
  %143 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7711 = getelementptr inbounds float, float* %143, i32 %126
  %param_0.7712 = load float, float* %param_0.7711, align 4, !invariant.load !65
  store float %param_0.7712, float* %reduction_input_address, align 4
  %144 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %144, float* %reduction_input_address, float* %144)
  %x_loc13 = add i32 128, %19
  %145 = add i32 %20, 128
  %146 = mul nuw nsw i32 %145, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %44, 36
  %149 = add nuw nsw i32 %147, %148
  %150 = mul nuw nsw i32 %18, 4608
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 36
  %154 = udiv i32 %151, 36
  %155 = urem i32 %154, 128
  %156 = udiv i32 %151, 4608
  %157 = mul nuw nsw i32 %153, 1
  %158 = add nuw nsw i32 0, %157
  %159 = urem i32 %158, 6
  %160 = udiv i32 %158, 6
  %161 = udiv i32 %160, 6
  %162 = mul nuw nsw i32 %155, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 128
  %165 = mul nuw nsw i32 %156, 1
  %166 = add nuw nsw i32 0, %165
  %167 = udiv i32 %166, 1024
  %168 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7714 = getelementptr inbounds float, float* %168, i32 %151
  %param_0.7715 = load float, float* %param_0.7714, align 4, !invariant.load !65
  store float %param_0.7715, float* %reduction_input_address, align 4
  %169 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %169, float* %reduction_input_address, float* %169)
  %x_loc16 = add i32 129, %19
  %170 = add i32 %20, 129
  %171 = mul nuw nsw i32 %170, 1
  %172 = add nuw nsw i32 0, %171
  %173 = mul nuw nsw i32 %44, 36
  %174 = add nuw nsw i32 %172, %173
  %175 = mul nuw nsw i32 %18, 4608
  %176 = add nuw nsw i32 %174, %175
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 36
  %179 = udiv i32 %176, 36
  %180 = urem i32 %179, 128
  %181 = udiv i32 %176, 4608
  %182 = mul nuw nsw i32 %178, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 6
  %185 = udiv i32 %183, 6
  %186 = udiv i32 %185, 6
  %187 = mul nuw nsw i32 %180, 1
  %188 = add nuw nsw i32 0, %187
  %189 = udiv i32 %188, 128
  %190 = mul nuw nsw i32 %181, 1
  %191 = add nuw nsw i32 0, %190
  %192 = udiv i32 %191, 1024
  %193 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7717 = getelementptr inbounds float, float* %193, i32 %176
  %param_0.7718 = load float, float* %param_0.7717, align 4, !invariant.load !65
  store float %param_0.7718, float* %reduction_input_address, align 4
  %194 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %194, float* %reduction_input_address, float* %194)
  %x_loc19 = add i32 192, %19
  %195 = add i32 %20, 192
  %196 = mul nuw nsw i32 %195, 1
  %197 = add nuw nsw i32 0, %196
  %198 = mul nuw nsw i32 %44, 36
  %199 = add nuw nsw i32 %197, %198
  %200 = mul nuw nsw i32 %18, 4608
  %201 = add nuw nsw i32 %199, %200
  %202 = udiv i32 %201, 1
  %203 = urem i32 %202, 36
  %204 = udiv i32 %201, 36
  %205 = urem i32 %204, 128
  %206 = udiv i32 %201, 4608
  %207 = mul nuw nsw i32 %203, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 6
  %210 = udiv i32 %208, 6
  %211 = udiv i32 %210, 6
  %212 = mul nuw nsw i32 %205, 1
  %213 = add nuw nsw i32 0, %212
  %214 = udiv i32 %213, 128
  %215 = mul nuw nsw i32 %206, 1
  %216 = add nuw nsw i32 0, %215
  %217 = udiv i32 %216, 1024
  %218 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7720 = getelementptr inbounds float, float* %218, i32 %201
  %param_0.7721 = load float, float* %param_0.7720, align 4, !invariant.load !65
  store float %param_0.7721, float* %reduction_input_address, align 4
  %219 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %219, float* %reduction_input_address, float* %219)
  %x_loc22 = add i32 193, %19
  %220 = add i32 %20, 193
  %221 = mul nuw nsw i32 %220, 1
  %222 = add nuw nsw i32 0, %221
  %223 = mul nuw nsw i32 %44, 36
  %224 = add nuw nsw i32 %222, %223
  %225 = mul nuw nsw i32 %18, 4608
  %226 = add nuw nsw i32 %224, %225
  %227 = udiv i32 %226, 1
  %228 = urem i32 %227, 36
  %229 = udiv i32 %226, 36
  %230 = urem i32 %229, 128
  %231 = udiv i32 %226, 4608
  %232 = mul nuw nsw i32 %228, 1
  %233 = add nuw nsw i32 0, %232
  %234 = urem i32 %233, 6
  %235 = udiv i32 %233, 6
  %236 = udiv i32 %235, 6
  %237 = mul nuw nsw i32 %230, 1
  %238 = add nuw nsw i32 0, %237
  %239 = udiv i32 %238, 128
  %240 = mul nuw nsw i32 %231, 1
  %241 = add nuw nsw i32 0, %240
  %242 = udiv i32 %241, 1024
  %243 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7723 = getelementptr inbounds float, float* %243, i32 %226
  %param_0.7724 = load float, float* %param_0.7723, align 4, !invariant.load !65
  store float %param_0.7724, float* %reduction_input_address, align 4
  %244 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %244, float* %reduction_input_address, float* %244)
  br label %output_is_full_tile-after

output_is_full_tile-false:                        ; preds = %output_y_in_tile.loop_body
  %245 = add i32 %tile_origin.1, %28
  %x_loc25 = add i32 0, %19
  %246 = add i32 %20, 0
  %247 = icmp ult i32 %x_loc25, %tile_bound1
  br i1 %247, label %output_x_in_tile-true, label %output_x_in_tile-after

output_x_in_tile-after:                           ; preds = %output_x_in_tile-true, %output_is_full_tile-false
  %x_loc28 = add i32 1, %19
  %248 = add i32 %20, 1
  %249 = icmp ult i32 %x_loc28, %tile_bound1
  br i1 %249, label %output_x_in_tile-true29, label %output_x_in_tile-after30

output_x_in_tile-after30:                         ; preds = %output_x_in_tile-true29, %output_x_in_tile-after
  %x_loc33 = add i32 64, %19
  %250 = add i32 %20, 64
  %251 = icmp ult i32 %x_loc33, %tile_bound1
  br i1 %251, label %output_x_in_tile-true34, label %output_x_in_tile-after35

output_x_in_tile-after35:                         ; preds = %output_x_in_tile-true34, %output_x_in_tile-after30
  %x_loc38 = add i32 65, %19
  %252 = add i32 %20, 65
  %253 = icmp ult i32 %x_loc38, %tile_bound1
  br i1 %253, label %output_x_in_tile-true39, label %output_x_in_tile-after40

output_x_in_tile-after40:                         ; preds = %output_x_in_tile-true39, %output_x_in_tile-after35
  %x_loc43 = add i32 128, %19
  %254 = add i32 %20, 128
  %255 = icmp ult i32 %x_loc43, %tile_bound1
  br i1 %255, label %output_x_in_tile-true44, label %output_x_in_tile-after45

output_x_in_tile-after45:                         ; preds = %output_x_in_tile-true44, %output_x_in_tile-after40
  %x_loc48 = add i32 129, %19
  %256 = add i32 %20, 129
  %257 = icmp ult i32 %x_loc48, %tile_bound1
  br i1 %257, label %output_x_in_tile-true49, label %output_x_in_tile-after50

output_x_in_tile-after50:                         ; preds = %output_x_in_tile-true49, %output_x_in_tile-after45
  %x_loc53 = add i32 192, %19
  %258 = add i32 %20, 192
  %259 = icmp ult i32 %x_loc53, %tile_bound1
  br i1 %259, label %output_x_in_tile-true54, label %output_x_in_tile-after55

output_x_in_tile-after55:                         ; preds = %output_x_in_tile-true54, %output_x_in_tile-after50
  %x_loc58 = add i32 193, %19
  %260 = add i32 %20, 193
  %261 = icmp ult i32 %x_loc58, %tile_bound1
  br i1 %261, label %output_x_in_tile-true59, label %output_x_in_tile-after60

output_x_in_tile-after60:                         ; preds = %output_x_in_tile-true59, %output_x_in_tile-after55
  br label %output_is_full_tile-after

output_x_in_tile-true:                            ; preds = %output_is_full_tile-false
  %262 = mul nuw nsw i32 %246, 1
  %263 = add nuw nsw i32 0, %262
  %264 = mul nuw nsw i32 %245, 36
  %265 = add nuw nsw i32 %263, %264
  %266 = mul nuw nsw i32 %18, 4608
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 1
  %269 = urem i32 %268, 36
  %270 = udiv i32 %267, 36
  %271 = urem i32 %270, 128
  %272 = udiv i32 %267, 4608
  %273 = mul nuw nsw i32 %269, 1
  %274 = add nuw nsw i32 0, %273
  %275 = urem i32 %274, 6
  %276 = udiv i32 %274, 6
  %277 = udiv i32 %276, 6
  %278 = mul nuw nsw i32 %271, 1
  %279 = add nuw nsw i32 0, %278
  %280 = udiv i32 %279, 128
  %281 = mul nuw nsw i32 %272, 1
  %282 = add nuw nsw i32 0, %281
  %283 = udiv i32 %282, 1024
  %284 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7726 = getelementptr inbounds float, float* %284, i32 %267
  %param_0.7727 = load float, float* %param_0.7726, align 4, !invariant.load !65
  store float %param_0.7727, float* %reduction_input_address, align 4
  %285 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %285, float* %reduction_input_address, float* %285)
  br label %output_x_in_tile-after

output_x_in_tile-true29:                          ; preds = %output_x_in_tile-after
  %286 = mul nuw nsw i32 %248, 1
  %287 = add nuw nsw i32 0, %286
  %288 = mul nuw nsw i32 %245, 36
  %289 = add nuw nsw i32 %287, %288
  %290 = mul nuw nsw i32 %18, 4608
  %291 = add nuw nsw i32 %289, %290
  %292 = udiv i32 %291, 1
  %293 = urem i32 %292, 36
  %294 = udiv i32 %291, 36
  %295 = urem i32 %294, 128
  %296 = udiv i32 %291, 4608
  %297 = mul nuw nsw i32 %293, 1
  %298 = add nuw nsw i32 0, %297
  %299 = urem i32 %298, 6
  %300 = udiv i32 %298, 6
  %301 = udiv i32 %300, 6
  %302 = mul nuw nsw i32 %295, 1
  %303 = add nuw nsw i32 0, %302
  %304 = udiv i32 %303, 128
  %305 = mul nuw nsw i32 %296, 1
  %306 = add nuw nsw i32 0, %305
  %307 = udiv i32 %306, 1024
  %308 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7731 = getelementptr inbounds float, float* %308, i32 %291
  %param_0.7732 = load float, float* %param_0.7731, align 4, !invariant.load !65
  store float %param_0.7732, float* %reduction_input_address, align 4
  %309 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %309, float* %reduction_input_address, float* %309)
  br label %output_x_in_tile-after30

output_x_in_tile-true34:                          ; preds = %output_x_in_tile-after30
  %310 = mul nuw nsw i32 %250, 1
  %311 = add nuw nsw i32 0, %310
  %312 = mul nuw nsw i32 %245, 36
  %313 = add nuw nsw i32 %311, %312
  %314 = mul nuw nsw i32 %18, 4608
  %315 = add nuw nsw i32 %313, %314
  %316 = udiv i32 %315, 1
  %317 = urem i32 %316, 36
  %318 = udiv i32 %315, 36
  %319 = urem i32 %318, 128
  %320 = udiv i32 %315, 4608
  %321 = mul nuw nsw i32 %317, 1
  %322 = add nuw nsw i32 0, %321
  %323 = urem i32 %322, 6
  %324 = udiv i32 %322, 6
  %325 = udiv i32 %324, 6
  %326 = mul nuw nsw i32 %319, 1
  %327 = add nuw nsw i32 0, %326
  %328 = udiv i32 %327, 128
  %329 = mul nuw nsw i32 %320, 1
  %330 = add nuw nsw i32 0, %329
  %331 = udiv i32 %330, 1024
  %332 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7736 = getelementptr inbounds float, float* %332, i32 %315
  %param_0.7737 = load float, float* %param_0.7736, align 4, !invariant.load !65
  store float %param_0.7737, float* %reduction_input_address, align 4
  %333 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %333, float* %reduction_input_address, float* %333)
  br label %output_x_in_tile-after35

output_x_in_tile-true39:                          ; preds = %output_x_in_tile-after35
  %334 = mul nuw nsw i32 %252, 1
  %335 = add nuw nsw i32 0, %334
  %336 = mul nuw nsw i32 %245, 36
  %337 = add nuw nsw i32 %335, %336
  %338 = mul nuw nsw i32 %18, 4608
  %339 = add nuw nsw i32 %337, %338
  %340 = udiv i32 %339, 1
  %341 = urem i32 %340, 36
  %342 = udiv i32 %339, 36
  %343 = urem i32 %342, 128
  %344 = udiv i32 %339, 4608
  %345 = mul nuw nsw i32 %341, 1
  %346 = add nuw nsw i32 0, %345
  %347 = urem i32 %346, 6
  %348 = udiv i32 %346, 6
  %349 = udiv i32 %348, 6
  %350 = mul nuw nsw i32 %343, 1
  %351 = add nuw nsw i32 0, %350
  %352 = udiv i32 %351, 128
  %353 = mul nuw nsw i32 %344, 1
  %354 = add nuw nsw i32 0, %353
  %355 = udiv i32 %354, 1024
  %356 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7741 = getelementptr inbounds float, float* %356, i32 %339
  %param_0.7742 = load float, float* %param_0.7741, align 4, !invariant.load !65
  store float %param_0.7742, float* %reduction_input_address, align 4
  %357 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %357, float* %reduction_input_address, float* %357)
  br label %output_x_in_tile-after40

output_x_in_tile-true44:                          ; preds = %output_x_in_tile-after40
  %358 = mul nuw nsw i32 %254, 1
  %359 = add nuw nsw i32 0, %358
  %360 = mul nuw nsw i32 %245, 36
  %361 = add nuw nsw i32 %359, %360
  %362 = mul nuw nsw i32 %18, 4608
  %363 = add nuw nsw i32 %361, %362
  %364 = udiv i32 %363, 1
  %365 = urem i32 %364, 36
  %366 = udiv i32 %363, 36
  %367 = urem i32 %366, 128
  %368 = udiv i32 %363, 4608
  %369 = mul nuw nsw i32 %365, 1
  %370 = add nuw nsw i32 0, %369
  %371 = urem i32 %370, 6
  %372 = udiv i32 %370, 6
  %373 = udiv i32 %372, 6
  %374 = mul nuw nsw i32 %367, 1
  %375 = add nuw nsw i32 0, %374
  %376 = udiv i32 %375, 128
  %377 = mul nuw nsw i32 %368, 1
  %378 = add nuw nsw i32 0, %377
  %379 = udiv i32 %378, 1024
  %380 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7746 = getelementptr inbounds float, float* %380, i32 %363
  %param_0.7747 = load float, float* %param_0.7746, align 4, !invariant.load !65
  store float %param_0.7747, float* %reduction_input_address, align 4
  %381 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %381, float* %reduction_input_address, float* %381)
  br label %output_x_in_tile-after45

output_x_in_tile-true49:                          ; preds = %output_x_in_tile-after45
  %382 = mul nuw nsw i32 %256, 1
  %383 = add nuw nsw i32 0, %382
  %384 = mul nuw nsw i32 %245, 36
  %385 = add nuw nsw i32 %383, %384
  %386 = mul nuw nsw i32 %18, 4608
  %387 = add nuw nsw i32 %385, %386
  %388 = udiv i32 %387, 1
  %389 = urem i32 %388, 36
  %390 = udiv i32 %387, 36
  %391 = urem i32 %390, 128
  %392 = udiv i32 %387, 4608
  %393 = mul nuw nsw i32 %389, 1
  %394 = add nuw nsw i32 0, %393
  %395 = urem i32 %394, 6
  %396 = udiv i32 %394, 6
  %397 = udiv i32 %396, 6
  %398 = mul nuw nsw i32 %391, 1
  %399 = add nuw nsw i32 0, %398
  %400 = udiv i32 %399, 128
  %401 = mul nuw nsw i32 %392, 1
  %402 = add nuw nsw i32 0, %401
  %403 = udiv i32 %402, 1024
  %404 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7751 = getelementptr inbounds float, float* %404, i32 %387
  %param_0.7752 = load float, float* %param_0.7751, align 4, !invariant.load !65
  store float %param_0.7752, float* %reduction_input_address, align 4
  %405 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %405, float* %reduction_input_address, float* %405)
  br label %output_x_in_tile-after50

output_x_in_tile-true54:                          ; preds = %output_x_in_tile-after50
  %406 = mul nuw nsw i32 %258, 1
  %407 = add nuw nsw i32 0, %406
  %408 = mul nuw nsw i32 %245, 36
  %409 = add nuw nsw i32 %407, %408
  %410 = mul nuw nsw i32 %18, 4608
  %411 = add nuw nsw i32 %409, %410
  %412 = udiv i32 %411, 1
  %413 = urem i32 %412, 36
  %414 = udiv i32 %411, 36
  %415 = urem i32 %414, 128
  %416 = udiv i32 %411, 4608
  %417 = mul nuw nsw i32 %413, 1
  %418 = add nuw nsw i32 0, %417
  %419 = urem i32 %418, 6
  %420 = udiv i32 %418, 6
  %421 = udiv i32 %420, 6
  %422 = mul nuw nsw i32 %415, 1
  %423 = add nuw nsw i32 0, %422
  %424 = udiv i32 %423, 128
  %425 = mul nuw nsw i32 %416, 1
  %426 = add nuw nsw i32 0, %425
  %427 = udiv i32 %426, 1024
  %428 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7756 = getelementptr inbounds float, float* %428, i32 %411
  %param_0.7757 = load float, float* %param_0.7756, align 4, !invariant.load !65
  store float %param_0.7757, float* %reduction_input_address, align 4
  %429 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %429, float* %reduction_input_address, float* %429)
  br label %output_x_in_tile-after55

output_x_in_tile-true59:                          ; preds = %output_x_in_tile-after55
  %430 = mul nuw nsw i32 %260, 1
  %431 = add nuw nsw i32 0, %430
  %432 = mul nuw nsw i32 %245, 36
  %433 = add nuw nsw i32 %431, %432
  %434 = mul nuw nsw i32 %18, 4608
  %435 = add nuw nsw i32 %433, %434
  %436 = udiv i32 %435, 1
  %437 = urem i32 %436, 36
  %438 = udiv i32 %435, 36
  %439 = urem i32 %438, 128
  %440 = udiv i32 %435, 4608
  %441 = mul nuw nsw i32 %437, 1
  %442 = add nuw nsw i32 0, %441
  %443 = urem i32 %442, 6
  %444 = udiv i32 %442, 6
  %445 = udiv i32 %444, 6
  %446 = mul nuw nsw i32 %439, 1
  %447 = add nuw nsw i32 0, %446
  %448 = udiv i32 %447, 128
  %449 = mul nuw nsw i32 %440, 1
  %450 = add nuw nsw i32 0, %449
  %451 = udiv i32 %450, 1024
  %452 = bitcast [1024 x [128 x [6 x [6 x float]]]]* %fusion.36.typed to float*
  %param_0.7761 = getelementptr inbounds float, float* %452, i32 %435
  %param_0.7762 = load float, float* %param_0.7761, align 4, !invariant.load !65
  store float %param_0.7762, float* %reduction_input_address, align 4
  %453 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__263(float* %453, float* %reduction_input_address, float* %453)
  br label %output_x_in_tile-after60

intra_warp_reduce_write-true:                     ; preds = %loop_z.loop_exit
  %454 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_02, i32 0, i32 0, i32 %41
  %455 = addrspacecast float addrspace(3)* %454 to float*
  %456 = load float, float* %current_output, align 4
  store float %456, float* %455, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %457 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_02, i32 0, i32 0, i32 %lane_id65
  %458 = addrspacecast float addrspace(3)* %457 to float*
  store float %2, float* %initial_value_addr, align 4
  %459 = icmp ult i32 %thread_id.x63, 1
  %460 = select i1 %459, float* %458, float* %initial_value_addr
  %partial_reduction_result75 = load float, float* %460, align 4
  %461 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 16, i32 31)
  store float %461, float* %result_from_other_lane74, align 4
  call void @add_float__263(float* %460, float* %result_from_other_lane74, float* %460)
  %partial_reduction_result77 = load float, float* %460, align 4
  %462 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result77, i32 8, i32 31)
  store float %462, float* %result_from_other_lane76, align 4
  call void @add_float__263(float* %460, float* %result_from_other_lane76, float* %460)
  %partial_reduction_result79 = load float, float* %460, align 4
  %463 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 4, i32 31)
  store float %463, float* %result_from_other_lane78, align 4
  call void @add_float__263(float* %460, float* %result_from_other_lane78, float* %460)
  %partial_reduction_result81 = load float, float* %460, align 4
  %464 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 2, i32 31)
  store float %464, float* %result_from_other_lane80, align 4
  call void @add_float__263(float* %460, float* %result_from_other_lane80, float* %460)
  %partial_reduction_result83 = load float, float* %460, align 4
  %465 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 1, i32 31)
  store float %465, float* %result_from_other_lane82, align 4
  call void @add_float__263(float* %460, float* %result_from_other_lane82, float* %460)
  %466 = icmp eq i32 %thread_id.x63, 0
  br i1 %466, label %reduction_atomic_update-true, label %reduction_atomic_update-after

reduction_atomic_update-after:                    ; preds = %reduction_atomic_update-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_atomic_update-true:                     ; preds = %inter_warp_reduce-true
  %source = load float, float* %458, align 4
  %467 = atomicrmw fadd float* %output_element_address, float %source seq_cst
  br label %reduction_atomic_update-after
}

define internal void @add_float__263(float* dereferenceable(4) %x.264.typed, float* dereferenceable(4) %y.265.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.266.typed = alloca float, align 4
  %0 = load float, float* %x.264.typed, align 4
  %1 = load float, float* %y.265.typed, align 4
  %add.266 = fadd float %0, %1
  store float %add.266, float* %add.266.typed, align 4
  %load_ret_value = load float, float* %add.266.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_15(i8* noalias align 64 dereferenceable(3200) %alloc29, i8* noalias align 64 dereferenceable(512) %alloc33, i8* noalias align 64 dereferenceable(512) %alloc34, i8* noalias align 64 dereferenceable(512) %alloc35, i8* noalias align 64 dereferenceable(512) %alloc36, i8* noalias align 64 dereferenceable(512) %alloc37, i8* noalias align 64 dereferenceable(512) %alloc38, i8* noalias align 16 dereferenceable(512) %alloc39, i8* noalias align 16 dereferenceable(512) %alloc40, i8* noalias align 16 dereferenceable(512) %alloc41, i8* noalias align 16 dereferenceable(512) %alloc42, i8* noalias align 16 dereferenceable(512) %alloc43, i8* noalias align 16 dereferenceable(512) %alloc44, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.15.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056512
  %fusion.15.typed = bitcast i8* %fusion.15.raw to [6 x i8*]*
  %fusion.15.raw1 = getelementptr inbounds i8, i8* %alloc38, i64 0
  %fusion.15.typed2 = bitcast i8* %fusion.15.raw1 to [128 x float]*
  %fusion.15.raw3 = getelementptr inbounds i8, i8* %alloc37, i64 0
  %fusion.15.typed4 = bitcast i8* %fusion.15.raw3 to [128 x float]*
  %fusion.15.raw5 = getelementptr inbounds i8, i8* %alloc36, i64 0
  %fusion.15.typed6 = bitcast i8* %fusion.15.raw5 to [128 x float]*
  %fusion.15.raw7 = getelementptr inbounds i8, i8* %alloc35, i64 0
  %fusion.15.typed8 = bitcast i8* %fusion.15.raw7 to [128 x float]*
  %fusion.15.raw9 = getelementptr inbounds i8, i8* %alloc34, i64 0
  %fusion.15.typed10 = bitcast i8* %fusion.15.raw9 to [128 x float]*
  %fusion.15.raw11 = getelementptr inbounds i8, i8* %alloc33, i64 0
  %fusion.15.typed12 = bitcast i8* %fusion.15.raw11 to [128 x float]*
  %arg10.11.raw = getelementptr inbounds i8, i8* %alloc39, i64 0
  %arg10.11.typed = bitcast i8* %arg10.11.raw to [128 x float]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg26.27.raw = getelementptr inbounds i8, i8* %alloc41, i64 0
  %arg26.27.typed = bitcast i8* %arg26.27.raw to [128 x float]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %fusion.18.raw = getelementptr inbounds i8, i8* %alloc38, i64 0
  %fusion.18.typed = bitcast i8* %fusion.18.raw to [128 x float]*
  %arg27.28.raw = getelementptr inbounds i8, i8* %alloc42, i64 0
  %arg27.28.typed = bitcast i8* %arg27.28.raw to [128 x float]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg12.13.raw = getelementptr inbounds i8, i8* %alloc40, i64 0
  %arg12.13.typed = bitcast i8* %arg12.13.raw to [128 x float]*
  %arg23.24.raw = getelementptr inbounds i8, i8* %alloc43, i64 0
  %arg23.24.typed = bitcast i8* %arg23.24.raw to [128 x float]*
  %get-tuple-element.114.raw = getelementptr inbounds i8, i8* %alloc29, i64 0
  %get-tuple-element.114.typed = bitcast i8* %get-tuple-element.114.raw to [128 x float]*
  %arg22.23.raw = getelementptr inbounds i8, i8* %alloc44, i64 0
  %arg22.23.typed = bitcast i8* %arg22.23.raw to [128 x float]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %7 = mul nuw nsw i32 %5, 32
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 32
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %linear_index13 = add nuw nsw i32 %linear_index_base, 1
  %9 = udiv i32 %linear_index13, 1
  %linear_index14 = add nuw nsw i32 %linear_index_base, 2
  %10 = udiv i32 %linear_index14, 1
  %linear_index15 = add nuw nsw i32 %linear_index_base, 3
  %11 = udiv i32 %linear_index15, 1
  %12 = icmp ult i32 %linear_index_base, 128
  br i1 %12, label %fusion.15.in_bounds-true, label %fusion.15.in_bounds-after

fusion.15.in_bounds-after:                        ; preds = %fusion.15.in_bounds-true, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %13 = bitcast [128 x float]* %fusion.15.typed2 to i8*
  %14 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 0
  store i8* %13, i8** %14, align 8
  %15 = bitcast [128 x float]* %fusion.15.typed4 to i8*
  %16 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 1
  store i8* %15, i8** %16, align 8
  %17 = bitcast [128 x float]* %fusion.15.typed6 to i8*
  %18 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 2
  store i8* %17, i8** %18, align 8
  %19 = bitcast [128 x float]* %fusion.15.typed8 to i8*
  %20 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 3
  store i8* %19, i8** %20, align 8
  %21 = bitcast [128 x float]* %fusion.15.typed10 to i8*
  %22 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 4
  store i8* %21, i8** %22, align 8
  %23 = bitcast [128 x float]* %fusion.15.typed12 to i8*
  %24 = getelementptr inbounds [6 x i8*], [6 x i8*]* %fusion.15.typed, i64 0, i64 5
  store i8* %23, i8** %24, align 8
  br label %emit_mof_tuple-after

fusion.15.in_bounds-true:                         ; preds = %emit_mof_tuple-after
  %25 = bitcast [128 x float]* %arg10.11.typed to float*
  %param_0.18 = getelementptr inbounds float, float* %25, i32 %linear_index_base
  %param_0.1816 = load float, float* %param_0.18, align 4, !invariant.load !65
  %26 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.291 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  %param_2.29117 = load float, float* %param_2.291, align 4, !invariant.load !65
  %27 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113 = getelementptr inbounds float, float* %27, i32 %linear_index_base
  %param_4.11318 = load float, float* %param_4.113, align 4
  %28 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.29119 = getelementptr inbounds float, float* %28, i32 %linear_index_base
  %param_2.29120 = load float, float* %param_2.29119, align 4, !invariant.load !65
  %subtract.18.clone.1 = fsub float %param_4.11318, %param_2.29120
  %29 = load float, float* bitcast ([4 x i8]* @81 to float*), align 4
  %param_3.146 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.48.clone.1 = fsub float %29, %param_3.146
  %multiply.23.clone.1 = fmul float %subtract.18.clone.1, %subtract.48.clone.1
  %add.18.clone.1 = fadd float %param_2.29117, %multiply.23.clone.1
  %param_1.249 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.20 = fmul float %add.18.clone.1, %param_1.249
  %30 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.113 = getelementptr inbounds float, float* %30, i32 %linear_index_base
  %param_5.11321 = load float, float* %param_5.113, align 4, !invariant.load !65
  %31 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11322 = getelementptr inbounds float, float* %31, i32 %linear_index_base
  %param_4.11323 = load float, float* %param_4.11322, align 4
  %32 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11324 = getelementptr inbounds float, float* %32, i32 %linear_index_base
  %param_4.11325 = load float, float* %param_4.11324, align 4
  %multiply.22.clone.1 = fmul float %param_4.11323, %param_4.11325
  %33 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.11326 = getelementptr inbounds float, float* %33, i32 %linear_index_base
  %param_5.11327 = load float, float* %param_5.11326, align 4, !invariant.load !65
  %subtract.17.clone.1 = fsub float %multiply.22.clone.1, %param_5.11327
  %34 = load float, float* bitcast ([4 x i8]* @82 to float*), align 4
  %param_6.96 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.49.clone.1 = fsub float %34, %param_6.96
  %multiply.21.clone.1 = fmul float %subtract.17.clone.1, %subtract.49.clone.1
  %add.17.clone.1 = fadd float %param_5.11321, %multiply.21.clone.1
  %35 = call float @__nv_sqrtf(float %add.17.clone.1)
  %36 = load float, float* bitcast ([4 x i8]* @83 to float*), align 4
  %add.16 = fadd float %35, %36
  %divide.6 = fdiv float %multiply.20, %add.16
  %subtract.16 = fsub float %param_0.1816, %divide.6
  %37 = insertvalue { float, float, float, float, float, float } undef, float %subtract.16, 0
  %38 = insertvalue { float, float, float, float, float, float } %37, float %add.18.clone.1, 1
  %39 = insertvalue { float, float, float, float, float, float } %38, float %add.17.clone.1, 2
  %40 = bitcast [128 x float]* %arg12.13.typed to float*
  %param_7.122 = getelementptr inbounds float, float* %40, i32 %linear_index_base
  %param_7.12228 = load float, float* %param_7.122, align 4, !invariant.load !65
  %41 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.32 = getelementptr inbounds float, float* %41, i32 %linear_index_base
  %param_10.3229 = load float, float* %param_10.32, align 4, !invariant.load !65
  %42 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57 = getelementptr inbounds float, float* %42, i32 %linear_index_base
  %param_9.5730 = load float, float* %param_9.57, align 4, !invariant.load !65
  %43 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.3231 = getelementptr inbounds float, float* %43, i32 %linear_index_base
  %param_10.3232 = load float, float* %param_10.3231, align 4, !invariant.load !65
  %subtract.12.clone.1.clone.1 = fsub float %param_9.5730, %param_10.3232
  %multiply.15.clone.1.clone.1 = fmul float %subtract.12.clone.1.clone.1, %subtract.48.clone.1
  %add.12.clone.1.clone.1 = fadd float %param_10.3229, %multiply.15.clone.1.clone.1
  %multiply.12.clone.1 = fmul float %add.12.clone.1.clone.1, %param_1.249
  %44 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.75 = getelementptr inbounds float, float* %44, i32 %linear_index_base
  %param_8.7533 = load float, float* %param_8.75, align 4, !invariant.load !65
  %45 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.5734 = getelementptr inbounds float, float* %45, i32 %linear_index_base
  %param_9.5735 = load float, float* %param_9.5734, align 4, !invariant.load !65
  %46 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.5736 = getelementptr inbounds float, float* %46, i32 %linear_index_base
  %param_9.5737 = load float, float* %param_9.5736, align 4, !invariant.load !65
  %multiply.14.clone.1.clone.1 = fmul float %param_9.5735, %param_9.5737
  %47 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.7538 = getelementptr inbounds float, float* %47, i32 %linear_index_base
  %param_8.7539 = load float, float* %param_8.7538, align 4, !invariant.load !65
  %subtract.11.clone.1.clone.1 = fsub float %multiply.14.clone.1.clone.1, %param_8.7539
  %multiply.13.clone.1.clone.1 = fmul float %subtract.11.clone.1.clone.1, %subtract.49.clone.1
  %add.11.clone.1.clone.1 = fadd float %param_8.7533, %multiply.13.clone.1.clone.1
  %48 = call float @__nv_sqrtf(float %add.11.clone.1.clone.1)
  %add.10.clone.1 = fadd float %48, %36
  %divide.4.clone.1 = fdiv float %multiply.12.clone.1, %add.10.clone.1
  %subtract.10.clone.1 = fsub float %param_7.12228, %divide.4.clone.1
  %49 = insertvalue { float, float, float, float, float, float } %39, float %subtract.10.clone.1, 3
  %50 = insertvalue { float, float, float, float, float, float } %49, float %add.12.clone.1.clone.1, 4
  %51 = insertvalue { float, float, float, float, float, float } %50, float %add.11.clone.1.clone.1, 5
  %52 = extractvalue { float, float, float, float, float, float } %51, 0
  %53 = bitcast [128 x float]* %fusion.15.typed2 to float*
  %54 = getelementptr inbounds float, float* %53, i32 %linear_index_base
  store float %52, float* %54, align 4
  %55 = extractvalue { float, float, float, float, float, float } %51, 1
  %56 = bitcast [128 x float]* %fusion.15.typed4 to float*
  %57 = getelementptr inbounds float, float* %56, i32 %linear_index_base
  store float %55, float* %57, align 4
  %58 = extractvalue { float, float, float, float, float, float } %51, 2
  %59 = bitcast [128 x float]* %fusion.15.typed6 to float*
  %60 = getelementptr inbounds float, float* %59, i32 %linear_index_base
  store float %58, float* %60, align 4
  %61 = extractvalue { float, float, float, float, float, float } %51, 3
  %62 = bitcast [128 x float]* %fusion.15.typed8 to float*
  %63 = getelementptr inbounds float, float* %62, i32 %linear_index_base
  store float %61, float* %63, align 4
  %64 = extractvalue { float, float, float, float, float, float } %51, 4
  %65 = bitcast [128 x float]* %fusion.15.typed10 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index_base
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float, float, float, float, float } %51, 5
  %68 = bitcast [128 x float]* %fusion.15.typed12 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index_base
  store float %67, float* %69, align 4
  %70 = bitcast [128 x float]* %arg10.11.typed to float*
  %param_0.1840 = getelementptr inbounds float, float* %70, i32 %linear_index13
  %param_0.1841 = load float, float* %param_0.1840, align 4, !invariant.load !65
  %71 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.29142 = getelementptr inbounds float, float* %71, i32 %linear_index13
  %param_2.29143 = load float, float* %param_2.29142, align 4, !invariant.load !65
  %72 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11344 = getelementptr inbounds float, float* %72, i32 %linear_index13
  %param_4.11345 = load float, float* %param_4.11344, align 4
  %73 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.29146 = getelementptr inbounds float, float* %73, i32 %linear_index13
  %param_2.29147 = load float, float* %param_2.29146, align 4, !invariant.load !65
  %subtract.18.clone.148 = fsub float %param_4.11345, %param_2.29147
  %multiply.23.clone.149 = fmul float %subtract.18.clone.148, %subtract.48.clone.1
  %add.18.clone.150 = fadd float %param_2.29143, %multiply.23.clone.149
  %param_1.24951 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.2052 = fmul float %add.18.clone.150, %param_1.24951
  %74 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.11353 = getelementptr inbounds float, float* %74, i32 %linear_index13
  %param_5.11354 = load float, float* %param_5.11353, align 4, !invariant.load !65
  %75 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11355 = getelementptr inbounds float, float* %75, i32 %linear_index13
  %param_4.11356 = load float, float* %param_4.11355, align 4
  %76 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11357 = getelementptr inbounds float, float* %76, i32 %linear_index13
  %param_4.11358 = load float, float* %param_4.11357, align 4
  %multiply.22.clone.159 = fmul float %param_4.11356, %param_4.11358
  %77 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.11360 = getelementptr inbounds float, float* %77, i32 %linear_index13
  %param_5.11361 = load float, float* %param_5.11360, align 4, !invariant.load !65
  %subtract.17.clone.162 = fsub float %multiply.22.clone.159, %param_5.11361
  %multiply.21.clone.163 = fmul float %subtract.17.clone.162, %subtract.49.clone.1
  %add.17.clone.164 = fadd float %param_5.11354, %multiply.21.clone.163
  %78 = call float @__nv_sqrtf(float %add.17.clone.164)
  %79 = load float, float* bitcast ([4 x i8]* @84 to float*), align 4
  %add.1665 = fadd float %78, %79
  %divide.666 = fdiv float %multiply.2052, %add.1665
  %subtract.1667 = fsub float %param_0.1841, %divide.666
  %80 = insertvalue { float, float, float, float, float, float } undef, float %subtract.1667, 0
  %81 = insertvalue { float, float, float, float, float, float } %80, float %add.18.clone.150, 1
  %82 = insertvalue { float, float, float, float, float, float } %81, float %add.17.clone.164, 2
  %83 = bitcast [128 x float]* %arg12.13.typed to float*
  %param_7.12268 = getelementptr inbounds float, float* %83, i32 %linear_index13
  %param_7.12269 = load float, float* %param_7.12268, align 4, !invariant.load !65
  %84 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.3270 = getelementptr inbounds float, float* %84, i32 %linear_index13
  %param_10.3271 = load float, float* %param_10.3270, align 4, !invariant.load !65
  %85 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.5772 = getelementptr inbounds float, float* %85, i32 %linear_index13
  %param_9.5773 = load float, float* %param_9.5772, align 4, !invariant.load !65
  %86 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.3274 = getelementptr inbounds float, float* %86, i32 %linear_index13
  %param_10.3275 = load float, float* %param_10.3274, align 4, !invariant.load !65
  %subtract.12.clone.1.clone.176 = fsub float %param_9.5773, %param_10.3275
  %multiply.15.clone.1.clone.177 = fmul float %subtract.12.clone.1.clone.176, %subtract.48.clone.1
  %add.12.clone.1.clone.178 = fadd float %param_10.3271, %multiply.15.clone.1.clone.177
  %multiply.12.clone.179 = fmul float %add.12.clone.1.clone.178, %param_1.24951
  %87 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.7580 = getelementptr inbounds float, float* %87, i32 %linear_index13
  %param_8.7581 = load float, float* %param_8.7580, align 4, !invariant.load !65
  %88 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.5782 = getelementptr inbounds float, float* %88, i32 %linear_index13
  %param_9.5783 = load float, float* %param_9.5782, align 4, !invariant.load !65
  %89 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.5784 = getelementptr inbounds float, float* %89, i32 %linear_index13
  %param_9.5785 = load float, float* %param_9.5784, align 4, !invariant.load !65
  %multiply.14.clone.1.clone.186 = fmul float %param_9.5783, %param_9.5785
  %90 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.7587 = getelementptr inbounds float, float* %90, i32 %linear_index13
  %param_8.7588 = load float, float* %param_8.7587, align 4, !invariant.load !65
  %subtract.11.clone.1.clone.189 = fsub float %multiply.14.clone.1.clone.186, %param_8.7588
  %multiply.13.clone.1.clone.190 = fmul float %subtract.11.clone.1.clone.189, %subtract.49.clone.1
  %add.11.clone.1.clone.191 = fadd float %param_8.7581, %multiply.13.clone.1.clone.190
  %91 = call float @__nv_sqrtf(float %add.11.clone.1.clone.191)
  %add.10.clone.192 = fadd float %91, %79
  %divide.4.clone.193 = fdiv float %multiply.12.clone.179, %add.10.clone.192
  %subtract.10.clone.194 = fsub float %param_7.12269, %divide.4.clone.193
  %92 = insertvalue { float, float, float, float, float, float } %82, float %subtract.10.clone.194, 3
  %93 = insertvalue { float, float, float, float, float, float } %92, float %add.12.clone.1.clone.178, 4
  %94 = insertvalue { float, float, float, float, float, float } %93, float %add.11.clone.1.clone.191, 5
  %95 = extractvalue { float, float, float, float, float, float } %94, 0
  %96 = bitcast [128 x float]* %fusion.15.typed2 to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index13
  store float %95, float* %97, align 4
  %98 = extractvalue { float, float, float, float, float, float } %94, 1
  %99 = bitcast [128 x float]* %fusion.15.typed4 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index13
  store float %98, float* %100, align 4
  %101 = extractvalue { float, float, float, float, float, float } %94, 2
  %102 = bitcast [128 x float]* %fusion.15.typed6 to float*
  %103 = getelementptr inbounds float, float* %102, i32 %linear_index13
  store float %101, float* %103, align 4
  %104 = extractvalue { float, float, float, float, float, float } %94, 3
  %105 = bitcast [128 x float]* %fusion.15.typed8 to float*
  %106 = getelementptr inbounds float, float* %105, i32 %linear_index13
  store float %104, float* %106, align 4
  %107 = extractvalue { float, float, float, float, float, float } %94, 4
  %108 = bitcast [128 x float]* %fusion.15.typed10 to float*
  %109 = getelementptr inbounds float, float* %108, i32 %linear_index13
  store float %107, float* %109, align 4
  %110 = extractvalue { float, float, float, float, float, float } %94, 5
  %111 = bitcast [128 x float]* %fusion.15.typed12 to float*
  %112 = getelementptr inbounds float, float* %111, i32 %linear_index13
  store float %110, float* %112, align 4
  %113 = bitcast [128 x float]* %arg10.11.typed to float*
  %param_0.1895 = getelementptr inbounds float, float* %113, i32 %linear_index14
  %param_0.1896 = load float, float* %param_0.1895, align 4, !invariant.load !65
  %114 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.29197 = getelementptr inbounds float, float* %114, i32 %linear_index14
  %param_2.29198 = load float, float* %param_2.29197, align 4, !invariant.load !65
  %115 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.11399 = getelementptr inbounds float, float* %115, i32 %linear_index14
  %param_4.113100 = load float, float* %param_4.11399, align 4
  %116 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.291101 = getelementptr inbounds float, float* %116, i32 %linear_index14
  %param_2.291102 = load float, float* %param_2.291101, align 4, !invariant.load !65
  %subtract.18.clone.1103 = fsub float %param_4.113100, %param_2.291102
  %multiply.23.clone.1104 = fmul float %subtract.18.clone.1103, %subtract.48.clone.1
  %add.18.clone.1105 = fadd float %param_2.29198, %multiply.23.clone.1104
  %param_1.249106 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.20107 = fmul float %add.18.clone.1105, %param_1.249106
  %117 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.113108 = getelementptr inbounds float, float* %117, i32 %linear_index14
  %param_5.113109 = load float, float* %param_5.113108, align 4, !invariant.load !65
  %118 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113110 = getelementptr inbounds float, float* %118, i32 %linear_index14
  %param_4.113111 = load float, float* %param_4.113110, align 4
  %119 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113112 = getelementptr inbounds float, float* %119, i32 %linear_index14
  %param_4.113113 = load float, float* %param_4.113112, align 4
  %multiply.22.clone.1114 = fmul float %param_4.113111, %param_4.113113
  %120 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.113115 = getelementptr inbounds float, float* %120, i32 %linear_index14
  %param_5.113116 = load float, float* %param_5.113115, align 4, !invariant.load !65
  %subtract.17.clone.1117 = fsub float %multiply.22.clone.1114, %param_5.113116
  %multiply.21.clone.1118 = fmul float %subtract.17.clone.1117, %subtract.49.clone.1
  %add.17.clone.1119 = fadd float %param_5.113109, %multiply.21.clone.1118
  %121 = call float @__nv_sqrtf(float %add.17.clone.1119)
  %122 = load float, float* bitcast ([4 x i8]* @85 to float*), align 4
  %add.16120 = fadd float %121, %122
  %divide.6121 = fdiv float %multiply.20107, %add.16120
  %subtract.16122 = fsub float %param_0.1896, %divide.6121
  %123 = insertvalue { float, float, float, float, float, float } undef, float %subtract.16122, 0
  %124 = insertvalue { float, float, float, float, float, float } %123, float %add.18.clone.1105, 1
  %125 = insertvalue { float, float, float, float, float, float } %124, float %add.17.clone.1119, 2
  %126 = bitcast [128 x float]* %arg12.13.typed to float*
  %param_7.122123 = getelementptr inbounds float, float* %126, i32 %linear_index14
  %param_7.122124 = load float, float* %param_7.122123, align 4, !invariant.load !65
  %127 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.32125 = getelementptr inbounds float, float* %127, i32 %linear_index14
  %param_10.32126 = load float, float* %param_10.32125, align 4, !invariant.load !65
  %128 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57127 = getelementptr inbounds float, float* %128, i32 %linear_index14
  %param_9.57128 = load float, float* %param_9.57127, align 4, !invariant.load !65
  %129 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.32129 = getelementptr inbounds float, float* %129, i32 %linear_index14
  %param_10.32130 = load float, float* %param_10.32129, align 4, !invariant.load !65
  %subtract.12.clone.1.clone.1131 = fsub float %param_9.57128, %param_10.32130
  %multiply.15.clone.1.clone.1132 = fmul float %subtract.12.clone.1.clone.1131, %subtract.48.clone.1
  %add.12.clone.1.clone.1133 = fadd float %param_10.32126, %multiply.15.clone.1.clone.1132
  %multiply.12.clone.1134 = fmul float %add.12.clone.1.clone.1133, %param_1.249106
  %130 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.75135 = getelementptr inbounds float, float* %130, i32 %linear_index14
  %param_8.75136 = load float, float* %param_8.75135, align 4, !invariant.load !65
  %131 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57137 = getelementptr inbounds float, float* %131, i32 %linear_index14
  %param_9.57138 = load float, float* %param_9.57137, align 4, !invariant.load !65
  %132 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57139 = getelementptr inbounds float, float* %132, i32 %linear_index14
  %param_9.57140 = load float, float* %param_9.57139, align 4, !invariant.load !65
  %multiply.14.clone.1.clone.1141 = fmul float %param_9.57138, %param_9.57140
  %133 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.75142 = getelementptr inbounds float, float* %133, i32 %linear_index14
  %param_8.75143 = load float, float* %param_8.75142, align 4, !invariant.load !65
  %subtract.11.clone.1.clone.1144 = fsub float %multiply.14.clone.1.clone.1141, %param_8.75143
  %multiply.13.clone.1.clone.1145 = fmul float %subtract.11.clone.1.clone.1144, %subtract.49.clone.1
  %add.11.clone.1.clone.1146 = fadd float %param_8.75136, %multiply.13.clone.1.clone.1145
  %134 = call float @__nv_sqrtf(float %add.11.clone.1.clone.1146)
  %add.10.clone.1147 = fadd float %134, %122
  %divide.4.clone.1148 = fdiv float %multiply.12.clone.1134, %add.10.clone.1147
  %subtract.10.clone.1149 = fsub float %param_7.122124, %divide.4.clone.1148
  %135 = insertvalue { float, float, float, float, float, float } %125, float %subtract.10.clone.1149, 3
  %136 = insertvalue { float, float, float, float, float, float } %135, float %add.12.clone.1.clone.1133, 4
  %137 = insertvalue { float, float, float, float, float, float } %136, float %add.11.clone.1.clone.1146, 5
  %138 = extractvalue { float, float, float, float, float, float } %137, 0
  %139 = bitcast [128 x float]* %fusion.15.typed2 to float*
  %140 = getelementptr inbounds float, float* %139, i32 %linear_index14
  store float %138, float* %140, align 4
  %141 = extractvalue { float, float, float, float, float, float } %137, 1
  %142 = bitcast [128 x float]* %fusion.15.typed4 to float*
  %143 = getelementptr inbounds float, float* %142, i32 %linear_index14
  store float %141, float* %143, align 4
  %144 = extractvalue { float, float, float, float, float, float } %137, 2
  %145 = bitcast [128 x float]* %fusion.15.typed6 to float*
  %146 = getelementptr inbounds float, float* %145, i32 %linear_index14
  store float %144, float* %146, align 4
  %147 = extractvalue { float, float, float, float, float, float } %137, 3
  %148 = bitcast [128 x float]* %fusion.15.typed8 to float*
  %149 = getelementptr inbounds float, float* %148, i32 %linear_index14
  store float %147, float* %149, align 4
  %150 = extractvalue { float, float, float, float, float, float } %137, 4
  %151 = bitcast [128 x float]* %fusion.15.typed10 to float*
  %152 = getelementptr inbounds float, float* %151, i32 %linear_index14
  store float %150, float* %152, align 4
  %153 = extractvalue { float, float, float, float, float, float } %137, 5
  %154 = bitcast [128 x float]* %fusion.15.typed12 to float*
  %155 = getelementptr inbounds float, float* %154, i32 %linear_index14
  store float %153, float* %155, align 4
  %156 = bitcast [128 x float]* %arg10.11.typed to float*
  %param_0.18150 = getelementptr inbounds float, float* %156, i32 %linear_index15
  %param_0.18151 = load float, float* %param_0.18150, align 4, !invariant.load !65
  %157 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.291152 = getelementptr inbounds float, float* %157, i32 %linear_index15
  %param_2.291153 = load float, float* %param_2.291152, align 4, !invariant.load !65
  %158 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113154 = getelementptr inbounds float, float* %158, i32 %linear_index15
  %param_4.113155 = load float, float* %param_4.113154, align 4
  %159 = bitcast [128 x float]* %arg26.27.typed to float*
  %param_2.291156 = getelementptr inbounds float, float* %159, i32 %linear_index15
  %param_2.291157 = load float, float* %param_2.291156, align 4, !invariant.load !65
  %subtract.18.clone.1158 = fsub float %param_4.113155, %param_2.291157
  %multiply.23.clone.1159 = fmul float %subtract.18.clone.1158, %subtract.48.clone.1
  %add.18.clone.1160 = fadd float %param_2.291153, %multiply.23.clone.1159
  %param_1.249161 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.20162 = fmul float %add.18.clone.1160, %param_1.249161
  %160 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.113163 = getelementptr inbounds float, float* %160, i32 %linear_index15
  %param_5.113164 = load float, float* %param_5.113163, align 4, !invariant.load !65
  %161 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113165 = getelementptr inbounds float, float* %161, i32 %linear_index15
  %param_4.113166 = load float, float* %param_4.113165, align 4
  %162 = bitcast [128 x float]* %fusion.18.typed to float*
  %param_4.113167 = getelementptr inbounds float, float* %162, i32 %linear_index15
  %param_4.113168 = load float, float* %param_4.113167, align 4
  %multiply.22.clone.1169 = fmul float %param_4.113166, %param_4.113168
  %163 = bitcast [128 x float]* %arg27.28.typed to float*
  %param_5.113170 = getelementptr inbounds float, float* %163, i32 %linear_index15
  %param_5.113171 = load float, float* %param_5.113170, align 4, !invariant.load !65
  %subtract.17.clone.1172 = fsub float %multiply.22.clone.1169, %param_5.113171
  %multiply.21.clone.1173 = fmul float %subtract.17.clone.1172, %subtract.49.clone.1
  %add.17.clone.1174 = fadd float %param_5.113164, %multiply.21.clone.1173
  %164 = call float @__nv_sqrtf(float %add.17.clone.1174)
  %165 = load float, float* bitcast ([4 x i8]* @86 to float*), align 4
  %add.16175 = fadd float %164, %165
  %divide.6176 = fdiv float %multiply.20162, %add.16175
  %subtract.16177 = fsub float %param_0.18151, %divide.6176
  %166 = insertvalue { float, float, float, float, float, float } undef, float %subtract.16177, 0
  %167 = insertvalue { float, float, float, float, float, float } %166, float %add.18.clone.1160, 1
  %168 = insertvalue { float, float, float, float, float, float } %167, float %add.17.clone.1174, 2
  %169 = bitcast [128 x float]* %arg12.13.typed to float*
  %param_7.122178 = getelementptr inbounds float, float* %169, i32 %linear_index15
  %param_7.122179 = load float, float* %param_7.122178, align 4, !invariant.load !65
  %170 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.32180 = getelementptr inbounds float, float* %170, i32 %linear_index15
  %param_10.32181 = load float, float* %param_10.32180, align 4, !invariant.load !65
  %171 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57182 = getelementptr inbounds float, float* %171, i32 %linear_index15
  %param_9.57183 = load float, float* %param_9.57182, align 4, !invariant.load !65
  %172 = bitcast [128 x float]* %arg22.23.typed to float*
  %param_10.32184 = getelementptr inbounds float, float* %172, i32 %linear_index15
  %param_10.32185 = load float, float* %param_10.32184, align 4, !invariant.load !65
  %subtract.12.clone.1.clone.1186 = fsub float %param_9.57183, %param_10.32185
  %multiply.15.clone.1.clone.1187 = fmul float %subtract.12.clone.1.clone.1186, %subtract.48.clone.1
  %add.12.clone.1.clone.1188 = fadd float %param_10.32181, %multiply.15.clone.1.clone.1187
  %multiply.12.clone.1189 = fmul float %add.12.clone.1.clone.1188, %param_1.249161
  %173 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.75190 = getelementptr inbounds float, float* %173, i32 %linear_index15
  %param_8.75191 = load float, float* %param_8.75190, align 4, !invariant.load !65
  %174 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57192 = getelementptr inbounds float, float* %174, i32 %linear_index15
  %param_9.57193 = load float, float* %param_9.57192, align 4, !invariant.load !65
  %175 = bitcast [128 x float]* %get-tuple-element.114.typed to float*
  %param_9.57194 = getelementptr inbounds float, float* %175, i32 %linear_index15
  %param_9.57195 = load float, float* %param_9.57194, align 4, !invariant.load !65
  %multiply.14.clone.1.clone.1196 = fmul float %param_9.57193, %param_9.57195
  %176 = bitcast [128 x float]* %arg23.24.typed to float*
  %param_8.75197 = getelementptr inbounds float, float* %176, i32 %linear_index15
  %param_8.75198 = load float, float* %param_8.75197, align 4, !invariant.load !65
  %subtract.11.clone.1.clone.1199 = fsub float %multiply.14.clone.1.clone.1196, %param_8.75198
  %multiply.13.clone.1.clone.1200 = fmul float %subtract.11.clone.1.clone.1199, %subtract.49.clone.1
  %add.11.clone.1.clone.1201 = fadd float %param_8.75191, %multiply.13.clone.1.clone.1200
  %177 = call float @__nv_sqrtf(float %add.11.clone.1.clone.1201)
  %add.10.clone.1202 = fadd float %177, %165
  %divide.4.clone.1203 = fdiv float %multiply.12.clone.1189, %add.10.clone.1202
  %subtract.10.clone.1204 = fsub float %param_7.122179, %divide.4.clone.1203
  %178 = insertvalue { float, float, float, float, float, float } %168, float %subtract.10.clone.1204, 3
  %179 = insertvalue { float, float, float, float, float, float } %178, float %add.12.clone.1.clone.1188, 4
  %180 = insertvalue { float, float, float, float, float, float } %179, float %add.11.clone.1.clone.1201, 5
  %181 = extractvalue { float, float, float, float, float, float } %180, 0
  %182 = bitcast [128 x float]* %fusion.15.typed2 to float*
  %183 = getelementptr inbounds float, float* %182, i32 %linear_index15
  store float %181, float* %183, align 4
  %184 = extractvalue { float, float, float, float, float, float } %180, 1
  %185 = bitcast [128 x float]* %fusion.15.typed4 to float*
  %186 = getelementptr inbounds float, float* %185, i32 %linear_index15
  store float %184, float* %186, align 4
  %187 = extractvalue { float, float, float, float, float, float } %180, 2
  %188 = bitcast [128 x float]* %fusion.15.typed6 to float*
  %189 = getelementptr inbounds float, float* %188, i32 %linear_index15
  store float %187, float* %189, align 4
  %190 = extractvalue { float, float, float, float, float, float } %180, 3
  %191 = bitcast [128 x float]* %fusion.15.typed8 to float*
  %192 = getelementptr inbounds float, float* %191, i32 %linear_index15
  store float %190, float* %192, align 4
  %193 = extractvalue { float, float, float, float, float, float } %180, 4
  %194 = bitcast [128 x float]* %fusion.15.typed10 to float*
  %195 = getelementptr inbounds float, float* %194, i32 %linear_index15
  store float %193, float* %195, align 4
  %196 = extractvalue { float, float, float, float, float, float } %180, 5
  %197 = bitcast [128 x float]* %fusion.15.typed12 to float*
  %198 = getelementptr inbounds float, float* %197, i32 %linear_index15
  store float %196, float* %198, align 4
  br label %fusion.15.in_bounds-after
}

define void @fusion_55(i8* noalias align 64 dereferenceable(819200) %alloc7, i8* noalias align 64 dereferenceable(819200) %alloc8, i8* noalias align 64 dereferenceable(819200) %alloc9, i8* noalias align 16 dereferenceable(819200) %alloc10, i8* noalias align 16 dereferenceable(819200) %alloc11, i8* noalias align 16 dereferenceable(819200) %alloc12, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.55.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056320
  %fusion.55.typed = bitcast i8* %fusion.55.raw to [3 x i8*]*
  %fusion.55.raw1 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %fusion.55.typed2 = bitcast i8* %fusion.55.raw1 to [5 x [5 x [64 x [128 x float]]]]*
  %fusion.55.raw3 = getelementptr inbounds i8, i8* %alloc8, i64 0
  %fusion.55.typed4 = bitcast i8* %fusion.55.raw3 to [5 x [5 x [64 x [128 x float]]]]*
  %fusion.55.raw5 = getelementptr inbounds i8, i8* %alloc9, i64 0
  %fusion.55.typed6 = bitcast i8* %fusion.55.raw5 to [5 x [5 x [64 x [128 x float]]]]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %get-tuple-element.73.raw = getelementptr inbounds i8, i8* %temp_buf, i64 167149632
  %get-tuple-element.73.typed = bitcast i8* %get-tuple-element.73.raw to [128 x [64 x [5 x [5 x float]]]]*
  %arg24.25.raw = getelementptr inbounds i8, i8* %alloc11, i64 0
  %arg24.25.typed = bitcast i8* %arg24.25.raw to [5 x [5 x [64 x [128 x float]]]]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg25.26.raw = getelementptr inbounds i8, i8* %alloc12, i64 0
  %arg25.26.typed = bitcast i8* %arg25.26.raw to [5 x [5 x [64 x [128 x float]]]]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg11.12.raw = getelementptr inbounds i8, i8* %alloc10, i64 0
  %arg11.12.typed = bitcast i8* %arg11.12.raw to [5 x [5 x [64 x [128 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %7 = mul nuw nsw i32 %5, 256
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 51200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index_base, 128
  %11 = urem i32 %10, 64
  %12 = udiv i32 %linear_index_base, 8192
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index_base, 40960
  %linear_index7 = add nuw nsw i32 %linear_index_base, 1
  %15 = udiv i32 %linear_index7, 1
  %16 = urem i32 %15, 128
  %17 = udiv i32 %linear_index7, 128
  %18 = urem i32 %17, 64
  %19 = udiv i32 %linear_index7, 8192
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index7, 40960
  %linear_index8 = add nuw nsw i32 %linear_index_base, 2
  %22 = udiv i32 %linear_index8, 1
  %23 = urem i32 %22, 128
  %24 = udiv i32 %linear_index8, 128
  %25 = urem i32 %24, 64
  %26 = udiv i32 %linear_index8, 8192
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index8, 40960
  %linear_index9 = add nuw nsw i32 %linear_index_base, 3
  %29 = udiv i32 %linear_index9, 1
  %30 = urem i32 %29, 128
  %31 = udiv i32 %linear_index9, 128
  %32 = urem i32 %31, 64
  %33 = udiv i32 %linear_index9, 8192
  %34 = urem i32 %33, 5
  %35 = udiv i32 %linear_index9, 40960
  %36 = icmp ult i32 %linear_index_base, 204800
  br i1 %36, label %fusion.55.in_bounds-true, label %fusion.55.in_bounds-after

fusion.55.in_bounds-after:                        ; preds = %fusion.55.in_bounds-true, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %37 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed2 to i8*
  %38 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.55.typed, i64 0, i64 0
  store i8* %37, i8** %38, align 8
  %39 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed4 to i8*
  %40 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.55.typed, i64 0, i64 1
  store i8* %39, i8** %40, align 8
  %41 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed6 to i8*
  %42 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.55.typed, i64 0, i64 2
  store i8* %41, i8** %42, align 8
  br label %emit_mof_tuple-after

fusion.55.in_bounds-true:                         ; preds = %emit_mof_tuple-after
  %param_2.281 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg24.25.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_2.28110 = load float, float* %param_2.281, align 4, !invariant.load !65
  %param_1.244 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.24411 = load float, float* %param_1.244, align 4, !invariant.load !65
  %subtract.115 = fsub float %param_1.24411, %param_2.28110
  %43 = load float, float* bitcast ([4 x i8]* @87 to float*), align 4
  %param_0.153 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.114 = fsub float %43, %param_0.153
  %multiply.95 = fmul float %subtract.115, %subtract.114
  %add.70 = fadd float %param_2.28110, %multiply.95
  %44 = insertvalue { float, float, float } undef, float %add.70, 0
  %param_6.92 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_6.9212 = load float, float* %param_6.92, align 4, !invariant.load !65
  %param_5.107 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.16.clone.1 = fmul float %add.70, %param_5.107
  %param_4.109 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg25.26.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_4.10913 = load float, float* %param_4.109, align 4, !invariant.load !65
  %param_1.24414 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.24415 = load float, float* %param_1.24414, align 4, !invariant.load !65
  %param_1.24416 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.24417 = load float, float* %param_1.24416, align 4, !invariant.load !65
  %multiply.87.clone.1 = fmul float %param_1.24415, %param_1.24417
  %subtract.103.clone.1 = fsub float %multiply.87.clone.1, %param_4.10913
  %45 = load float, float* bitcast ([4 x i8]* @88 to float*), align 4
  %param_3.144 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.102.clone.1 = fsub float %45, %param_3.144
  %multiply.86.clone.1 = fmul float %subtract.103.clone.1, %subtract.102.clone.1
  %add.63.clone.1 = fadd float %param_4.10913, %multiply.86.clone.1
  %46 = call float @__nv_sqrtf(float %add.63.clone.1)
  %47 = load float, float* bitcast ([4 x i8]* @89 to float*), align 4
  %add.13.clone.1 = fadd float %46, %47
  %divide.5.clone.1 = fdiv float %multiply.16.clone.1, %add.13.clone.1
  %subtract.13.clone.1 = fsub float %param_6.9212, %divide.5.clone.1
  %48 = insertvalue { float, float, float } %44, float %subtract.13.clone.1, 1
  %49 = insertvalue { float, float, float } %48, float %add.63.clone.1, 2
  %50 = extractvalue { float, float, float } %49, 0
  %51 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed2 to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index_base
  store float %50, float* %52, align 4
  %53 = extractvalue { float, float, float } %49, 1
  %54 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed4 to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index_base
  store float %53, float* %55, align 4
  %56 = extractvalue { float, float, float } %49, 2
  %57 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed6 to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index_base
  store float %56, float* %58, align 4
  %param_2.28118 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg24.25.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_2.28119 = load float, float* %param_2.28118, align 4, !invariant.load !65
  %param_1.24420 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.24421 = load float, float* %param_1.24420, align 4, !invariant.load !65
  %subtract.11522 = fsub float %param_1.24421, %param_2.28119
  %multiply.9523 = fmul float %subtract.11522, %subtract.114
  %add.7024 = fadd float %param_2.28119, %multiply.9523
  %59 = insertvalue { float, float, float } undef, float %add.7024, 0
  %param_6.9225 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_6.9226 = load float, float* %param_6.9225, align 4, !invariant.load !65
  %param_5.10727 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.16.clone.128 = fmul float %add.7024, %param_5.10727
  %param_4.10929 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg25.26.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_4.10930 = load float, float* %param_4.10929, align 4, !invariant.load !65
  %param_1.24431 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.24432 = load float, float* %param_1.24431, align 4, !invariant.load !65
  %param_1.24433 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.24434 = load float, float* %param_1.24433, align 4, !invariant.load !65
  %multiply.87.clone.135 = fmul float %param_1.24432, %param_1.24434
  %subtract.103.clone.136 = fsub float %multiply.87.clone.135, %param_4.10930
  %multiply.86.clone.137 = fmul float %subtract.103.clone.136, %subtract.102.clone.1
  %add.63.clone.138 = fadd float %param_4.10930, %multiply.86.clone.137
  %60 = call float @__nv_sqrtf(float %add.63.clone.138)
  %61 = load float, float* bitcast ([4 x i8]* @90 to float*), align 4
  %add.13.clone.139 = fadd float %60, %61
  %divide.5.clone.140 = fdiv float %multiply.16.clone.128, %add.13.clone.139
  %subtract.13.clone.141 = fsub float %param_6.9226, %divide.5.clone.140
  %62 = insertvalue { float, float, float } %59, float %subtract.13.clone.141, 1
  %63 = insertvalue { float, float, float } %62, float %add.63.clone.138, 2
  %64 = extractvalue { float, float, float } %63, 0
  %65 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed2 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index7
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float, float } %63, 1
  %68 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed4 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index7
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %63, 2
  %71 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed6 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index7
  store float %70, float* %72, align 4
  %param_2.28142 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg24.25.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_2.28143 = load float, float* %param_2.28142, align 4, !invariant.load !65
  %param_1.24444 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.24445 = load float, float* %param_1.24444, align 4, !invariant.load !65
  %subtract.11546 = fsub float %param_1.24445, %param_2.28143
  %multiply.9547 = fmul float %subtract.11546, %subtract.114
  %add.7048 = fadd float %param_2.28143, %multiply.9547
  %73 = insertvalue { float, float, float } undef, float %add.7048, 0
  %param_6.9249 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_6.9250 = load float, float* %param_6.9249, align 4, !invariant.load !65
  %param_5.10751 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.16.clone.152 = fmul float %add.7048, %param_5.10751
  %param_4.10953 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg25.26.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_4.10954 = load float, float* %param_4.10953, align 4, !invariant.load !65
  %param_1.24455 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.24456 = load float, float* %param_1.24455, align 4, !invariant.load !65
  %param_1.24457 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.24458 = load float, float* %param_1.24457, align 4, !invariant.load !65
  %multiply.87.clone.159 = fmul float %param_1.24456, %param_1.24458
  %subtract.103.clone.160 = fsub float %multiply.87.clone.159, %param_4.10954
  %multiply.86.clone.161 = fmul float %subtract.103.clone.160, %subtract.102.clone.1
  %add.63.clone.162 = fadd float %param_4.10954, %multiply.86.clone.161
  %74 = call float @__nv_sqrtf(float %add.63.clone.162)
  %75 = load float, float* bitcast ([4 x i8]* @91 to float*), align 4
  %add.13.clone.163 = fadd float %74, %75
  %divide.5.clone.164 = fdiv float %multiply.16.clone.152, %add.13.clone.163
  %subtract.13.clone.165 = fsub float %param_6.9250, %divide.5.clone.164
  %76 = insertvalue { float, float, float } %73, float %subtract.13.clone.165, 1
  %77 = insertvalue { float, float, float } %76, float %add.63.clone.162, 2
  %78 = extractvalue { float, float, float } %77, 0
  %79 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed2 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index8
  store float %78, float* %80, align 4
  %81 = extractvalue { float, float, float } %77, 1
  %82 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed4 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index8
  store float %81, float* %83, align 4
  %84 = extractvalue { float, float, float } %77, 2
  %85 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed6 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index8
  store float %84, float* %86, align 4
  %param_2.28166 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg24.25.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_2.28167 = load float, float* %param_2.28166, align 4, !invariant.load !65
  %param_1.24468 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.24469 = load float, float* %param_1.24468, align 4, !invariant.load !65
  %subtract.11570 = fsub float %param_1.24469, %param_2.28167
  %multiply.9571 = fmul float %subtract.11570, %subtract.114
  %add.7072 = fadd float %param_2.28167, %multiply.9571
  %87 = insertvalue { float, float, float } undef, float %add.7072, 0
  %param_6.9273 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg11.12.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_6.9274 = load float, float* %param_6.9273, align 4, !invariant.load !65
  %param_5.10775 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.16.clone.176 = fmul float %add.7072, %param_5.10775
  %param_4.10977 = getelementptr inbounds [5 x [5 x [64 x [128 x float]]]], [5 x [5 x [64 x [128 x float]]]]* %arg25.26.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_4.10978 = load float, float* %param_4.10977, align 4, !invariant.load !65
  %param_1.24479 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.24480 = load float, float* %param_1.24479, align 4, !invariant.load !65
  %param_1.24481 = getelementptr inbounds [128 x [64 x [5 x [5 x float]]]], [128 x [64 x [5 x [5 x float]]]]* %get-tuple-element.73.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.24482 = load float, float* %param_1.24481, align 4, !invariant.load !65
  %multiply.87.clone.183 = fmul float %param_1.24480, %param_1.24482
  %subtract.103.clone.184 = fsub float %multiply.87.clone.183, %param_4.10978
  %multiply.86.clone.185 = fmul float %subtract.103.clone.184, %subtract.102.clone.1
  %add.63.clone.186 = fadd float %param_4.10978, %multiply.86.clone.185
  %88 = call float @__nv_sqrtf(float %add.63.clone.186)
  %89 = load float, float* bitcast ([4 x i8]* @92 to float*), align 4
  %add.13.clone.187 = fadd float %88, %89
  %divide.5.clone.188 = fdiv float %multiply.16.clone.176, %add.13.clone.187
  %subtract.13.clone.189 = fsub float %param_6.9274, %divide.5.clone.188
  %90 = insertvalue { float, float, float } %87, float %subtract.13.clone.189, 1
  %91 = insertvalue { float, float, float } %90, float %add.63.clone.186, 2
  %92 = extractvalue { float, float, float } %91, 0
  %93 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed2 to float*
  %94 = getelementptr inbounds float, float* %93, i32 %linear_index9
  store float %92, float* %94, align 4
  %95 = extractvalue { float, float, float } %91, 1
  %96 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed4 to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index9
  store float %95, float* %97, align 4
  %98 = extractvalue { float, float, float } %91, 2
  %99 = bitcast [5 x [5 x [64 x [128 x float]]]]* %fusion.55.typed6 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index9
  store float %98, float* %100, align 4
  br label %fusion.55.in_bounds-after
}

define void @select_and_scatter_337(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %select_return_buffer = alloca i8, align 1
  %select-and-scatter.337.inner.invar_address.window.3 = alloca i32, align 4
  %select-and-scatter.337.inner.invar_address.window.2 = alloca i32, align 4
  %select-and-scatter.337.inner.invar_address.window.1 = alloca i32, align 4
  %select-and-scatter.337.inner.invar_address.window.0 = alloca i32, align 4
  %initialized_flag_address = alloca i1, align 1
  %selected_index_address = alloca i32, i32 4, align 4
  %selected_value_address = alloca float, align 4
  %select-and-scatter.337.raw = getelementptr inbounds i8, i8* %temp_buf, i64 960495616
  %select-and-scatter.337.typed = bitcast i8* %select-and-scatter.337.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %get-tuple-element.79.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %get-tuple-element.79.typed = bitcast i8* %get-tuple-element.79.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %get-tuple-element.74.raw = getelementptr inbounds i8, i8* %temp_buf, i64 150765632
  %get-tuple-element.74.typed = bitcast i8* %get-tuple-element.74.raw to [1024 x [64 x [10 x [10 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 6553600
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 10
  %5 = udiv i32 %linear_index, 10
  %6 = urem i32 %5, 10
  %7 = udiv i32 %linear_index, 100
  %8 = urem i32 %7, 64
  %9 = udiv i32 %linear_index, 6400
  %10 = icmp ult i32 %linear_index, 6553600
  br i1 %10, label %select-and-scatter.337.in_bounds-true, label %select-and-scatter.337.in_bounds-after

select-and-scatter.337.in_bounds-after:           ; preds = %select-and-scatter.337.inner.loop_exit.window.0, %entry
  ret void

select-and-scatter.337.in_bounds-true:            ; preds = %entry
  store i1 false, i1* %initialized_flag_address, align 1
  store i32 0, i32* %select-and-scatter.337.inner.invar_address.window.0, align 4
  br label %select-and-scatter.337.inner.loop_header.window.0

select-and-scatter.337.inner.loop_header.window.0: ; preds = %select-and-scatter.337.inner.loop_exit.window.1, %select-and-scatter.337.in_bounds-true
  %select-and-scatter.337.inner.indvar.window.0 = load i32, i32* %select-and-scatter.337.inner.invar_address.window.0, align 4
  %11 = icmp uge i32 %select-and-scatter.337.inner.indvar.window.0, 1
  br i1 %11, label %select-and-scatter.337.inner.loop_exit.window.0, label %select-and-scatter.337.inner.loop_body.window.0

select-and-scatter.337.inner.loop_body.window.0:  ; preds = %select-and-scatter.337.inner.loop_header.window.0
  store i32 0, i32* %select-and-scatter.337.inner.invar_address.window.1, align 4
  br label %select-and-scatter.337.inner.loop_header.window.1

select-and-scatter.337.inner.loop_header.window.1: ; preds = %select-and-scatter.337.inner.loop_exit.window.2, %select-and-scatter.337.inner.loop_body.window.0
  %select-and-scatter.337.inner.indvar.window.1 = load i32, i32* %select-and-scatter.337.inner.invar_address.window.1, align 4
  %12 = icmp uge i32 %select-and-scatter.337.inner.indvar.window.1, 1
  br i1 %12, label %select-and-scatter.337.inner.loop_exit.window.1, label %select-and-scatter.337.inner.loop_body.window.1

select-and-scatter.337.inner.loop_body.window.1:  ; preds = %select-and-scatter.337.inner.loop_header.window.1
  store i32 0, i32* %select-and-scatter.337.inner.invar_address.window.2, align 4
  br label %select-and-scatter.337.inner.loop_header.window.2

select-and-scatter.337.inner.loop_header.window.2: ; preds = %select-and-scatter.337.inner.loop_exit.window.3, %select-and-scatter.337.inner.loop_body.window.1
  %select-and-scatter.337.inner.indvar.window.2 = load i32, i32* %select-and-scatter.337.inner.invar_address.window.2, align 4
  %13 = icmp uge i32 %select-and-scatter.337.inner.indvar.window.2, 2
  br i1 %13, label %select-and-scatter.337.inner.loop_exit.window.2, label %select-and-scatter.337.inner.loop_body.window.2

select-and-scatter.337.inner.loop_body.window.2:  ; preds = %select-and-scatter.337.inner.loop_header.window.2
  store i32 0, i32* %select-and-scatter.337.inner.invar_address.window.3, align 4
  br label %select-and-scatter.337.inner.loop_header.window.3

select-and-scatter.337.inner.loop_header.window.3: ; preds = %in-bounds-after, %select-and-scatter.337.inner.loop_body.window.2
  %select-and-scatter.337.inner.indvar.window.3 = load i32, i32* %select-and-scatter.337.inner.invar_address.window.3, align 4
  %14 = icmp uge i32 %select-and-scatter.337.inner.indvar.window.3, 2
  br i1 %14, label %select-and-scatter.337.inner.loop_exit.window.3, label %select-and-scatter.337.inner.loop_body.window.3

select-and-scatter.337.inner.loop_body.window.3:  ; preds = %select-and-scatter.337.inner.loop_header.window.3
  %15 = mul nsw i32 %9, 1
  %16 = add nsw i32 %15, %select-and-scatter.337.inner.indvar.window.0
  %17 = sub nsw i32 %16, 0
  %18 = icmp ult i32 %17, 1024
  %19 = and i1 true, %18
  %20 = mul nsw i32 %8, 1
  %21 = add nsw i32 %20, %select-and-scatter.337.inner.indvar.window.1
  %22 = sub nsw i32 %21, 0
  %23 = icmp ult i32 %22, 64
  %24 = and i1 %19, %23
  %25 = mul nsw i32 %6, 2
  %26 = add nsw i32 %25, %select-and-scatter.337.inner.indvar.window.2
  %27 = sub nsw i32 %26, 0
  %28 = icmp ult i32 %27, 20
  %29 = and i1 %24, %28
  %30 = mul nsw i32 %4, 2
  %31 = add nsw i32 %30, %select-and-scatter.337.inner.indvar.window.3
  %32 = sub nsw i32 %31, 0
  %33 = icmp ult i32 %32, 20
  %34 = and i1 %29, %33
  br i1 %34, label %in-bounds-true, label %in-bounds-false

in-bounds-after:                                  ; preds = %in-bounds-false, %initialized-after
  %invar.inc3 = add nuw nsw i32 %select-and-scatter.337.inner.indvar.window.3, 1
  store i32 %invar.inc3, i32* %select-and-scatter.337.inner.invar_address.window.3, align 4
  br label %select-and-scatter.337.inner.loop_header.window.3

select-and-scatter.337.inner.loop_exit.window.3:  ; preds = %select-and-scatter.337.inner.loop_header.window.3
  %invar.inc2 = add nuw nsw i32 %select-and-scatter.337.inner.indvar.window.2, 1
  store i32 %invar.inc2, i32* %select-and-scatter.337.inner.invar_address.window.2, align 4
  br label %select-and-scatter.337.inner.loop_header.window.2

select-and-scatter.337.inner.loop_exit.window.2:  ; preds = %select-and-scatter.337.inner.loop_header.window.2
  %invar.inc1 = add nuw nsw i32 %select-and-scatter.337.inner.indvar.window.1, 1
  store i32 %invar.inc1, i32* %select-and-scatter.337.inner.invar_address.window.1, align 4
  br label %select-and-scatter.337.inner.loop_header.window.1

select-and-scatter.337.inner.loop_exit.window.1:  ; preds = %select-and-scatter.337.inner.loop_header.window.1
  %invar.inc = add nuw nsw i32 %select-and-scatter.337.inner.indvar.window.0, 1
  store i32 %invar.inc, i32* %select-and-scatter.337.inner.invar_address.window.0, align 4
  br label %select-and-scatter.337.inner.loop_header.window.0

select-and-scatter.337.inner.loop_exit.window.0:  ; preds = %select-and-scatter.337.inner.loop_header.window.0
  %35 = getelementptr inbounds i32, i32* %selected_index_address, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr inbounds i32, i32* %selected_index_address, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds i32, i32* %selected_index_address, i32 2
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds i32, i32* %selected_index_address, i32 3
  %42 = load i32, i32* %41, align 4
  %43 = bitcast [1024 x [64 x [10 x [10 x float]]]]* %get-tuple-element.74.typed to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index
  %45 = getelementptr inbounds [1024 x [64 x [20 x [20 x float]]]], [1024 x [64 x [20 x [20 x float]]]]* %select-and-scatter.337.typed, i32 0, i32 %36, i32 %38, i32 %40, i32 %42
  %source = load float, float* %44, align 4
  %46 = atomicrmw fadd float* %45, float %source seq_cst
  br label %select-and-scatter.337.in_bounds-after

in-bounds-true:                                   ; preds = %select-and-scatter.337.inner.loop_body.window.3
  %47 = load i1, i1* %initialized_flag_address, align 1
  br i1 %47, label %initialized-true, label %initialized-false

initialized-after:                                ; preds = %initialized-false, %if-select-lhs-after
  br label %in-bounds-after

in-bounds-false:                                  ; preds = %select-and-scatter.337.inner.loop_body.window.3
  br label %in-bounds-after

initialized-true:                                 ; preds = %in-bounds-true
  %48 = getelementptr inbounds [1024 x [64 x [20 x [20 x float]]]], [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed, i32 0, i32 %17, i32 %22, i32 %27, i32 %32
  call void @ge_F32_329(float* %selected_value_address, float* %48, i8* %select_return_buffer)
  %49 = load i8, i8* %select_return_buffer, align 1
  %boolean_predicate = icmp ne i8 %49, 0
  br i1 %boolean_predicate, label %if-select-lhs-true, label %if-select-lhs-false

if-select-lhs-after:                              ; preds = %if-select-lhs-false, %if-select-lhs-true
  br label %initialized-after

initialized-false:                                ; preds = %in-bounds-true
  %50 = getelementptr inbounds [1024 x [64 x [20 x [20 x float]]]], [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed, i32 0, i32 %17, i32 %22, i32 %27, i32 %32
  %51 = load float, float* %50, align 4, !invariant.load !65
  store float %51, float* %selected_value_address, align 4
  %52 = getelementptr inbounds i32, i32* %selected_index_address, i32 0
  store i32 %17, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %selected_index_address, i32 1
  store i32 %22, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %selected_index_address, i32 2
  store i32 %27, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %selected_index_address, i32 3
  store i32 %32, i32* %55, align 4
  store i1 true, i1* %initialized_flag_address, align 1
  br label %initialized-after

if-select-lhs-true:                               ; preds = %initialized-true
  br label %if-select-lhs-after

if-select-lhs-false:                              ; preds = %initialized-true
  %56 = load float, float* %48, align 4
  store float %56, float* %selected_value_address, align 4
  %57 = getelementptr inbounds i32, i32* %selected_index_address, i32 0
  store i32 %17, i32* %57, align 4
  %58 = getelementptr inbounds i32, i32* %selected_index_address, i32 1
  store i32 %22, i32* %58, align 4
  %59 = getelementptr inbounds i32, i32* %selected_index_address, i32 2
  store i32 %27, i32* %59, align 4
  %60 = getelementptr inbounds i32, i32* %selected_index_address, i32 3
  store i32 %32, i32* %60, align 4
  br label %if-select-lhs-after
}

define internal void @ge_F32_329(float* dereferenceable(4) %lhs.330.typed, float* dereferenceable(4) %rhs.331.typed, i8* dereferenceable(1) %output_arg) {
entry:
  %compare.332.typed = alloca i8, align 1
  %0 = load float, float* %lhs.330.typed, align 4
  %1 = load float, float* %rhs.331.typed, align 4
  %compare.332 = fcmp oge float %0, %1
  %2 = zext i1 %compare.332 to i8
  store i8 %2, i8* %compare.332.typed, align 1
  %load_ret_value = load i8, i8* %compare.332.typed, align 1
  store i8 %load_ret_value, i8* %output_arg, align 1
  ret void
}

define void @fusion_35(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %loop.invar_address = alloca i32, align 4
  %fusion.35.raw = getelementptr inbounds i8, i8* %temp_buf, i64 960495616
  %fusion.35.typed = bitcast i8* %fusion.35.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %select-and-scatter.337.raw = getelementptr inbounds i8, i8* %temp_buf, i64 960495616
  %select-and-scatter.337.typed = bitcast i8* %select-and-scatter.337.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %get-tuple-element.79.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %get-tuple-element.79.typed = bitcast i8* %get-tuple-element.79.raw to [1024 x [64 x [20 x [20 x float]]]]*
  store i32 0, i32* %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion.35.in_bounds-after, %entry
  %loop.indvar = load i32, i32* %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 26214400
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, i32* %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index_plus_base, 20
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index_plus_base, 400
  %10 = urem i32 %9, 64
  %11 = udiv i32 %linear_index_plus_base, 25600
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 20
  %14 = udiv i32 %linear_index1, 20
  %15 = urem i32 %14, 20
  %16 = udiv i32 %linear_index1, 400
  %17 = urem i32 %16, 64
  %18 = udiv i32 %linear_index1, 25600
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 20
  %21 = udiv i32 %linear_index2, 20
  %22 = urem i32 %21, 20
  %23 = udiv i32 %linear_index2, 400
  %24 = urem i32 %23, 64
  %25 = udiv i32 %linear_index2, 25600
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 20
  %28 = udiv i32 %linear_index3, 20
  %29 = urem i32 %28, 20
  %30 = udiv i32 %linear_index3, 400
  %31 = urem i32 %30, 64
  %32 = udiv i32 %linear_index3, 25600
  %33 = icmp ult i32 %linear_index_plus_base, 26214400
  br i1 %33, label %fusion.35.in_bounds-true, label %fusion.35.in_bounds-after

fusion.35.in_bounds-after:                        ; preds = %fusion.35.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !84

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion.35.in_bounds-true:                         ; preds = %loop.loop_body
  %34 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed to float*
  %param_1.110 = getelementptr inbounds float, float* %34, i32 %linear_index_plus_base
  %param_1.1104 = load float, float* %param_1.110, align 4, !invariant.load !65
  %35 = load float, float* bitcast ([4 x i8]* @93 to float*), align 4
  %compare.1 = fcmp ogt float %param_1.1104, %35
  %36 = zext i1 %compare.1 to i8
  %37 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %select-and-scatter.337.typed to float*
  %param_0.50 = getelementptr inbounds float, float* %37, i32 %linear_index_plus_base
  %param_0.505 = load float, float* %param_0.50, align 4
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, float %param_0.505, float %35
  %40 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %41 = getelementptr inbounds float, float* %40, i32 %linear_index_plus_base
  store float %39, float* %41, align 4
  %42 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed to float*
  %param_1.1106 = getelementptr inbounds float, float* %42, i32 %linear_index1
  %param_1.1107 = load float, float* %param_1.1106, align 4, !invariant.load !65
  %43 = load float, float* bitcast ([4 x i8]* @94 to float*), align 4
  %compare.18 = fcmp ogt float %param_1.1107, %43
  %44 = zext i1 %compare.18 to i8
  %45 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %select-and-scatter.337.typed to float*
  %param_0.509 = getelementptr inbounds float, float* %45, i32 %linear_index1
  %param_0.5010 = load float, float* %param_0.509, align 4
  %46 = trunc i8 %44 to i1
  %47 = select i1 %46, float %param_0.5010, float %43
  %48 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %49 = getelementptr inbounds float, float* %48, i32 %linear_index1
  store float %47, float* %49, align 4
  %50 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed to float*
  %param_1.11011 = getelementptr inbounds float, float* %50, i32 %linear_index2
  %param_1.11012 = load float, float* %param_1.11011, align 4, !invariant.load !65
  %51 = load float, float* bitcast ([4 x i8]* @95 to float*), align 4
  %compare.113 = fcmp ogt float %param_1.11012, %51
  %52 = zext i1 %compare.113 to i8
  %53 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %select-and-scatter.337.typed to float*
  %param_0.5014 = getelementptr inbounds float, float* %53, i32 %linear_index2
  %param_0.5015 = load float, float* %param_0.5014, align 4
  %54 = trunc i8 %52 to i1
  %55 = select i1 %54, float %param_0.5015, float %51
  %56 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %57 = getelementptr inbounds float, float* %56, i32 %linear_index2
  store float %55, float* %57, align 4
  %58 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %get-tuple-element.79.typed to float*
  %param_1.11016 = getelementptr inbounds float, float* %58, i32 %linear_index3
  %param_1.11017 = load float, float* %param_1.11016, align 4, !invariant.load !65
  %59 = load float, float* bitcast ([4 x i8]* @96 to float*), align 4
  %compare.118 = fcmp ogt float %param_1.11017, %59
  %60 = zext i1 %compare.118 to i8
  %61 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %select-and-scatter.337.typed to float*
  %param_0.5019 = getelementptr inbounds float, float* %61, i32 %linear_index3
  %param_0.5020 = load float, float* %param_0.5019, align 4
  %62 = trunc i8 %60 to i1
  %63 = select i1 %62, float %param_0.5020, float %59
  %64 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %65 = getelementptr inbounds float, float* %64, i32 %linear_index3
  store float %63, float* %65, align 4
  br label %fusion.35.in_bounds-after
}

define void @fusion_25(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %result_from_other_lane82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %result_from_other_lane78 = alloca float, align 4
  %result_from_other_lane76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %result_from_other_lane72 = alloca float, align 4
  %result_from_other_lane70 = alloca float, align 4
  %result_from_other_lane68 = alloca float, align 4
  %result_from_other_lane66 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %output_y_in_tile.invar_address = alloca i32, align 4
  %loop_z.invar_address = alloca i32, align 4
  %partial_reduction_result.0 = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %fusion.25.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.25.typed = bitcast i8* %fusion.25.raw to [64 x float]*
  %fusion.35.raw = getelementptr inbounds i8, i8* %temp_buf, i64 960495616
  %fusion.35.typed = bitcast i8* %fusion.35.raw to [1024 x [64 x [20 x [20 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !64
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %2 = load float, float* bitcast ([4 x i8]* @97 to float*), align 4
  %3 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  store float %2, float* %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !85
  %thread_id.x = urem i32 %4, 64
  %thread_id.y = udiv i32 %4, 64
  %lane_id = urem i32 %4, 32
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %6 = udiv i32 %5, 1
  %7 = urem i32 %6, 1
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %5, 64
  %block_origin.z = mul i32 %10, 8
  %11 = icmp eq i32 %9, 63
  %tile_bound = select i1 %11, i32 1, i32 1
  %12 = icmp eq i32 %7, 0
  %tile_bound1 = select i1 %12, i32 400, i32 512
  %tile_origin.1 = mul i32 %9, 1
  %tile_origin.2 = mul i32 %7, 512
  %13 = udiv i32 %block_origin.z, 8
  %14 = icmp eq i32 127, %13
  %15 = select i1 %14, i32 8, i32 8
  store i32 0, i32* %loop_z.invar_address, align 4
  br label %loop_z.loop_header

loop_z.loop_header:                               ; preds = %output_y_in_tile.loop_exit, %reduce-group-0-true
  %loop_z.indvar = load i32, i32* %loop_z.invar_address, align 4
  %16 = icmp uge i32 %loop_z.indvar, %15
  br i1 %16, label %loop_z.loop_exit, label %loop_z.loop_body

loop_z.loop_body:                                 ; preds = %loop_z.loop_header
  %invar.inc = add nuw nsw i32 %loop_z.indvar, 1
  store i32 %invar.inc, i32* %loop_z.invar_address, align 4
  %17 = icmp eq i32 %loop_z.indvar, 0
  %18 = add i32 %block_origin.z, %loop_z.indvar
  %19 = mul i32 %thread_id.x, 2
  %20 = add i32 %tile_origin.2, %19
  %21 = sub i32 %tile_bound, %thread_id.y
  %22 = add i32 %21, 1
  %23 = add i32 %22, -1
  %24 = udiv i32 %23, 1
  store i32 0, i32* %output_y_in_tile.invar_address, align 4
  br label %output_y_in_tile.loop_header

output_y_in_tile.loop_header:                     ; preds = %output_is_full_tile-after, %loop_z.loop_body
  %output_y_in_tile.indvar = load i32, i32* %output_y_in_tile.invar_address, align 4
  %25 = icmp uge i32 %output_y_in_tile.indvar, %24
  br i1 %25, label %output_y_in_tile.loop_exit, label %output_y_in_tile.loop_body

output_y_in_tile.loop_body:                       ; preds = %output_y_in_tile.loop_header
  %invar.inc2 = add nuw nsw i32 %output_y_in_tile.indvar, 1
  store i32 %invar.inc2, i32* %output_y_in_tile.invar_address, align 4
  %26 = icmp eq i32 %output_y_in_tile.indvar, 0
  %27 = mul i32 %output_y_in_tile.indvar, 1
  %28 = add i32 %thread_id.y, %27
  %29 = icmp eq i32 512, %tile_bound1
  br i1 %29, label %output_is_full_tile-true, label %output_is_full_tile-false

output_is_full_tile-after:                        ; preds = %output_x_in_tile-after60, %output_is_full_tile-true
  br label %output_y_in_tile.loop_header, !llvm.loop !87

output_y_in_tile.loop_exit:                       ; preds = %output_y_in_tile.loop_header
  br label %loop_z.loop_header, !llvm.loop !88

loop_z.loop_exit:                                 ; preds = %loop_z.loop_header
  %30 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !85
  %thread_id.x63 = urem i32 %30, 64
  %thread_id.y64 = udiv i32 %30, 64
  %lane_id65 = urem i32 %30, 32
  %31 = mul i32 %thread_id.x63, 2
  %32 = add i32 %tile_origin.1, %thread_id.y64
  %33 = add i32 %tile_origin.2, %31
  %34 = add i32 %33, 0
  %35 = udiv i32 %32, 1
  %output_element_address = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %35
  %current_output = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  %partial_reduction_result = load float, float* %current_output, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result, i32 16, i32 31)
  store float %36, float* %result_from_other_lane, align 4
  call void @add_float__344(float* %current_output, float* %result_from_other_lane, float* %current_output)
  %partial_reduction_result67 = load float, float* %current_output, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 8, i32 31)
  store float %37, float* %result_from_other_lane66, align 4
  call void @add_float__344(float* %current_output, float* %result_from_other_lane66, float* %current_output)
  %partial_reduction_result69 = load float, float* %current_output, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result69, i32 4, i32 31)
  store float %38, float* %result_from_other_lane68, align 4
  call void @add_float__344(float* %current_output, float* %result_from_other_lane68, float* %current_output)
  %partial_reduction_result71 = load float, float* %current_output, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 2, i32 31)
  store float %39, float* %result_from_other_lane70, align 4
  call void @add_float__344(float* %current_output, float* %result_from_other_lane70, float* %current_output)
  %partial_reduction_result73 = load float, float* %current_output, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result73, i32 1, i32 31)
  store float %40, float* %result_from_other_lane72, align 4
  call void @add_float__344(float* %current_output, float* %result_from_other_lane72, float* %current_output)
  %41 = udiv i32 %thread_id.x63, 32
  %42 = icmp eq i32 %lane_id65, 0
  br i1 %42, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %loop_z.loop_exit
  call void @llvm.nvvm.barrier0()
  %43 = icmp eq i32 %41, 0
  br i1 %43, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_atomic_update-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

output_is_full_tile-true:                         ; preds = %output_y_in_tile.loop_body
  %44 = add i32 %tile_origin.1, %28
  %x_loc = add i32 0, %19
  %45 = add i32 %20, 0
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %44, 400
  %49 = add nuw nsw i32 %47, %48
  %50 = mul nuw nsw i32 %18, 25600
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 1
  %53 = urem i32 %52, 400
  %54 = udiv i32 %51, 400
  %55 = urem i32 %54, 64
  %56 = udiv i32 %51, 25600
  %57 = mul nuw nsw i32 %53, 1
  %58 = add nuw nsw i32 0, %57
  %59 = urem i32 %58, 20
  %60 = udiv i32 %58, 20
  %61 = udiv i32 %60, 20
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 64
  %65 = mul nuw nsw i32 %56, 1
  %66 = add nuw nsw i32 0, %65
  %67 = udiv i32 %66, 1024
  %68 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.82 = getelementptr inbounds float, float* %68, i32 %51
  %param_0.823 = load float, float* %param_0.82, align 4, !invariant.load !65
  store float %param_0.823, float* %reduction_input_address, align 4
  %69 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %69, float* %reduction_input_address, float* %69)
  %x_loc4 = add i32 1, %19
  %70 = add i32 %20, 1
  %71 = mul nuw nsw i32 %70, 1
  %72 = add nuw nsw i32 0, %71
  %73 = mul nuw nsw i32 %44, 400
  %74 = add nuw nsw i32 %72, %73
  %75 = mul nuw nsw i32 %18, 25600
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 400
  %79 = udiv i32 %76, 400
  %80 = urem i32 %79, 64
  %81 = udiv i32 %76, 25600
  %82 = mul nuw nsw i32 %78, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 20
  %85 = udiv i32 %83, 20
  %86 = udiv i32 %85, 20
  %87 = mul nuw nsw i32 %80, 1
  %88 = add nuw nsw i32 0, %87
  %89 = udiv i32 %88, 64
  %90 = mul nuw nsw i32 %81, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 1024
  %93 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.825 = getelementptr inbounds float, float* %93, i32 %76
  %param_0.826 = load float, float* %param_0.825, align 4, !invariant.load !65
  store float %param_0.826, float* %reduction_input_address, align 4
  %94 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %94, float* %reduction_input_address, float* %94)
  %x_loc7 = add i32 128, %19
  %95 = add i32 %20, 128
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %44, 400
  %99 = add nuw nsw i32 %97, %98
  %100 = mul nuw nsw i32 %18, 25600
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 400
  %104 = udiv i32 %101, 400
  %105 = urem i32 %104, 64
  %106 = udiv i32 %101, 25600
  %107 = mul nuw nsw i32 %103, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 20
  %110 = udiv i32 %108, 20
  %111 = udiv i32 %110, 20
  %112 = mul nuw nsw i32 %105, 1
  %113 = add nuw nsw i32 0, %112
  %114 = udiv i32 %113, 64
  %115 = mul nuw nsw i32 %106, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 1024
  %118 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.828 = getelementptr inbounds float, float* %118, i32 %101
  %param_0.829 = load float, float* %param_0.828, align 4, !invariant.load !65
  store float %param_0.829, float* %reduction_input_address, align 4
  %119 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %119, float* %reduction_input_address, float* %119)
  %x_loc10 = add i32 129, %19
  %120 = add i32 %20, 129
  %121 = mul nuw nsw i32 %120, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %44, 400
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %18, 25600
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 400
  %129 = udiv i32 %126, 400
  %130 = urem i32 %129, 64
  %131 = udiv i32 %126, 25600
  %132 = mul nuw nsw i32 %128, 1
  %133 = add nuw nsw i32 0, %132
  %134 = urem i32 %133, 20
  %135 = udiv i32 %133, 20
  %136 = udiv i32 %135, 20
  %137 = mul nuw nsw i32 %130, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 64
  %140 = mul nuw nsw i32 %131, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 1024
  %143 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8211 = getelementptr inbounds float, float* %143, i32 %126
  %param_0.8212 = load float, float* %param_0.8211, align 4, !invariant.load !65
  store float %param_0.8212, float* %reduction_input_address, align 4
  %144 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %144, float* %reduction_input_address, float* %144)
  %x_loc13 = add i32 256, %19
  %145 = add i32 %20, 256
  %146 = mul nuw nsw i32 %145, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %44, 400
  %149 = add nuw nsw i32 %147, %148
  %150 = mul nuw nsw i32 %18, 25600
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 400
  %154 = udiv i32 %151, 400
  %155 = urem i32 %154, 64
  %156 = udiv i32 %151, 25600
  %157 = mul nuw nsw i32 %153, 1
  %158 = add nuw nsw i32 0, %157
  %159 = urem i32 %158, 20
  %160 = udiv i32 %158, 20
  %161 = udiv i32 %160, 20
  %162 = mul nuw nsw i32 %155, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 64
  %165 = mul nuw nsw i32 %156, 1
  %166 = add nuw nsw i32 0, %165
  %167 = udiv i32 %166, 1024
  %168 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8214 = getelementptr inbounds float, float* %168, i32 %151
  %param_0.8215 = load float, float* %param_0.8214, align 4, !invariant.load !65
  store float %param_0.8215, float* %reduction_input_address, align 4
  %169 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %169, float* %reduction_input_address, float* %169)
  %x_loc16 = add i32 257, %19
  %170 = add i32 %20, 257
  %171 = mul nuw nsw i32 %170, 1
  %172 = add nuw nsw i32 0, %171
  %173 = mul nuw nsw i32 %44, 400
  %174 = add nuw nsw i32 %172, %173
  %175 = mul nuw nsw i32 %18, 25600
  %176 = add nuw nsw i32 %174, %175
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 400
  %179 = udiv i32 %176, 400
  %180 = urem i32 %179, 64
  %181 = udiv i32 %176, 25600
  %182 = mul nuw nsw i32 %178, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 20
  %185 = udiv i32 %183, 20
  %186 = udiv i32 %185, 20
  %187 = mul nuw nsw i32 %180, 1
  %188 = add nuw nsw i32 0, %187
  %189 = udiv i32 %188, 64
  %190 = mul nuw nsw i32 %181, 1
  %191 = add nuw nsw i32 0, %190
  %192 = udiv i32 %191, 1024
  %193 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8217 = getelementptr inbounds float, float* %193, i32 %176
  %param_0.8218 = load float, float* %param_0.8217, align 4, !invariant.load !65
  store float %param_0.8218, float* %reduction_input_address, align 4
  %194 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %194, float* %reduction_input_address, float* %194)
  %x_loc19 = add i32 384, %19
  %195 = add i32 %20, 384
  %196 = mul nuw nsw i32 %195, 1
  %197 = add nuw nsw i32 0, %196
  %198 = mul nuw nsw i32 %44, 400
  %199 = add nuw nsw i32 %197, %198
  %200 = mul nuw nsw i32 %18, 25600
  %201 = add nuw nsw i32 %199, %200
  %202 = udiv i32 %201, 1
  %203 = urem i32 %202, 400
  %204 = udiv i32 %201, 400
  %205 = urem i32 %204, 64
  %206 = udiv i32 %201, 25600
  %207 = mul nuw nsw i32 %203, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 20
  %210 = udiv i32 %208, 20
  %211 = udiv i32 %210, 20
  %212 = mul nuw nsw i32 %205, 1
  %213 = add nuw nsw i32 0, %212
  %214 = udiv i32 %213, 64
  %215 = mul nuw nsw i32 %206, 1
  %216 = add nuw nsw i32 0, %215
  %217 = udiv i32 %216, 1024
  %218 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8220 = getelementptr inbounds float, float* %218, i32 %201
  %param_0.8221 = load float, float* %param_0.8220, align 4, !invariant.load !65
  store float %param_0.8221, float* %reduction_input_address, align 4
  %219 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %219, float* %reduction_input_address, float* %219)
  %x_loc22 = add i32 385, %19
  %220 = add i32 %20, 385
  %221 = mul nuw nsw i32 %220, 1
  %222 = add nuw nsw i32 0, %221
  %223 = mul nuw nsw i32 %44, 400
  %224 = add nuw nsw i32 %222, %223
  %225 = mul nuw nsw i32 %18, 25600
  %226 = add nuw nsw i32 %224, %225
  %227 = udiv i32 %226, 1
  %228 = urem i32 %227, 400
  %229 = udiv i32 %226, 400
  %230 = urem i32 %229, 64
  %231 = udiv i32 %226, 25600
  %232 = mul nuw nsw i32 %228, 1
  %233 = add nuw nsw i32 0, %232
  %234 = urem i32 %233, 20
  %235 = udiv i32 %233, 20
  %236 = udiv i32 %235, 20
  %237 = mul nuw nsw i32 %230, 1
  %238 = add nuw nsw i32 0, %237
  %239 = udiv i32 %238, 64
  %240 = mul nuw nsw i32 %231, 1
  %241 = add nuw nsw i32 0, %240
  %242 = udiv i32 %241, 1024
  %243 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8223 = getelementptr inbounds float, float* %243, i32 %226
  %param_0.8224 = load float, float* %param_0.8223, align 4, !invariant.load !65
  store float %param_0.8224, float* %reduction_input_address, align 4
  %244 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %244, float* %reduction_input_address, float* %244)
  br label %output_is_full_tile-after

output_is_full_tile-false:                        ; preds = %output_y_in_tile.loop_body
  %245 = add i32 %tile_origin.1, %28
  %x_loc25 = add i32 0, %19
  %246 = add i32 %20, 0
  %247 = icmp ult i32 %x_loc25, %tile_bound1
  br i1 %247, label %output_x_in_tile-true, label %output_x_in_tile-after

output_x_in_tile-after:                           ; preds = %output_x_in_tile-true, %output_is_full_tile-false
  %x_loc28 = add i32 1, %19
  %248 = add i32 %20, 1
  %249 = icmp ult i32 %x_loc28, %tile_bound1
  br i1 %249, label %output_x_in_tile-true29, label %output_x_in_tile-after30

output_x_in_tile-after30:                         ; preds = %output_x_in_tile-true29, %output_x_in_tile-after
  %x_loc33 = add i32 128, %19
  %250 = add i32 %20, 128
  %251 = icmp ult i32 %x_loc33, %tile_bound1
  br i1 %251, label %output_x_in_tile-true34, label %output_x_in_tile-after35

output_x_in_tile-after35:                         ; preds = %output_x_in_tile-true34, %output_x_in_tile-after30
  %x_loc38 = add i32 129, %19
  %252 = add i32 %20, 129
  %253 = icmp ult i32 %x_loc38, %tile_bound1
  br i1 %253, label %output_x_in_tile-true39, label %output_x_in_tile-after40

output_x_in_tile-after40:                         ; preds = %output_x_in_tile-true39, %output_x_in_tile-after35
  %x_loc43 = add i32 256, %19
  %254 = add i32 %20, 256
  %255 = icmp ult i32 %x_loc43, %tile_bound1
  br i1 %255, label %output_x_in_tile-true44, label %output_x_in_tile-after45

output_x_in_tile-after45:                         ; preds = %output_x_in_tile-true44, %output_x_in_tile-after40
  %x_loc48 = add i32 257, %19
  %256 = add i32 %20, 257
  %257 = icmp ult i32 %x_loc48, %tile_bound1
  br i1 %257, label %output_x_in_tile-true49, label %output_x_in_tile-after50

output_x_in_tile-after50:                         ; preds = %output_x_in_tile-true49, %output_x_in_tile-after45
  %x_loc53 = add i32 384, %19
  %258 = add i32 %20, 384
  %259 = icmp ult i32 %x_loc53, %tile_bound1
  br i1 %259, label %output_x_in_tile-true54, label %output_x_in_tile-after55

output_x_in_tile-after55:                         ; preds = %output_x_in_tile-true54, %output_x_in_tile-after50
  %x_loc58 = add i32 385, %19
  %260 = add i32 %20, 385
  %261 = icmp ult i32 %x_loc58, %tile_bound1
  br i1 %261, label %output_x_in_tile-true59, label %output_x_in_tile-after60

output_x_in_tile-after60:                         ; preds = %output_x_in_tile-true59, %output_x_in_tile-after55
  br label %output_is_full_tile-after

output_x_in_tile-true:                            ; preds = %output_is_full_tile-false
  %262 = mul nuw nsw i32 %246, 1
  %263 = add nuw nsw i32 0, %262
  %264 = mul nuw nsw i32 %245, 400
  %265 = add nuw nsw i32 %263, %264
  %266 = mul nuw nsw i32 %18, 25600
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 1
  %269 = urem i32 %268, 400
  %270 = udiv i32 %267, 400
  %271 = urem i32 %270, 64
  %272 = udiv i32 %267, 25600
  %273 = mul nuw nsw i32 %269, 1
  %274 = add nuw nsw i32 0, %273
  %275 = urem i32 %274, 20
  %276 = udiv i32 %274, 20
  %277 = udiv i32 %276, 20
  %278 = mul nuw nsw i32 %271, 1
  %279 = add nuw nsw i32 0, %278
  %280 = udiv i32 %279, 64
  %281 = mul nuw nsw i32 %272, 1
  %282 = add nuw nsw i32 0, %281
  %283 = udiv i32 %282, 1024
  %284 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8226 = getelementptr inbounds float, float* %284, i32 %267
  %param_0.8227 = load float, float* %param_0.8226, align 4, !invariant.load !65
  store float %param_0.8227, float* %reduction_input_address, align 4
  %285 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %285, float* %reduction_input_address, float* %285)
  br label %output_x_in_tile-after

output_x_in_tile-true29:                          ; preds = %output_x_in_tile-after
  %286 = mul nuw nsw i32 %248, 1
  %287 = add nuw nsw i32 0, %286
  %288 = mul nuw nsw i32 %245, 400
  %289 = add nuw nsw i32 %287, %288
  %290 = mul nuw nsw i32 %18, 25600
  %291 = add nuw nsw i32 %289, %290
  %292 = udiv i32 %291, 1
  %293 = urem i32 %292, 400
  %294 = udiv i32 %291, 400
  %295 = urem i32 %294, 64
  %296 = udiv i32 %291, 25600
  %297 = mul nuw nsw i32 %293, 1
  %298 = add nuw nsw i32 0, %297
  %299 = urem i32 %298, 20
  %300 = udiv i32 %298, 20
  %301 = udiv i32 %300, 20
  %302 = mul nuw nsw i32 %295, 1
  %303 = add nuw nsw i32 0, %302
  %304 = udiv i32 %303, 64
  %305 = mul nuw nsw i32 %296, 1
  %306 = add nuw nsw i32 0, %305
  %307 = udiv i32 %306, 1024
  %308 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8231 = getelementptr inbounds float, float* %308, i32 %291
  %param_0.8232 = load float, float* %param_0.8231, align 4, !invariant.load !65
  store float %param_0.8232, float* %reduction_input_address, align 4
  %309 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %309, float* %reduction_input_address, float* %309)
  br label %output_x_in_tile-after30

output_x_in_tile-true34:                          ; preds = %output_x_in_tile-after30
  %310 = mul nuw nsw i32 %250, 1
  %311 = add nuw nsw i32 0, %310
  %312 = mul nuw nsw i32 %245, 400
  %313 = add nuw nsw i32 %311, %312
  %314 = mul nuw nsw i32 %18, 25600
  %315 = add nuw nsw i32 %313, %314
  %316 = udiv i32 %315, 1
  %317 = urem i32 %316, 400
  %318 = udiv i32 %315, 400
  %319 = urem i32 %318, 64
  %320 = udiv i32 %315, 25600
  %321 = mul nuw nsw i32 %317, 1
  %322 = add nuw nsw i32 0, %321
  %323 = urem i32 %322, 20
  %324 = udiv i32 %322, 20
  %325 = udiv i32 %324, 20
  %326 = mul nuw nsw i32 %319, 1
  %327 = add nuw nsw i32 0, %326
  %328 = udiv i32 %327, 64
  %329 = mul nuw nsw i32 %320, 1
  %330 = add nuw nsw i32 0, %329
  %331 = udiv i32 %330, 1024
  %332 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8236 = getelementptr inbounds float, float* %332, i32 %315
  %param_0.8237 = load float, float* %param_0.8236, align 4, !invariant.load !65
  store float %param_0.8237, float* %reduction_input_address, align 4
  %333 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %333, float* %reduction_input_address, float* %333)
  br label %output_x_in_tile-after35

output_x_in_tile-true39:                          ; preds = %output_x_in_tile-after35
  %334 = mul nuw nsw i32 %252, 1
  %335 = add nuw nsw i32 0, %334
  %336 = mul nuw nsw i32 %245, 400
  %337 = add nuw nsw i32 %335, %336
  %338 = mul nuw nsw i32 %18, 25600
  %339 = add nuw nsw i32 %337, %338
  %340 = udiv i32 %339, 1
  %341 = urem i32 %340, 400
  %342 = udiv i32 %339, 400
  %343 = urem i32 %342, 64
  %344 = udiv i32 %339, 25600
  %345 = mul nuw nsw i32 %341, 1
  %346 = add nuw nsw i32 0, %345
  %347 = urem i32 %346, 20
  %348 = udiv i32 %346, 20
  %349 = udiv i32 %348, 20
  %350 = mul nuw nsw i32 %343, 1
  %351 = add nuw nsw i32 0, %350
  %352 = udiv i32 %351, 64
  %353 = mul nuw nsw i32 %344, 1
  %354 = add nuw nsw i32 0, %353
  %355 = udiv i32 %354, 1024
  %356 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8241 = getelementptr inbounds float, float* %356, i32 %339
  %param_0.8242 = load float, float* %param_0.8241, align 4, !invariant.load !65
  store float %param_0.8242, float* %reduction_input_address, align 4
  %357 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %357, float* %reduction_input_address, float* %357)
  br label %output_x_in_tile-after40

output_x_in_tile-true44:                          ; preds = %output_x_in_tile-after40
  %358 = mul nuw nsw i32 %254, 1
  %359 = add nuw nsw i32 0, %358
  %360 = mul nuw nsw i32 %245, 400
  %361 = add nuw nsw i32 %359, %360
  %362 = mul nuw nsw i32 %18, 25600
  %363 = add nuw nsw i32 %361, %362
  %364 = udiv i32 %363, 1
  %365 = urem i32 %364, 400
  %366 = udiv i32 %363, 400
  %367 = urem i32 %366, 64
  %368 = udiv i32 %363, 25600
  %369 = mul nuw nsw i32 %365, 1
  %370 = add nuw nsw i32 0, %369
  %371 = urem i32 %370, 20
  %372 = udiv i32 %370, 20
  %373 = udiv i32 %372, 20
  %374 = mul nuw nsw i32 %367, 1
  %375 = add nuw nsw i32 0, %374
  %376 = udiv i32 %375, 64
  %377 = mul nuw nsw i32 %368, 1
  %378 = add nuw nsw i32 0, %377
  %379 = udiv i32 %378, 1024
  %380 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8246 = getelementptr inbounds float, float* %380, i32 %363
  %param_0.8247 = load float, float* %param_0.8246, align 4, !invariant.load !65
  store float %param_0.8247, float* %reduction_input_address, align 4
  %381 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %381, float* %reduction_input_address, float* %381)
  br label %output_x_in_tile-after45

output_x_in_tile-true49:                          ; preds = %output_x_in_tile-after45
  %382 = mul nuw nsw i32 %256, 1
  %383 = add nuw nsw i32 0, %382
  %384 = mul nuw nsw i32 %245, 400
  %385 = add nuw nsw i32 %383, %384
  %386 = mul nuw nsw i32 %18, 25600
  %387 = add nuw nsw i32 %385, %386
  %388 = udiv i32 %387, 1
  %389 = urem i32 %388, 400
  %390 = udiv i32 %387, 400
  %391 = urem i32 %390, 64
  %392 = udiv i32 %387, 25600
  %393 = mul nuw nsw i32 %389, 1
  %394 = add nuw nsw i32 0, %393
  %395 = urem i32 %394, 20
  %396 = udiv i32 %394, 20
  %397 = udiv i32 %396, 20
  %398 = mul nuw nsw i32 %391, 1
  %399 = add nuw nsw i32 0, %398
  %400 = udiv i32 %399, 64
  %401 = mul nuw nsw i32 %392, 1
  %402 = add nuw nsw i32 0, %401
  %403 = udiv i32 %402, 1024
  %404 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8251 = getelementptr inbounds float, float* %404, i32 %387
  %param_0.8252 = load float, float* %param_0.8251, align 4, !invariant.load !65
  store float %param_0.8252, float* %reduction_input_address, align 4
  %405 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %405, float* %reduction_input_address, float* %405)
  br label %output_x_in_tile-after50

output_x_in_tile-true54:                          ; preds = %output_x_in_tile-after50
  %406 = mul nuw nsw i32 %258, 1
  %407 = add nuw nsw i32 0, %406
  %408 = mul nuw nsw i32 %245, 400
  %409 = add nuw nsw i32 %407, %408
  %410 = mul nuw nsw i32 %18, 25600
  %411 = add nuw nsw i32 %409, %410
  %412 = udiv i32 %411, 1
  %413 = urem i32 %412, 400
  %414 = udiv i32 %411, 400
  %415 = urem i32 %414, 64
  %416 = udiv i32 %411, 25600
  %417 = mul nuw nsw i32 %413, 1
  %418 = add nuw nsw i32 0, %417
  %419 = urem i32 %418, 20
  %420 = udiv i32 %418, 20
  %421 = udiv i32 %420, 20
  %422 = mul nuw nsw i32 %415, 1
  %423 = add nuw nsw i32 0, %422
  %424 = udiv i32 %423, 64
  %425 = mul nuw nsw i32 %416, 1
  %426 = add nuw nsw i32 0, %425
  %427 = udiv i32 %426, 1024
  %428 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8256 = getelementptr inbounds float, float* %428, i32 %411
  %param_0.8257 = load float, float* %param_0.8256, align 4, !invariant.load !65
  store float %param_0.8257, float* %reduction_input_address, align 4
  %429 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %429, float* %reduction_input_address, float* %429)
  br label %output_x_in_tile-after55

output_x_in_tile-true59:                          ; preds = %output_x_in_tile-after55
  %430 = mul nuw nsw i32 %260, 1
  %431 = add nuw nsw i32 0, %430
  %432 = mul nuw nsw i32 %245, 400
  %433 = add nuw nsw i32 %431, %432
  %434 = mul nuw nsw i32 %18, 25600
  %435 = add nuw nsw i32 %433, %434
  %436 = udiv i32 %435, 1
  %437 = urem i32 %436, 400
  %438 = udiv i32 %435, 400
  %439 = urem i32 %438, 64
  %440 = udiv i32 %435, 25600
  %441 = mul nuw nsw i32 %437, 1
  %442 = add nuw nsw i32 0, %441
  %443 = urem i32 %442, 20
  %444 = udiv i32 %442, 20
  %445 = udiv i32 %444, 20
  %446 = mul nuw nsw i32 %439, 1
  %447 = add nuw nsw i32 0, %446
  %448 = udiv i32 %447, 64
  %449 = mul nuw nsw i32 %440, 1
  %450 = add nuw nsw i32 0, %449
  %451 = udiv i32 %450, 1024
  %452 = bitcast [1024 x [64 x [20 x [20 x float]]]]* %fusion.35.typed to float*
  %param_0.8261 = getelementptr inbounds float, float* %452, i32 %435
  %param_0.8262 = load float, float* %param_0.8261, align 4, !invariant.load !65
  store float %param_0.8262, float* %reduction_input_address, align 4
  %453 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__344(float* %453, float* %reduction_input_address, float* %453)
  br label %output_x_in_tile-after60

intra_warp_reduce_write-true:                     ; preds = %loop_z.loop_exit
  %454 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_03, i32 0, i32 0, i32 %41
  %455 = addrspacecast float addrspace(3)* %454 to float*
  %456 = load float, float* %current_output, align 4
  store float %456, float* %455, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %457 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_03, i32 0, i32 0, i32 %lane_id65
  %458 = addrspacecast float addrspace(3)* %457 to float*
  store float %2, float* %initial_value_addr, align 4
  %459 = icmp ult i32 %thread_id.x63, 2
  %460 = select i1 %459, float* %458, float* %initial_value_addr
  %partial_reduction_result75 = load float, float* %460, align 4
  %461 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 16, i32 31)
  store float %461, float* %result_from_other_lane74, align 4
  call void @add_float__344(float* %460, float* %result_from_other_lane74, float* %460)
  %partial_reduction_result77 = load float, float* %460, align 4
  %462 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result77, i32 8, i32 31)
  store float %462, float* %result_from_other_lane76, align 4
  call void @add_float__344(float* %460, float* %result_from_other_lane76, float* %460)
  %partial_reduction_result79 = load float, float* %460, align 4
  %463 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 4, i32 31)
  store float %463, float* %result_from_other_lane78, align 4
  call void @add_float__344(float* %460, float* %result_from_other_lane78, float* %460)
  %partial_reduction_result81 = load float, float* %460, align 4
  %464 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 2, i32 31)
  store float %464, float* %result_from_other_lane80, align 4
  call void @add_float__344(float* %460, float* %result_from_other_lane80, float* %460)
  %partial_reduction_result83 = load float, float* %460, align 4
  %465 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 1, i32 31)
  store float %465, float* %result_from_other_lane82, align 4
  call void @add_float__344(float* %460, float* %result_from_other_lane82, float* %460)
  %466 = icmp eq i32 %thread_id.x63, 0
  br i1 %466, label %reduction_atomic_update-true, label %reduction_atomic_update-after

reduction_atomic_update-after:                    ; preds = %reduction_atomic_update-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_atomic_update-true:                     ; preds = %inter_warp_reduce-true
  %source = load float, float* %458, align 4
  %467 = atomicrmw fadd float* %output_element_address, float %source seq_cst
  br label %reduction_atomic_update-after
}

define internal void @add_float__344(float* dereferenceable(4) %x.345.typed, float* dereferenceable(4) %y.346.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.347.typed = alloca float, align 4
  %0 = load float, float* %x.345.typed, align 4
  %1 = load float, float* %y.346.typed, align 4
  %add.347 = fadd float %0, %1
  store float %add.347, float* %add.347.typed, align 4
  %load_ret_value = load float, float* %add.347.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_34(i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %loop.invar_address = alloca i32, align 4
  %fusion.34.raw = getelementptr inbounds i8, i8* %temp_buf, i64 663953408
  %fusion.34.typed = bitcast i8* %fusion.34.raw to [1024 x [32 x [24 x [24 x float]]]]*
  %get-tuple-element.76.raw = getelementptr inbounds i8, i8* %temp_buf, i64 588455936
  %get-tuple-element.76.typed = bitcast i8* %get-tuple-element.76.raw to [1024 x [32 x [24 x [24 x float]]]]*
  %get-tuple-element.78.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1065353216
  %get-tuple-element.78.typed = bitcast i8* %get-tuple-element.78.raw to [1024 x [32 x [24 x [24 x float]]]]*
  store i32 0, i32* %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion.34.in_bounds-after, %entry
  %loop.indvar = load i32, i32* %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 18874368
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, i32* %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 24
  %7 = udiv i32 %linear_index_plus_base, 24
  %8 = urem i32 %7, 24
  %9 = udiv i32 %linear_index_plus_base, 576
  %10 = urem i32 %9, 32
  %11 = udiv i32 %linear_index_plus_base, 18432
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 24
  %14 = udiv i32 %linear_index1, 24
  %15 = urem i32 %14, 24
  %16 = udiv i32 %linear_index1, 576
  %17 = urem i32 %16, 32
  %18 = udiv i32 %linear_index1, 18432
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 24
  %21 = udiv i32 %linear_index2, 24
  %22 = urem i32 %21, 24
  %23 = udiv i32 %linear_index2, 576
  %24 = urem i32 %23, 32
  %25 = udiv i32 %linear_index2, 18432
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 24
  %28 = udiv i32 %linear_index3, 24
  %29 = urem i32 %28, 24
  %30 = udiv i32 %linear_index3, 576
  %31 = urem i32 %30, 32
  %32 = udiv i32 %linear_index3, 18432
  %33 = icmp ult i32 %linear_index_plus_base, 18874368
  br i1 %33, label %fusion.34.in_bounds-true, label %fusion.34.in_bounds-after

fusion.34.in_bounds-after:                        ; preds = %fusion.34.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !89

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion.34.in_bounds-true:                         ; preds = %loop.loop_body
  %34 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.78.typed to float*
  %param_1.107 = getelementptr inbounds float, float* %34, i32 %linear_index_plus_base
  %param_1.1074 = load float, float* %param_1.107, align 4, !invariant.load !65
  %35 = load float, float* bitcast ([4 x i8]* @98 to float*), align 4
  %compare.0 = fcmp ogt float %param_1.1074, %35
  %36 = zext i1 %compare.0 to i8
  %37 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.76.typed to float*
  %param_0.48 = getelementptr inbounds float, float* %37, i32 %linear_index_plus_base
  %param_0.485 = load float, float* %param_0.48, align 4, !invariant.load !65
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, float %param_0.485, float %35
  %40 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %41 = getelementptr inbounds float, float* %40, i32 %linear_index_plus_base
  store float %39, float* %41, align 4
  %42 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.78.typed to float*
  %param_1.1076 = getelementptr inbounds float, float* %42, i32 %linear_index1
  %param_1.1077 = load float, float* %param_1.1076, align 4, !invariant.load !65
  %43 = load float, float* bitcast ([4 x i8]* @99 to float*), align 4
  %compare.08 = fcmp ogt float %param_1.1077, %43
  %44 = zext i1 %compare.08 to i8
  %45 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.76.typed to float*
  %param_0.489 = getelementptr inbounds float, float* %45, i32 %linear_index1
  %param_0.4810 = load float, float* %param_0.489, align 4, !invariant.load !65
  %46 = trunc i8 %44 to i1
  %47 = select i1 %46, float %param_0.4810, float %43
  %48 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %49 = getelementptr inbounds float, float* %48, i32 %linear_index1
  store float %47, float* %49, align 4
  %50 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.78.typed to float*
  %param_1.10711 = getelementptr inbounds float, float* %50, i32 %linear_index2
  %param_1.10712 = load float, float* %param_1.10711, align 4, !invariant.load !65
  %51 = load float, float* bitcast ([4 x i8]* @100 to float*), align 4
  %compare.013 = fcmp ogt float %param_1.10712, %51
  %52 = zext i1 %compare.013 to i8
  %53 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.76.typed to float*
  %param_0.4814 = getelementptr inbounds float, float* %53, i32 %linear_index2
  %param_0.4815 = load float, float* %param_0.4814, align 4, !invariant.load !65
  %54 = trunc i8 %52 to i1
  %55 = select i1 %54, float %param_0.4815, float %51
  %56 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %57 = getelementptr inbounds float, float* %56, i32 %linear_index2
  store float %55, float* %57, align 4
  %58 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.78.typed to float*
  %param_1.10716 = getelementptr inbounds float, float* %58, i32 %linear_index3
  %param_1.10717 = load float, float* %param_1.10716, align 4, !invariant.load !65
  %59 = load float, float* bitcast ([4 x i8]* @101 to float*), align 4
  %compare.018 = fcmp ogt float %param_1.10717, %59
  %60 = zext i1 %compare.018 to i8
  %61 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %get-tuple-element.76.typed to float*
  %param_0.4819 = getelementptr inbounds float, float* %61, i32 %linear_index3
  %param_0.4820 = load float, float* %param_0.4819, align 4, !invariant.load !65
  %62 = trunc i8 %60 to i1
  %63 = select i1 %62, float %param_0.4820, float %59
  %64 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %65 = getelementptr inbounds float, float* %64, i32 %linear_index3
  store float %63, float* %65, align 4
  br label %fusion.34.in_bounds-after
}

define void @fusion_33(i8* noalias align 64 dereferenceable(204800) %alloc15, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %result_from_other_lane82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %result_from_other_lane78 = alloca float, align 4
  %result_from_other_lane76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %result_from_other_lane72 = alloca float, align 4
  %result_from_other_lane70 = alloca float, align 4
  %result_from_other_lane68 = alloca float, align 4
  %result_from_other_lane66 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %output_y_in_tile.invar_address = alloca i32, align 4
  %loop_z.invar_address = alloca i32, align 4
  %partial_reduction_result.0 = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %fusion.33.raw = getelementptr inbounds i8, i8* %alloc15, i64 0
  %fusion.33.typed = bitcast i8* %fusion.33.raw to [32 x float]*
  %fusion.34.raw = getelementptr inbounds i8, i8* %temp_buf, i64 663953408
  %fusion.34.typed = bitcast i8* %fusion.34.raw to [1024 x [32 x [24 x [24 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !64
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %2 = load float, float* bitcast ([4 x i8]* @102 to float*), align 4
  %3 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  store float %2, float* %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !90
  %thread_id.x = urem i32 %4, 96
  %thread_id.y = udiv i32 %4, 96
  %lane_id = urem i32 %4, 32
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %6 = udiv i32 %5, 1
  %7 = urem i32 %6, 1
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 32
  %10 = udiv i32 %5, 32
  %block_origin.z = mul i32 %10, 8
  %11 = icmp eq i32 %9, 31
  %tile_bound = select i1 %11, i32 1, i32 1
  %12 = icmp eq i32 %7, 0
  %tile_bound1 = select i1 %12, i32 576, i32 768
  %tile_origin.1 = mul i32 %9, 1
  %tile_origin.2 = mul i32 %7, 768
  %13 = udiv i32 %block_origin.z, 8
  %14 = icmp eq i32 127, %13
  %15 = select i1 %14, i32 8, i32 8
  store i32 0, i32* %loop_z.invar_address, align 4
  br label %loop_z.loop_header

loop_z.loop_header:                               ; preds = %output_y_in_tile.loop_exit, %reduce-group-0-true
  %loop_z.indvar = load i32, i32* %loop_z.invar_address, align 4
  %16 = icmp uge i32 %loop_z.indvar, %15
  br i1 %16, label %loop_z.loop_exit, label %loop_z.loop_body

loop_z.loop_body:                                 ; preds = %loop_z.loop_header
  %invar.inc = add nuw nsw i32 %loop_z.indvar, 1
  store i32 %invar.inc, i32* %loop_z.invar_address, align 4
  %17 = icmp eq i32 %loop_z.indvar, 0
  %18 = add i32 %block_origin.z, %loop_z.indvar
  %19 = mul i32 %thread_id.x, 2
  %20 = add i32 %tile_origin.2, %19
  %21 = sub i32 %tile_bound, %thread_id.y
  %22 = add i32 %21, 1
  %23 = add i32 %22, -1
  %24 = udiv i32 %23, 1
  store i32 0, i32* %output_y_in_tile.invar_address, align 4
  br label %output_y_in_tile.loop_header

output_y_in_tile.loop_header:                     ; preds = %output_is_full_tile-after, %loop_z.loop_body
  %output_y_in_tile.indvar = load i32, i32* %output_y_in_tile.invar_address, align 4
  %25 = icmp uge i32 %output_y_in_tile.indvar, %24
  br i1 %25, label %output_y_in_tile.loop_exit, label %output_y_in_tile.loop_body

output_y_in_tile.loop_body:                       ; preds = %output_y_in_tile.loop_header
  %invar.inc2 = add nuw nsw i32 %output_y_in_tile.indvar, 1
  store i32 %invar.inc2, i32* %output_y_in_tile.invar_address, align 4
  %26 = icmp eq i32 %output_y_in_tile.indvar, 0
  %27 = mul i32 %output_y_in_tile.indvar, 1
  %28 = add i32 %thread_id.y, %27
  %29 = icmp eq i32 768, %tile_bound1
  br i1 %29, label %output_is_full_tile-true, label %output_is_full_tile-false

output_is_full_tile-after:                        ; preds = %output_x_in_tile-after60, %output_is_full_tile-true
  br label %output_y_in_tile.loop_header, !llvm.loop !92

output_y_in_tile.loop_exit:                       ; preds = %output_y_in_tile.loop_header
  br label %loop_z.loop_header, !llvm.loop !93

loop_z.loop_exit:                                 ; preds = %loop_z.loop_header
  %30 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !90
  %thread_id.x63 = urem i32 %30, 96
  %thread_id.y64 = udiv i32 %30, 96
  %lane_id65 = urem i32 %30, 32
  %31 = mul i32 %thread_id.x63, 2
  %32 = add i32 %tile_origin.1, %thread_id.y64
  %33 = add i32 %tile_origin.2, %31
  %34 = add i32 %33, 0
  %35 = udiv i32 %32, 1
  %output_element_address = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %35
  %current_output = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  %partial_reduction_result = load float, float* %current_output, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result, i32 16, i32 31)
  store float %36, float* %result_from_other_lane, align 4
  call void @add_float__409(float* %current_output, float* %result_from_other_lane, float* %current_output)
  %partial_reduction_result67 = load float, float* %current_output, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 8, i32 31)
  store float %37, float* %result_from_other_lane66, align 4
  call void @add_float__409(float* %current_output, float* %result_from_other_lane66, float* %current_output)
  %partial_reduction_result69 = load float, float* %current_output, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result69, i32 4, i32 31)
  store float %38, float* %result_from_other_lane68, align 4
  call void @add_float__409(float* %current_output, float* %result_from_other_lane68, float* %current_output)
  %partial_reduction_result71 = load float, float* %current_output, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 2, i32 31)
  store float %39, float* %result_from_other_lane70, align 4
  call void @add_float__409(float* %current_output, float* %result_from_other_lane70, float* %current_output)
  %partial_reduction_result73 = load float, float* %current_output, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result73, i32 1, i32 31)
  store float %40, float* %result_from_other_lane72, align 4
  call void @add_float__409(float* %current_output, float* %result_from_other_lane72, float* %current_output)
  %41 = udiv i32 %thread_id.x63, 32
  %42 = icmp eq i32 %lane_id65, 0
  br i1 %42, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %loop_z.loop_exit
  call void @llvm.nvvm.barrier0()
  %43 = icmp eq i32 %41, 0
  br i1 %43, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_atomic_update-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

output_is_full_tile-true:                         ; preds = %output_y_in_tile.loop_body
  %44 = add i32 %tile_origin.1, %28
  %x_loc = add i32 0, %19
  %45 = add i32 %20, 0
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %44, 576
  %49 = add nuw nsw i32 %47, %48
  %50 = mul nuw nsw i32 %18, 18432
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 1
  %53 = urem i32 %52, 576
  %54 = udiv i32 %51, 576
  %55 = urem i32 %54, 32
  %56 = udiv i32 %51, 18432
  %57 = mul nuw nsw i32 %53, 1
  %58 = add nuw nsw i32 0, %57
  %59 = urem i32 %58, 24
  %60 = udiv i32 %58, 24
  %61 = udiv i32 %60, 24
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 32
  %65 = mul nuw nsw i32 %56, 1
  %66 = add nuw nsw i32 0, %65
  %67 = udiv i32 %66, 1024
  %68 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.88 = getelementptr inbounds float, float* %68, i32 %51
  %param_0.883 = load float, float* %param_0.88, align 4, !invariant.load !65
  store float %param_0.883, float* %reduction_input_address, align 4
  %69 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %69, float* %reduction_input_address, float* %69)
  %x_loc4 = add i32 1, %19
  %70 = add i32 %20, 1
  %71 = mul nuw nsw i32 %70, 1
  %72 = add nuw nsw i32 0, %71
  %73 = mul nuw nsw i32 %44, 576
  %74 = add nuw nsw i32 %72, %73
  %75 = mul nuw nsw i32 %18, 18432
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 576
  %79 = udiv i32 %76, 576
  %80 = urem i32 %79, 32
  %81 = udiv i32 %76, 18432
  %82 = mul nuw nsw i32 %78, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 24
  %85 = udiv i32 %83, 24
  %86 = udiv i32 %85, 24
  %87 = mul nuw nsw i32 %80, 1
  %88 = add nuw nsw i32 0, %87
  %89 = udiv i32 %88, 32
  %90 = mul nuw nsw i32 %81, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 1024
  %93 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.885 = getelementptr inbounds float, float* %93, i32 %76
  %param_0.886 = load float, float* %param_0.885, align 4, !invariant.load !65
  store float %param_0.886, float* %reduction_input_address, align 4
  %94 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %94, float* %reduction_input_address, float* %94)
  %x_loc7 = add i32 192, %19
  %95 = add i32 %20, 192
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %44, 576
  %99 = add nuw nsw i32 %97, %98
  %100 = mul nuw nsw i32 %18, 18432
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 576
  %104 = udiv i32 %101, 576
  %105 = urem i32 %104, 32
  %106 = udiv i32 %101, 18432
  %107 = mul nuw nsw i32 %103, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 24
  %110 = udiv i32 %108, 24
  %111 = udiv i32 %110, 24
  %112 = mul nuw nsw i32 %105, 1
  %113 = add nuw nsw i32 0, %112
  %114 = udiv i32 %113, 32
  %115 = mul nuw nsw i32 %106, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 1024
  %118 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.888 = getelementptr inbounds float, float* %118, i32 %101
  %param_0.889 = load float, float* %param_0.888, align 4, !invariant.load !65
  store float %param_0.889, float* %reduction_input_address, align 4
  %119 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %119, float* %reduction_input_address, float* %119)
  %x_loc10 = add i32 193, %19
  %120 = add i32 %20, 193
  %121 = mul nuw nsw i32 %120, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %44, 576
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %18, 18432
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 576
  %129 = udiv i32 %126, 576
  %130 = urem i32 %129, 32
  %131 = udiv i32 %126, 18432
  %132 = mul nuw nsw i32 %128, 1
  %133 = add nuw nsw i32 0, %132
  %134 = urem i32 %133, 24
  %135 = udiv i32 %133, 24
  %136 = udiv i32 %135, 24
  %137 = mul nuw nsw i32 %130, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 32
  %140 = mul nuw nsw i32 %131, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 1024
  %143 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8811 = getelementptr inbounds float, float* %143, i32 %126
  %param_0.8812 = load float, float* %param_0.8811, align 4, !invariant.load !65
  store float %param_0.8812, float* %reduction_input_address, align 4
  %144 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %144, float* %reduction_input_address, float* %144)
  %x_loc13 = add i32 384, %19
  %145 = add i32 %20, 384
  %146 = mul nuw nsw i32 %145, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %44, 576
  %149 = add nuw nsw i32 %147, %148
  %150 = mul nuw nsw i32 %18, 18432
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 576
  %154 = udiv i32 %151, 576
  %155 = urem i32 %154, 32
  %156 = udiv i32 %151, 18432
  %157 = mul nuw nsw i32 %153, 1
  %158 = add nuw nsw i32 0, %157
  %159 = urem i32 %158, 24
  %160 = udiv i32 %158, 24
  %161 = udiv i32 %160, 24
  %162 = mul nuw nsw i32 %155, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 32
  %165 = mul nuw nsw i32 %156, 1
  %166 = add nuw nsw i32 0, %165
  %167 = udiv i32 %166, 1024
  %168 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8814 = getelementptr inbounds float, float* %168, i32 %151
  %param_0.8815 = load float, float* %param_0.8814, align 4, !invariant.load !65
  store float %param_0.8815, float* %reduction_input_address, align 4
  %169 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %169, float* %reduction_input_address, float* %169)
  %x_loc16 = add i32 385, %19
  %170 = add i32 %20, 385
  %171 = mul nuw nsw i32 %170, 1
  %172 = add nuw nsw i32 0, %171
  %173 = mul nuw nsw i32 %44, 576
  %174 = add nuw nsw i32 %172, %173
  %175 = mul nuw nsw i32 %18, 18432
  %176 = add nuw nsw i32 %174, %175
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 576
  %179 = udiv i32 %176, 576
  %180 = urem i32 %179, 32
  %181 = udiv i32 %176, 18432
  %182 = mul nuw nsw i32 %178, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 24
  %185 = udiv i32 %183, 24
  %186 = udiv i32 %185, 24
  %187 = mul nuw nsw i32 %180, 1
  %188 = add nuw nsw i32 0, %187
  %189 = udiv i32 %188, 32
  %190 = mul nuw nsw i32 %181, 1
  %191 = add nuw nsw i32 0, %190
  %192 = udiv i32 %191, 1024
  %193 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8817 = getelementptr inbounds float, float* %193, i32 %176
  %param_0.8818 = load float, float* %param_0.8817, align 4, !invariant.load !65
  store float %param_0.8818, float* %reduction_input_address, align 4
  %194 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %194, float* %reduction_input_address, float* %194)
  %x_loc19 = add i32 576, %19
  %195 = add i32 %20, 576
  %196 = mul nuw nsw i32 %195, 1
  %197 = add nuw nsw i32 0, %196
  %198 = mul nuw nsw i32 %44, 576
  %199 = add nuw nsw i32 %197, %198
  %200 = mul nuw nsw i32 %18, 18432
  %201 = add nuw nsw i32 %199, %200
  %202 = udiv i32 %201, 1
  %203 = urem i32 %202, 576
  %204 = udiv i32 %201, 576
  %205 = urem i32 %204, 32
  %206 = udiv i32 %201, 18432
  %207 = mul nuw nsw i32 %203, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 24
  %210 = udiv i32 %208, 24
  %211 = udiv i32 %210, 24
  %212 = mul nuw nsw i32 %205, 1
  %213 = add nuw nsw i32 0, %212
  %214 = udiv i32 %213, 32
  %215 = mul nuw nsw i32 %206, 1
  %216 = add nuw nsw i32 0, %215
  %217 = udiv i32 %216, 1024
  %218 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8820 = getelementptr inbounds float, float* %218, i32 %201
  %param_0.8821 = load float, float* %param_0.8820, align 4, !invariant.load !65
  store float %param_0.8821, float* %reduction_input_address, align 4
  %219 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %219, float* %reduction_input_address, float* %219)
  %x_loc22 = add i32 577, %19
  %220 = add i32 %20, 577
  %221 = mul nuw nsw i32 %220, 1
  %222 = add nuw nsw i32 0, %221
  %223 = mul nuw nsw i32 %44, 576
  %224 = add nuw nsw i32 %222, %223
  %225 = mul nuw nsw i32 %18, 18432
  %226 = add nuw nsw i32 %224, %225
  %227 = udiv i32 %226, 1
  %228 = urem i32 %227, 576
  %229 = udiv i32 %226, 576
  %230 = urem i32 %229, 32
  %231 = udiv i32 %226, 18432
  %232 = mul nuw nsw i32 %228, 1
  %233 = add nuw nsw i32 0, %232
  %234 = urem i32 %233, 24
  %235 = udiv i32 %233, 24
  %236 = udiv i32 %235, 24
  %237 = mul nuw nsw i32 %230, 1
  %238 = add nuw nsw i32 0, %237
  %239 = udiv i32 %238, 32
  %240 = mul nuw nsw i32 %231, 1
  %241 = add nuw nsw i32 0, %240
  %242 = udiv i32 %241, 1024
  %243 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8823 = getelementptr inbounds float, float* %243, i32 %226
  %param_0.8824 = load float, float* %param_0.8823, align 4, !invariant.load !65
  store float %param_0.8824, float* %reduction_input_address, align 4
  %244 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %244, float* %reduction_input_address, float* %244)
  br label %output_is_full_tile-after

output_is_full_tile-false:                        ; preds = %output_y_in_tile.loop_body
  %245 = add i32 %tile_origin.1, %28
  %x_loc25 = add i32 0, %19
  %246 = add i32 %20, 0
  %247 = icmp ult i32 %x_loc25, %tile_bound1
  br i1 %247, label %output_x_in_tile-true, label %output_x_in_tile-after

output_x_in_tile-after:                           ; preds = %output_x_in_tile-true, %output_is_full_tile-false
  %x_loc28 = add i32 1, %19
  %248 = add i32 %20, 1
  %249 = icmp ult i32 %x_loc28, %tile_bound1
  br i1 %249, label %output_x_in_tile-true29, label %output_x_in_tile-after30

output_x_in_tile-after30:                         ; preds = %output_x_in_tile-true29, %output_x_in_tile-after
  %x_loc33 = add i32 192, %19
  %250 = add i32 %20, 192
  %251 = icmp ult i32 %x_loc33, %tile_bound1
  br i1 %251, label %output_x_in_tile-true34, label %output_x_in_tile-after35

output_x_in_tile-after35:                         ; preds = %output_x_in_tile-true34, %output_x_in_tile-after30
  %x_loc38 = add i32 193, %19
  %252 = add i32 %20, 193
  %253 = icmp ult i32 %x_loc38, %tile_bound1
  br i1 %253, label %output_x_in_tile-true39, label %output_x_in_tile-after40

output_x_in_tile-after40:                         ; preds = %output_x_in_tile-true39, %output_x_in_tile-after35
  %x_loc43 = add i32 384, %19
  %254 = add i32 %20, 384
  %255 = icmp ult i32 %x_loc43, %tile_bound1
  br i1 %255, label %output_x_in_tile-true44, label %output_x_in_tile-after45

output_x_in_tile-after45:                         ; preds = %output_x_in_tile-true44, %output_x_in_tile-after40
  %x_loc48 = add i32 385, %19
  %256 = add i32 %20, 385
  %257 = icmp ult i32 %x_loc48, %tile_bound1
  br i1 %257, label %output_x_in_tile-true49, label %output_x_in_tile-after50

output_x_in_tile-after50:                         ; preds = %output_x_in_tile-true49, %output_x_in_tile-after45
  %x_loc53 = add i32 576, %19
  %258 = add i32 %20, 576
  %259 = icmp ult i32 %x_loc53, %tile_bound1
  br i1 %259, label %output_x_in_tile-true54, label %output_x_in_tile-after55

output_x_in_tile-after55:                         ; preds = %output_x_in_tile-true54, %output_x_in_tile-after50
  %x_loc58 = add i32 577, %19
  %260 = add i32 %20, 577
  %261 = icmp ult i32 %x_loc58, %tile_bound1
  br i1 %261, label %output_x_in_tile-true59, label %output_x_in_tile-after60

output_x_in_tile-after60:                         ; preds = %output_x_in_tile-true59, %output_x_in_tile-after55
  br label %output_is_full_tile-after

output_x_in_tile-true:                            ; preds = %output_is_full_tile-false
  %262 = mul nuw nsw i32 %246, 1
  %263 = add nuw nsw i32 0, %262
  %264 = mul nuw nsw i32 %245, 576
  %265 = add nuw nsw i32 %263, %264
  %266 = mul nuw nsw i32 %18, 18432
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 1
  %269 = urem i32 %268, 576
  %270 = udiv i32 %267, 576
  %271 = urem i32 %270, 32
  %272 = udiv i32 %267, 18432
  %273 = mul nuw nsw i32 %269, 1
  %274 = add nuw nsw i32 0, %273
  %275 = urem i32 %274, 24
  %276 = udiv i32 %274, 24
  %277 = udiv i32 %276, 24
  %278 = mul nuw nsw i32 %271, 1
  %279 = add nuw nsw i32 0, %278
  %280 = udiv i32 %279, 32
  %281 = mul nuw nsw i32 %272, 1
  %282 = add nuw nsw i32 0, %281
  %283 = udiv i32 %282, 1024
  %284 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8826 = getelementptr inbounds float, float* %284, i32 %267
  %param_0.8827 = load float, float* %param_0.8826, align 4, !invariant.load !65
  store float %param_0.8827, float* %reduction_input_address, align 4
  %285 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %285, float* %reduction_input_address, float* %285)
  br label %output_x_in_tile-after

output_x_in_tile-true29:                          ; preds = %output_x_in_tile-after
  %286 = mul nuw nsw i32 %248, 1
  %287 = add nuw nsw i32 0, %286
  %288 = mul nuw nsw i32 %245, 576
  %289 = add nuw nsw i32 %287, %288
  %290 = mul nuw nsw i32 %18, 18432
  %291 = add nuw nsw i32 %289, %290
  %292 = udiv i32 %291, 1
  %293 = urem i32 %292, 576
  %294 = udiv i32 %291, 576
  %295 = urem i32 %294, 32
  %296 = udiv i32 %291, 18432
  %297 = mul nuw nsw i32 %293, 1
  %298 = add nuw nsw i32 0, %297
  %299 = urem i32 %298, 24
  %300 = udiv i32 %298, 24
  %301 = udiv i32 %300, 24
  %302 = mul nuw nsw i32 %295, 1
  %303 = add nuw nsw i32 0, %302
  %304 = udiv i32 %303, 32
  %305 = mul nuw nsw i32 %296, 1
  %306 = add nuw nsw i32 0, %305
  %307 = udiv i32 %306, 1024
  %308 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8831 = getelementptr inbounds float, float* %308, i32 %291
  %param_0.8832 = load float, float* %param_0.8831, align 4, !invariant.load !65
  store float %param_0.8832, float* %reduction_input_address, align 4
  %309 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %309, float* %reduction_input_address, float* %309)
  br label %output_x_in_tile-after30

output_x_in_tile-true34:                          ; preds = %output_x_in_tile-after30
  %310 = mul nuw nsw i32 %250, 1
  %311 = add nuw nsw i32 0, %310
  %312 = mul nuw nsw i32 %245, 576
  %313 = add nuw nsw i32 %311, %312
  %314 = mul nuw nsw i32 %18, 18432
  %315 = add nuw nsw i32 %313, %314
  %316 = udiv i32 %315, 1
  %317 = urem i32 %316, 576
  %318 = udiv i32 %315, 576
  %319 = urem i32 %318, 32
  %320 = udiv i32 %315, 18432
  %321 = mul nuw nsw i32 %317, 1
  %322 = add nuw nsw i32 0, %321
  %323 = urem i32 %322, 24
  %324 = udiv i32 %322, 24
  %325 = udiv i32 %324, 24
  %326 = mul nuw nsw i32 %319, 1
  %327 = add nuw nsw i32 0, %326
  %328 = udiv i32 %327, 32
  %329 = mul nuw nsw i32 %320, 1
  %330 = add nuw nsw i32 0, %329
  %331 = udiv i32 %330, 1024
  %332 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8836 = getelementptr inbounds float, float* %332, i32 %315
  %param_0.8837 = load float, float* %param_0.8836, align 4, !invariant.load !65
  store float %param_0.8837, float* %reduction_input_address, align 4
  %333 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %333, float* %reduction_input_address, float* %333)
  br label %output_x_in_tile-after35

output_x_in_tile-true39:                          ; preds = %output_x_in_tile-after35
  %334 = mul nuw nsw i32 %252, 1
  %335 = add nuw nsw i32 0, %334
  %336 = mul nuw nsw i32 %245, 576
  %337 = add nuw nsw i32 %335, %336
  %338 = mul nuw nsw i32 %18, 18432
  %339 = add nuw nsw i32 %337, %338
  %340 = udiv i32 %339, 1
  %341 = urem i32 %340, 576
  %342 = udiv i32 %339, 576
  %343 = urem i32 %342, 32
  %344 = udiv i32 %339, 18432
  %345 = mul nuw nsw i32 %341, 1
  %346 = add nuw nsw i32 0, %345
  %347 = urem i32 %346, 24
  %348 = udiv i32 %346, 24
  %349 = udiv i32 %348, 24
  %350 = mul nuw nsw i32 %343, 1
  %351 = add nuw nsw i32 0, %350
  %352 = udiv i32 %351, 32
  %353 = mul nuw nsw i32 %344, 1
  %354 = add nuw nsw i32 0, %353
  %355 = udiv i32 %354, 1024
  %356 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8841 = getelementptr inbounds float, float* %356, i32 %339
  %param_0.8842 = load float, float* %param_0.8841, align 4, !invariant.load !65
  store float %param_0.8842, float* %reduction_input_address, align 4
  %357 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %357, float* %reduction_input_address, float* %357)
  br label %output_x_in_tile-after40

output_x_in_tile-true44:                          ; preds = %output_x_in_tile-after40
  %358 = mul nuw nsw i32 %254, 1
  %359 = add nuw nsw i32 0, %358
  %360 = mul nuw nsw i32 %245, 576
  %361 = add nuw nsw i32 %359, %360
  %362 = mul nuw nsw i32 %18, 18432
  %363 = add nuw nsw i32 %361, %362
  %364 = udiv i32 %363, 1
  %365 = urem i32 %364, 576
  %366 = udiv i32 %363, 576
  %367 = urem i32 %366, 32
  %368 = udiv i32 %363, 18432
  %369 = mul nuw nsw i32 %365, 1
  %370 = add nuw nsw i32 0, %369
  %371 = urem i32 %370, 24
  %372 = udiv i32 %370, 24
  %373 = udiv i32 %372, 24
  %374 = mul nuw nsw i32 %367, 1
  %375 = add nuw nsw i32 0, %374
  %376 = udiv i32 %375, 32
  %377 = mul nuw nsw i32 %368, 1
  %378 = add nuw nsw i32 0, %377
  %379 = udiv i32 %378, 1024
  %380 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8846 = getelementptr inbounds float, float* %380, i32 %363
  %param_0.8847 = load float, float* %param_0.8846, align 4, !invariant.load !65
  store float %param_0.8847, float* %reduction_input_address, align 4
  %381 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %381, float* %reduction_input_address, float* %381)
  br label %output_x_in_tile-after45

output_x_in_tile-true49:                          ; preds = %output_x_in_tile-after45
  %382 = mul nuw nsw i32 %256, 1
  %383 = add nuw nsw i32 0, %382
  %384 = mul nuw nsw i32 %245, 576
  %385 = add nuw nsw i32 %383, %384
  %386 = mul nuw nsw i32 %18, 18432
  %387 = add nuw nsw i32 %385, %386
  %388 = udiv i32 %387, 1
  %389 = urem i32 %388, 576
  %390 = udiv i32 %387, 576
  %391 = urem i32 %390, 32
  %392 = udiv i32 %387, 18432
  %393 = mul nuw nsw i32 %389, 1
  %394 = add nuw nsw i32 0, %393
  %395 = urem i32 %394, 24
  %396 = udiv i32 %394, 24
  %397 = udiv i32 %396, 24
  %398 = mul nuw nsw i32 %391, 1
  %399 = add nuw nsw i32 0, %398
  %400 = udiv i32 %399, 32
  %401 = mul nuw nsw i32 %392, 1
  %402 = add nuw nsw i32 0, %401
  %403 = udiv i32 %402, 1024
  %404 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8851 = getelementptr inbounds float, float* %404, i32 %387
  %param_0.8852 = load float, float* %param_0.8851, align 4, !invariant.load !65
  store float %param_0.8852, float* %reduction_input_address, align 4
  %405 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %405, float* %reduction_input_address, float* %405)
  br label %output_x_in_tile-after50

output_x_in_tile-true54:                          ; preds = %output_x_in_tile-after50
  %406 = mul nuw nsw i32 %258, 1
  %407 = add nuw nsw i32 0, %406
  %408 = mul nuw nsw i32 %245, 576
  %409 = add nuw nsw i32 %407, %408
  %410 = mul nuw nsw i32 %18, 18432
  %411 = add nuw nsw i32 %409, %410
  %412 = udiv i32 %411, 1
  %413 = urem i32 %412, 576
  %414 = udiv i32 %411, 576
  %415 = urem i32 %414, 32
  %416 = udiv i32 %411, 18432
  %417 = mul nuw nsw i32 %413, 1
  %418 = add nuw nsw i32 0, %417
  %419 = urem i32 %418, 24
  %420 = udiv i32 %418, 24
  %421 = udiv i32 %420, 24
  %422 = mul nuw nsw i32 %415, 1
  %423 = add nuw nsw i32 0, %422
  %424 = udiv i32 %423, 32
  %425 = mul nuw nsw i32 %416, 1
  %426 = add nuw nsw i32 0, %425
  %427 = udiv i32 %426, 1024
  %428 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8856 = getelementptr inbounds float, float* %428, i32 %411
  %param_0.8857 = load float, float* %param_0.8856, align 4, !invariant.load !65
  store float %param_0.8857, float* %reduction_input_address, align 4
  %429 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %429, float* %reduction_input_address, float* %429)
  br label %output_x_in_tile-after55

output_x_in_tile-true59:                          ; preds = %output_x_in_tile-after55
  %430 = mul nuw nsw i32 %260, 1
  %431 = add nuw nsw i32 0, %430
  %432 = mul nuw nsw i32 %245, 576
  %433 = add nuw nsw i32 %431, %432
  %434 = mul nuw nsw i32 %18, 18432
  %435 = add nuw nsw i32 %433, %434
  %436 = udiv i32 %435, 1
  %437 = urem i32 %436, 576
  %438 = udiv i32 %435, 576
  %439 = urem i32 %438, 32
  %440 = udiv i32 %435, 18432
  %441 = mul nuw nsw i32 %437, 1
  %442 = add nuw nsw i32 0, %441
  %443 = urem i32 %442, 24
  %444 = udiv i32 %442, 24
  %445 = udiv i32 %444, 24
  %446 = mul nuw nsw i32 %439, 1
  %447 = add nuw nsw i32 0, %446
  %448 = udiv i32 %447, 32
  %449 = mul nuw nsw i32 %440, 1
  %450 = add nuw nsw i32 0, %449
  %451 = udiv i32 %450, 1024
  %452 = bitcast [1024 x [32 x [24 x [24 x float]]]]* %fusion.34.typed to float*
  %param_0.8861 = getelementptr inbounds float, float* %452, i32 %435
  %param_0.8862 = load float, float* %param_0.8861, align 4, !invariant.load !65
  store float %param_0.8862, float* %reduction_input_address, align 4
  %453 = getelementptr inbounds float, float* %partial_reduction_result.0, i32 0
  call void @add_float__409(float* %453, float* %reduction_input_address, float* %453)
  br label %output_x_in_tile-after60

intra_warp_reduce_write-true:                     ; preds = %loop_z.loop_exit
  %454 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_04, i32 0, i32 0, i32 %41
  %455 = addrspacecast float addrspace(3)* %454 to float*
  %456 = load float, float* %current_output, align 4
  store float %456, float* %455, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %457 = getelementptr inbounds [1 x [32 x float]], [1 x [32 x float]] addrspace(3)* @shared_cache_04, i32 0, i32 0, i32 %lane_id65
  %458 = addrspacecast float addrspace(3)* %457 to float*
  store float %2, float* %initial_value_addr, align 4
  %459 = icmp ult i32 %thread_id.x63, 3
  %460 = select i1 %459, float* %458, float* %initial_value_addr
  %partial_reduction_result75 = load float, float* %460, align 4
  %461 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 16, i32 31)
  store float %461, float* %result_from_other_lane74, align 4
  call void @add_float__409(float* %460, float* %result_from_other_lane74, float* %460)
  %partial_reduction_result77 = load float, float* %460, align 4
  %462 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result77, i32 8, i32 31)
  store float %462, float* %result_from_other_lane76, align 4
  call void @add_float__409(float* %460, float* %result_from_other_lane76, float* %460)
  %partial_reduction_result79 = load float, float* %460, align 4
  %463 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 4, i32 31)
  store float %463, float* %result_from_other_lane78, align 4
  call void @add_float__409(float* %460, float* %result_from_other_lane78, float* %460)
  %partial_reduction_result81 = load float, float* %460, align 4
  %464 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 2, i32 31)
  store float %464, float* %result_from_other_lane80, align 4
  call void @add_float__409(float* %460, float* %result_from_other_lane80, float* %460)
  %partial_reduction_result83 = load float, float* %460, align 4
  %465 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 1, i32 31)
  store float %465, float* %result_from_other_lane82, align 4
  call void @add_float__409(float* %460, float* %result_from_other_lane82, float* %460)
  %466 = icmp eq i32 %thread_id.x63, 0
  br i1 %466, label %reduction_atomic_update-true, label %reduction_atomic_update-after

reduction_atomic_update-after:                    ; preds = %reduction_atomic_update-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_atomic_update-true:                     ; preds = %inter_warp_reduce-true
  %source = load float, float* %458, align 4
  %467 = atomicrmw fadd float* %output_element_address, float %source seq_cst
  br label %reduction_atomic_update-after
}

define internal void @add_float__409(float* dereferenceable(4) %x.410.typed, float* dereferenceable(4) %y.411.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.412.typed = alloca float, align 4
  %0 = load float, float* %x.410.typed, align 4
  %1 = load float, float* %y.411.typed, align 4
  %add.412 = fadd float %0, %1
  store float %add.412, float* %add.412.typed, align 4
  %load_ret_value = load float, float* %add.412.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_51(i8* noalias align 64 dereferenceable(5120) %alloc21, i8* noalias align 64 dereferenceable(3200) %alloc27, i8* noalias align 64 dereferenceable(3200) %alloc28, i8* noalias align 64 dereferenceable(3200) %alloc29, i8* noalias align 16 dereferenceable(3200) %alloc30, i8* noalias align 16 dereferenceable(3200) %alloc31, i8* noalias align 16 dereferenceable(3200) %alloc32, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.51.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056448
  %fusion.51.typed = bitcast i8* %fusion.51.raw to [3 x i8*]*
  %fusion.51.raw1 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %fusion.51.typed2 = bitcast i8* %fusion.51.raw1 to [5 x [5 x [1 x [32 x float]]]]*
  %fusion.51.raw3 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %fusion.51.typed4 = bitcast i8* %fusion.51.raw3 to [5 x [5 x [1 x [32 x float]]]]*
  %fusion.51.raw5 = getelementptr inbounds i8, i8* %alloc27, i64 0
  %fusion.51.typed6 = bitcast i8* %fusion.51.raw5 to [5 x [5 x [1 x [32 x float]]]]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %get-tuple-element.77.raw = getelementptr inbounds i8, i8* %alloc21, i64 0
  %get-tuple-element.77.typed = bitcast i8* %get-tuple-element.77.raw to [32 x [1 x [5 x [5 x float]]]]*
  %arg32.33.raw = getelementptr inbounds i8, i8* %alloc31, i64 0
  %arg32.33.typed = bitcast i8* %arg32.33.raw to [5 x [5 x [1 x [32 x float]]]]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg33.34.raw = getelementptr inbounds i8, i8* %alloc32, i64 0
  %arg33.34.typed = bitcast i8* %arg33.34.raw to [5 x [5 x [1 x [32 x float]]]]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg7.8.raw = getelementptr inbounds i8, i8* %alloc30, i64 0
  %arg7.8.typed = bitcast i8* %arg7.8.raw to [5 x [5 x [1 x [32 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %7 = mul nuw nsw i32 %5, 200
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 32
  %10 = udiv i32 %linear_index_base, 32
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index_base, 32
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index_base, 160
  %linear_index7 = add nuw nsw i32 %linear_index_base, 1
  %15 = udiv i32 %linear_index7, 1
  %16 = urem i32 %15, 32
  %17 = udiv i32 %linear_index7, 32
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index7, 32
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index7, 160
  %linear_index8 = add nuw nsw i32 %linear_index_base, 2
  %22 = udiv i32 %linear_index8, 1
  %23 = urem i32 %22, 32
  %24 = udiv i32 %linear_index8, 32
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index8, 32
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index8, 160
  %linear_index9 = add nuw nsw i32 %linear_index_base, 3
  %29 = udiv i32 %linear_index9, 1
  %30 = urem i32 %29, 32
  %31 = udiv i32 %linear_index9, 32
  %32 = urem i32 %31, 1
  %33 = udiv i32 %linear_index9, 32
  %34 = urem i32 %33, 5
  %35 = udiv i32 %linear_index9, 160
  %36 = icmp ult i32 %linear_index_base, 800
  br i1 %36, label %fusion.51.in_bounds-true, label %fusion.51.in_bounds-after

fusion.51.in_bounds-after:                        ; preds = %fusion.51.in_bounds-true, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %37 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed2 to i8*
  %38 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.51.typed, i64 0, i64 0
  store i8* %37, i8** %38, align 8
  %39 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed4 to i8*
  %40 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.51.typed, i64 0, i64 1
  store i8* %39, i8** %40, align 8
  %41 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed6 to i8*
  %42 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.51.typed, i64 0, i64 2
  store i8* %41, i8** %42, align 8
  br label %emit_mof_tuple-after

fusion.51.in_bounds-true:                         ; preds = %emit_mof_tuple-after
  %param_2.243 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg32.33.typed, i32 0, i32 %14, i32 %13, i32 0, i32 %9
  %param_2.24310 = load float, float* %param_2.243, align 4, !invariant.load !65
  %param_1.216 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %9, i32 0, i32 %14, i32 %13
  %param_1.21611 = load float, float* %param_1.216, align 4, !invariant.load !65
  %subtract.83 = fsub float %param_1.21611, %param_2.24310
  %43 = load float, float* bitcast ([4 x i8]* @103 to float*), align 4
  %param_0.129 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.82 = fsub float %43, %param_0.129
  %multiply.71 = fmul float %subtract.83, %subtract.82
  %add.52 = fadd float %param_2.24310, %multiply.71
  %44 = insertvalue { float, float, float } undef, float %add.52, 0
  %param_6.118 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %14, i32 %13, i32 0, i32 %9
  %param_6.11812 = load float, float* %param_6.118, align 4, !invariant.load !65
  %param_5.133 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.32.clone.1 = fmul float %add.52, %param_5.133
  %param_4.125 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg33.34.typed, i32 0, i32 %14, i32 %13, i32 0, i32 %9
  %param_4.12513 = load float, float* %param_4.125, align 4, !invariant.load !65
  %param_1.21614 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %9, i32 0, i32 %14, i32 %13
  %param_1.21615 = load float, float* %param_1.21614, align 4, !invariant.load !65
  %param_1.21616 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %9, i32 0, i32 %14, i32 %13
  %param_1.21617 = load float, float* %param_1.21616, align 4, !invariant.load !65
  %multiply.63.clone.1 = fmul float %param_1.21615, %param_1.21617
  %subtract.71.clone.1 = fsub float %multiply.63.clone.1, %param_4.12513
  %45 = load float, float* bitcast ([4 x i8]* @104 to float*), align 4
  %param_3.154 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.70.clone.1 = fsub float %45, %param_3.154
  %multiply.62.clone.1 = fmul float %subtract.71.clone.1, %subtract.70.clone.1
  %add.45.clone.1 = fadd float %param_4.12513, %multiply.62.clone.1
  %46 = call float @__nv_sqrtf(float %add.45.clone.1)
  %47 = load float, float* bitcast ([4 x i8]* @105 to float*), align 4
  %add.25.clone.1 = fadd float %46, %47
  %divide.9.clone.1 = fdiv float %multiply.32.clone.1, %add.25.clone.1
  %subtract.25.clone.1 = fsub float %param_6.11812, %divide.9.clone.1
  %48 = insertvalue { float, float, float } %44, float %subtract.25.clone.1, 1
  %49 = insertvalue { float, float, float } %48, float %add.45.clone.1, 2
  %50 = extractvalue { float, float, float } %49, 0
  %51 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed2 to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index_base
  store float %50, float* %52, align 4
  %53 = extractvalue { float, float, float } %49, 1
  %54 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed4 to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index_base
  store float %53, float* %55, align 4
  %56 = extractvalue { float, float, float } %49, 2
  %57 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed6 to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index_base
  store float %56, float* %58, align 4
  %param_2.24318 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg32.33.typed, i32 0, i32 %21, i32 %20, i32 0, i32 %16
  %param_2.24319 = load float, float* %param_2.24318, align 4, !invariant.load !65
  %param_1.21620 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %16, i32 0, i32 %21, i32 %20
  %param_1.21621 = load float, float* %param_1.21620, align 4, !invariant.load !65
  %subtract.8322 = fsub float %param_1.21621, %param_2.24319
  %multiply.7123 = fmul float %subtract.8322, %subtract.82
  %add.5224 = fadd float %param_2.24319, %multiply.7123
  %59 = insertvalue { float, float, float } undef, float %add.5224, 0
  %param_6.11825 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %21, i32 %20, i32 0, i32 %16
  %param_6.11826 = load float, float* %param_6.11825, align 4, !invariant.load !65
  %param_5.13327 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.32.clone.128 = fmul float %add.5224, %param_5.13327
  %param_4.12529 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg33.34.typed, i32 0, i32 %21, i32 %20, i32 0, i32 %16
  %param_4.12530 = load float, float* %param_4.12529, align 4, !invariant.load !65
  %param_1.21631 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %16, i32 0, i32 %21, i32 %20
  %param_1.21632 = load float, float* %param_1.21631, align 4, !invariant.load !65
  %param_1.21633 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %16, i32 0, i32 %21, i32 %20
  %param_1.21634 = load float, float* %param_1.21633, align 4, !invariant.load !65
  %multiply.63.clone.135 = fmul float %param_1.21632, %param_1.21634
  %subtract.71.clone.136 = fsub float %multiply.63.clone.135, %param_4.12530
  %multiply.62.clone.137 = fmul float %subtract.71.clone.136, %subtract.70.clone.1
  %add.45.clone.138 = fadd float %param_4.12530, %multiply.62.clone.137
  %60 = call float @__nv_sqrtf(float %add.45.clone.138)
  %61 = load float, float* bitcast ([4 x i8]* @106 to float*), align 4
  %add.25.clone.139 = fadd float %60, %61
  %divide.9.clone.140 = fdiv float %multiply.32.clone.128, %add.25.clone.139
  %subtract.25.clone.141 = fsub float %param_6.11826, %divide.9.clone.140
  %62 = insertvalue { float, float, float } %59, float %subtract.25.clone.141, 1
  %63 = insertvalue { float, float, float } %62, float %add.45.clone.138, 2
  %64 = extractvalue { float, float, float } %63, 0
  %65 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed2 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index7
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float, float } %63, 1
  %68 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed4 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index7
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %63, 2
  %71 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed6 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index7
  store float %70, float* %72, align 4
  %param_2.24342 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg32.33.typed, i32 0, i32 %28, i32 %27, i32 0, i32 %23
  %param_2.24343 = load float, float* %param_2.24342, align 4, !invariant.load !65
  %param_1.21644 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %23, i32 0, i32 %28, i32 %27
  %param_1.21645 = load float, float* %param_1.21644, align 4, !invariant.load !65
  %subtract.8346 = fsub float %param_1.21645, %param_2.24343
  %multiply.7147 = fmul float %subtract.8346, %subtract.82
  %add.5248 = fadd float %param_2.24343, %multiply.7147
  %73 = insertvalue { float, float, float } undef, float %add.5248, 0
  %param_6.11849 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %28, i32 %27, i32 0, i32 %23
  %param_6.11850 = load float, float* %param_6.11849, align 4, !invariant.load !65
  %param_5.13351 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.32.clone.152 = fmul float %add.5248, %param_5.13351
  %param_4.12553 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg33.34.typed, i32 0, i32 %28, i32 %27, i32 0, i32 %23
  %param_4.12554 = load float, float* %param_4.12553, align 4, !invariant.load !65
  %param_1.21655 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %23, i32 0, i32 %28, i32 %27
  %param_1.21656 = load float, float* %param_1.21655, align 4, !invariant.load !65
  %param_1.21657 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %23, i32 0, i32 %28, i32 %27
  %param_1.21658 = load float, float* %param_1.21657, align 4, !invariant.load !65
  %multiply.63.clone.159 = fmul float %param_1.21656, %param_1.21658
  %subtract.71.clone.160 = fsub float %multiply.63.clone.159, %param_4.12554
  %multiply.62.clone.161 = fmul float %subtract.71.clone.160, %subtract.70.clone.1
  %add.45.clone.162 = fadd float %param_4.12554, %multiply.62.clone.161
  %74 = call float @__nv_sqrtf(float %add.45.clone.162)
  %75 = load float, float* bitcast ([4 x i8]* @107 to float*), align 4
  %add.25.clone.163 = fadd float %74, %75
  %divide.9.clone.164 = fdiv float %multiply.32.clone.152, %add.25.clone.163
  %subtract.25.clone.165 = fsub float %param_6.11850, %divide.9.clone.164
  %76 = insertvalue { float, float, float } %73, float %subtract.25.clone.165, 1
  %77 = insertvalue { float, float, float } %76, float %add.45.clone.162, 2
  %78 = extractvalue { float, float, float } %77, 0
  %79 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed2 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index8
  store float %78, float* %80, align 4
  %81 = extractvalue { float, float, float } %77, 1
  %82 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed4 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index8
  store float %81, float* %83, align 4
  %84 = extractvalue { float, float, float } %77, 2
  %85 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed6 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index8
  store float %84, float* %86, align 4
  %param_2.24366 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg32.33.typed, i32 0, i32 %35, i32 %34, i32 0, i32 %30
  %param_2.24367 = load float, float* %param_2.24366, align 4, !invariant.load !65
  %param_1.21668 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %30, i32 0, i32 %35, i32 %34
  %param_1.21669 = load float, float* %param_1.21668, align 4, !invariant.load !65
  %subtract.8370 = fsub float %param_1.21669, %param_2.24367
  %multiply.7171 = fmul float %subtract.8370, %subtract.82
  %add.5272 = fadd float %param_2.24367, %multiply.7171
  %87 = insertvalue { float, float, float } undef, float %add.5272, 0
  %param_6.11873 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg7.8.typed, i32 0, i32 %35, i32 %34, i32 0, i32 %30
  %param_6.11874 = load float, float* %param_6.11873, align 4, !invariant.load !65
  %param_5.13375 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.32.clone.176 = fmul float %add.5272, %param_5.13375
  %param_4.12577 = getelementptr inbounds [5 x [5 x [1 x [32 x float]]]], [5 x [5 x [1 x [32 x float]]]]* %arg33.34.typed, i32 0, i32 %35, i32 %34, i32 0, i32 %30
  %param_4.12578 = load float, float* %param_4.12577, align 4, !invariant.load !65
  %param_1.21679 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %30, i32 0, i32 %35, i32 %34
  %param_1.21680 = load float, float* %param_1.21679, align 4, !invariant.load !65
  %param_1.21681 = getelementptr inbounds [32 x [1 x [5 x [5 x float]]]], [32 x [1 x [5 x [5 x float]]]]* %get-tuple-element.77.typed, i32 0, i32 %30, i32 0, i32 %35, i32 %34
  %param_1.21682 = load float, float* %param_1.21681, align 4, !invariant.load !65
  %multiply.63.clone.183 = fmul float %param_1.21680, %param_1.21682
  %subtract.71.clone.184 = fsub float %multiply.63.clone.183, %param_4.12578
  %multiply.62.clone.185 = fmul float %subtract.71.clone.184, %subtract.70.clone.1
  %add.45.clone.186 = fadd float %param_4.12578, %multiply.62.clone.185
  %88 = call float @__nv_sqrtf(float %add.45.clone.186)
  %89 = load float, float* bitcast ([4 x i8]* @108 to float*), align 4
  %add.25.clone.187 = fadd float %88, %89
  %divide.9.clone.188 = fdiv float %multiply.32.clone.176, %add.25.clone.187
  %subtract.25.clone.189 = fsub float %param_6.11874, %divide.9.clone.188
  %90 = insertvalue { float, float, float } %87, float %subtract.25.clone.189, 1
  %91 = insertvalue { float, float, float } %90, float %add.45.clone.186, 2
  %92 = extractvalue { float, float, float } %91, 0
  %93 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed2 to float*
  %94 = getelementptr inbounds float, float* %93, i32 %linear_index9
  store float %92, float* %94, align 4
  %95 = extractvalue { float, float, float } %91, 1
  %96 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed4 to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index9
  store float %95, float* %97, align 4
  %98 = extractvalue { float, float, float } %91, 2
  %99 = bitcast [5 x [5 x [1 x [32 x float]]]]* %fusion.51.typed6 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index9
  store float %98, float* %100, align 4
  br label %fusion.51.in_bounds-after
}

define void @fusion_59(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(204800) %alloc15, i8* noalias align 64 dereferenceable(5120) %alloc19, i8* noalias align 64 dereferenceable(5120) %alloc20, i8* noalias align 64 dereferenceable(5120) %alloc21, i8* noalias align 16 dereferenceable(5120) %alloc22, i8* noalias align 16 dereferenceable(5120) %alloc23, i8* noalias align 16 dereferenceable(5120) %alloc24, i8* noalias align 64 dereferenceable(256) %alloc45, i8* noalias align 64 dereferenceable(256) %alloc46, i8* noalias align 64 dereferenceable(256) %alloc47, i8* noalias align 16 dereferenceable(256) %alloc48, i8* noalias align 16 dereferenceable(256) %alloc49, i8* noalias align 16 dereferenceable(256) %alloc50, i8* noalias align 64 dereferenceable(128) %alloc52, i8* noalias align 64 dereferenceable(128) %alloc53, i8* noalias align 64 dereferenceable(128) %alloc54, i8* noalias align 16 dereferenceable(128) %alloc55, i8* noalias align 16 dereferenceable(128) %alloc56, i8* noalias align 16 dereferenceable(128) %alloc57, i8* noalias align 64 dereferenceable(40) %alloc60, i8* noalias align 64 dereferenceable(40) %alloc61, i8* noalias align 64 dereferenceable(40) %alloc62, i8* noalias align 16 dereferenceable(40) %alloc63, i8* noalias align 16 dereferenceable(40) %alloc64, i8* noalias align 16 dereferenceable(40) %alloc65, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.59.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056576
  %fusion.59.typed = bitcast i8* %fusion.59.raw to [12 x i8*]*
  %fusion.59.raw1 = getelementptr inbounds i8, i8* %alloc54, i64 0
  %fusion.59.typed2 = bitcast i8* %fusion.59.raw1 to [32 x float]*
  %fusion.59.raw3 = getelementptr inbounds i8, i8* %alloc53, i64 0
  %fusion.59.typed4 = bitcast i8* %fusion.59.raw3 to [32 x float]*
  %fusion.59.raw5 = getelementptr inbounds i8, i8* %alloc52, i64 0
  %fusion.59.typed6 = bitcast i8* %fusion.59.raw5 to [32 x float]*
  %fusion.59.raw7 = getelementptr inbounds i8, i8* %alloc45, i64 0
  %fusion.59.typed8 = bitcast i8* %fusion.59.raw7 to [64 x float]*
  %fusion.59.raw9 = getelementptr inbounds i8, i8* %alloc47, i64 0
  %fusion.59.typed10 = bitcast i8* %fusion.59.raw9 to [64 x float]*
  %fusion.59.raw11 = getelementptr inbounds i8, i8* %alloc46, i64 0
  %fusion.59.typed12 = bitcast i8* %fusion.59.raw11 to [64 x float]*
  %fusion.59.raw13 = getelementptr inbounds i8, i8* %alloc60, i64 0
  %fusion.59.typed14 = bitcast i8* %fusion.59.raw13 to [10 x float]*
  %fusion.59.raw15 = getelementptr inbounds i8, i8* %alloc61, i64 0
  %fusion.59.typed16 = bitcast i8* %fusion.59.raw15 to [10 x float]*
  %fusion.59.raw17 = getelementptr inbounds i8, i8* %alloc62, i64 0
  %fusion.59.typed18 = bitcast i8* %fusion.59.raw17 to [10 x float]*
  %fusion.59.raw19 = getelementptr inbounds i8, i8* %alloc19, i64 0
  %fusion.59.typed20 = bitcast i8* %fusion.59.raw19 to [1280 x float]*
  %fusion.59.raw21 = getelementptr inbounds i8, i8* %alloc20, i64 0
  %fusion.59.typed22 = bitcast i8* %fusion.59.raw21 to [1280 x float]*
  %fusion.59.raw23 = getelementptr inbounds i8, i8* %alloc21, i64 0
  %fusion.59.typed24 = bitcast i8* %fusion.59.raw23 to [1280 x float]*
  %arg6.7.raw = getelementptr inbounds i8, i8* %alloc55, i64 0
  %arg6.7.typed = bitcast i8* %arg6.7.raw to [32 x float]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg34.35.raw = getelementptr inbounds i8, i8* %alloc56, i64 0
  %arg34.35.typed = bitcast i8* %arg34.35.raw to [32 x float]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %fusion.33.raw = getelementptr inbounds i8, i8* %alloc15, i64 0
  %fusion.33.typed = bitcast i8* %fusion.33.raw to [32 x float]*
  %arg35.36.raw = getelementptr inbounds i8, i8* %alloc57, i64 0
  %arg35.36.typed = bitcast i8* %arg35.36.raw to [32 x float]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg8.9.raw = getelementptr inbounds i8, i8* %alloc48, i64 0
  %arg8.9.typed = bitcast i8* %arg8.9.raw to [64 x float]*
  %arg30.31.raw = getelementptr inbounds i8, i8* %alloc49, i64 0
  %arg30.31.typed = bitcast i8* %arg30.31.raw to [64 x float]*
  %fusion.25.raw = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.25.typed = bitcast i8* %fusion.25.raw to [64 x float]*
  %arg31.32.raw = getelementptr inbounds i8, i8* %alloc50, i64 0
  %arg31.32.typed = bitcast i8* %arg31.32.raw to [64 x float]*
  %arg14.15.raw = getelementptr inbounds i8, i8* %alloc63, i64 0
  %arg14.15.typed = bitcast i8* %arg14.15.raw to [10 x float]*
  %arg16.17.raw = getelementptr inbounds i8, i8* %alloc64, i64 0
  %arg16.17.typed = bitcast i8* %arg16.17.raw to [10 x float]*
  %get-tuple-element.116.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1140850688
  %get-tuple-element.116.typed = bitcast i8* %get-tuple-element.116.raw to [10 x float]*
  %arg17.18.raw = getelementptr inbounds i8, i8* %alloc65, i64 0
  %arg17.18.typed = bitcast i8* %arg17.18.raw to [10 x float]*
  %arg15.16.raw = getelementptr inbounds i8, i8* %alloc22, i64 0
  %arg15.16.typed = bitcast i8* %arg15.16.raw to [128 x [10 x float]]*
  %arg18.19.raw = getelementptr inbounds i8, i8* %alloc23, i64 0
  %arg18.19.typed = bitcast i8* %arg18.19.raw to [128 x [10 x float]]*
  %custom-call.18.raw = getelementptr inbounds i8, i8* %alloc14, i64 0
  %custom-call.18.typed = bitcast i8* %custom-call.18.raw to [128 x [10 x float]]*
  %arg19.20.raw = getelementptr inbounds i8, i8* %alloc24, i64 0
  %arg19.20.typed = bitcast i8* %arg19.20.raw to [128 x [10 x float]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !68
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 1386
  br i1 %4, label %fusion.59.in_bounds-true, label %fusion.59.in_bounds-after

fusion.59.in_bounds-after:                        ; preds = %slice11-after, %entry
  ret void

fusion.59.in_bounds-true:                         ; preds = %entry
  %5 = icmp ult i32 %3, 32
  br i1 %5, label %concat_index_from_operand_id0, label %concat_index_not_from_operand0

concat_index_from_operand_id0:                    ; preds = %fusion.59.in_bounds-true
  %6 = phi i32 [ 0, %fusion.59.in_bounds-true ]
  %7 = sub nsw i32 %3, %6
  %param_0_0 = getelementptr inbounds [32 x float], [32 x float]* %arg6.7.typed, i32 0, i32 %7
  %param_0_025 = load float, float* %param_0_0, align 4, !invariant.load !65
  %param_0_2 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %7
  %param_0_226 = load float, float* %param_0_2, align 4, !invariant.load !65
  %param_0_4 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %7
  %param_0_427 = load float, float* %param_0_4, align 4, !invariant.load !65
  %param_0_228 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %7
  %param_0_229 = load float, float* %param_0_228, align 4, !invariant.load !65
  %subtract.116 = fsub float %param_0_427, %param_0_229
  %8 = load float, float* bitcast ([4 x i8]* @109 to float*), align 4
  %param_0_3 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117 = fsub float %8, %param_0_3
  %multiply.96 = fmul float %subtract.116, %subtract.117
  %add.71 = fadd float %param_0_226, %multiply.96
  %param_0_1 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.97 = fmul float %add.71, %param_0_1
  %param_0_5 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %7
  %param_0_530 = load float, float* %param_0_5, align 4, !invariant.load !65
  %param_0_431 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %7
  %param_0_432 = load float, float* %param_0_431, align 4, !invariant.load !65
  %param_0_433 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %7
  %param_0_434 = load float, float* %param_0_433, align 4, !invariant.load !65
  %multiply.98 = fmul float %param_0_432, %param_0_434
  %param_0_535 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %7
  %param_0_536 = load float, float* %param_0_535, align 4, !invariant.load !65
  %subtract.118 = fsub float %multiply.98, %param_0_536
  %9 = load float, float* bitcast ([4 x i8]* @110 to float*), align 4
  %param_0_6 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119 = fsub float %9, %param_0_6
  %multiply.99 = fmul float %subtract.118, %subtract.119
  %add.72 = fadd float %param_0_530, %multiply.99
  %10 = call float @__nv_sqrtf(float %add.72)
  %11 = load float, float* bitcast ([4 x i8]* @111 to float*), align 4
  %add.73 = fadd float %10, %11
  %divide.43 = fdiv float %multiply.97, %add.73
  %subtract.120 = fsub float %param_0_025, %divide.43
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concat_index_not_from_operand0
  %12 = phi i32 [ 32, %concat_index_not_from_operand0 ]
  %13 = sub nsw i32 %3, %12
  %param_1_0 = getelementptr inbounds [64 x float], [64 x float]* %arg8.9.typed, i32 0, i32 %13
  %param_1_037 = load float, float* %param_1_0, align 4, !invariant.load !65
  %param_1_2 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %13
  %param_1_238 = load float, float* %param_1_2, align 4, !invariant.load !65
  %param_1_4 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %13
  %param_1_439 = load float, float* %param_1_4, align 4, !invariant.load !65
  %param_1_240 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %13
  %param_1_241 = load float, float* %param_1_240, align 4, !invariant.load !65
  %subtract.121 = fsub float %param_1_439, %param_1_241
  %14 = load float, float* bitcast ([4 x i8]* @112 to float*), align 4
  %param_1_3 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122 = fsub float %14, %param_1_3
  %multiply.100 = fmul float %subtract.121, %subtract.122
  %add.74 = fadd float %param_1_238, %multiply.100
  %param_1_1 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.101 = fmul float %add.74, %param_1_1
  %param_1_5 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %13
  %param_1_542 = load float, float* %param_1_5, align 4, !invariant.load !65
  %param_1_443 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %13
  %param_1_444 = load float, float* %param_1_443, align 4, !invariant.load !65
  %param_1_445 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %13
  %param_1_446 = load float, float* %param_1_445, align 4, !invariant.load !65
  %multiply.102 = fmul float %param_1_444, %param_1_446
  %param_1_547 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %13
  %param_1_548 = load float, float* %param_1_547, align 4, !invariant.load !65
  %subtract.123 = fsub float %multiply.102, %param_1_548
  %15 = load float, float* bitcast ([4 x i8]* @113 to float*), align 4
  %param_1_6 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124 = fsub float %15, %param_1_6
  %multiply.103 = fmul float %subtract.123, %subtract.124
  %add.75 = fadd float %param_1_542, %multiply.103
  %16 = call float @__nv_sqrtf(float %add.75)
  %17 = load float, float* bitcast ([4 x i8]* @114 to float*), align 4
  %add.76 = fadd float %16, %17
  %divide.44 = fdiv float %multiply.101, %add.76
  %subtract.125 = fsub float %param_1_037, %divide.44
  br label %concatenate.merge

concat_index_from_operand_id2:                    ; preds = %concat_index_not_from_operand1
  %18 = phi i32 [ 96, %concat_index_not_from_operand1 ]
  %19 = sub nsw i32 %3, %18
  %param_2_0 = getelementptr inbounds [10 x float], [10 x float]* %arg14.15.typed, i32 0, i32 %19
  %param_2_049 = load float, float* %param_2_0, align 4, !invariant.load !65
  %param_2_2 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %19
  %param_2_250 = load float, float* %param_2_2, align 4, !invariant.load !65
  %param_2_4 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %19
  %param_2_451 = load float, float* %param_2_4, align 4, !invariant.load !65
  %param_2_252 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %19
  %param_2_253 = load float, float* %param_2_252, align 4, !invariant.load !65
  %subtract.126 = fsub float %param_2_451, %param_2_253
  %20 = load float, float* bitcast ([4 x i8]* @115 to float*), align 4
  %param_2_3 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127 = fsub float %20, %param_2_3
  %multiply.104 = fmul float %subtract.126, %subtract.127
  %add.77 = fadd float %param_2_250, %multiply.104
  %param_2_1 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.105 = fmul float %add.77, %param_2_1
  %param_2_5 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %19
  %param_2_554 = load float, float* %param_2_5, align 4, !invariant.load !65
  %param_2_455 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %19
  %param_2_456 = load float, float* %param_2_455, align 4, !invariant.load !65
  %param_2_457 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %19
  %param_2_458 = load float, float* %param_2_457, align 4, !invariant.load !65
  %multiply.106 = fmul float %param_2_456, %param_2_458
  %param_2_559 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %19
  %param_2_560 = load float, float* %param_2_559, align 4, !invariant.load !65
  %subtract.128 = fsub float %multiply.106, %param_2_560
  %21 = load float, float* bitcast ([4 x i8]* @116 to float*), align 4
  %param_2_6 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129 = fsub float %21, %param_2_6
  %multiply.107 = fmul float %subtract.128, %subtract.129
  %add.79 = fadd float %param_2_554, %multiply.107
  %22 = call float @__nv_sqrtf(float %add.79)
  %23 = load float, float* bitcast ([4 x i8]* @117 to float*), align 4
  %add.80 = fadd float %22, %23
  %divide.45 = fdiv float %multiply.105, %add.80
  %subtract.130 = fsub float %param_2_049, %divide.45
  br label %concatenate.merge

concat_index_from_operand_id3:                    ; preds = %concat_index_not_from_operand2
  %24 = phi i32 [ 106, %concat_index_not_from_operand2 ]
  %25 = sub nsw i32 %3, %24
  %26 = mul nuw nsw i32 %25, 1
  %27 = add nuw nsw i32 0, %26
  %28 = urem i32 %27, 10
  %29 = udiv i32 %27, 10
  %30 = udiv i32 %29, 128
  %param_3_0 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg15.16.typed, i32 0, i32 %29, i32 %28
  %param_3_061 = load float, float* %param_3_0, align 4, !invariant.load !65
  %param_3_2 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %29, i32 %28
  %param_3_262 = load float, float* %param_3_2, align 4, !invariant.load !65
  %param_3_4 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %29, i32 %28
  %param_3_463 = load float, float* %param_3_4, align 4, !invariant.load !65
  %param_3_264 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %29, i32 %28
  %param_3_265 = load float, float* %param_3_264, align 4, !invariant.load !65
  %subtract.132 = fsub float %param_3_463, %param_3_265
  %31 = load float, float* bitcast ([4 x i8]* @118 to float*), align 4
  %param_3_3 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133 = fsub float %31, %param_3_3
  %multiply.108 = fmul float %subtract.132, %subtract.133
  %add.81 = fadd float %param_3_262, %multiply.108
  %param_3_1 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.109 = fmul float %add.81, %param_3_1
  %param_3_5 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %29, i32 %28
  %param_3_566 = load float, float* %param_3_5, align 4, !invariant.load !65
  %param_3_467 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %29, i32 %28
  %param_3_468 = load float, float* %param_3_467, align 4, !invariant.load !65
  %param_3_469 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %29, i32 %28
  %param_3_470 = load float, float* %param_3_469, align 4, !invariant.load !65
  %multiply.110 = fmul float %param_3_468, %param_3_470
  %param_3_571 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %29, i32 %28
  %param_3_572 = load float, float* %param_3_571, align 4, !invariant.load !65
  %subtract.134 = fsub float %multiply.110, %param_3_572
  %32 = load float, float* bitcast ([4 x i8]* @119 to float*), align 4
  %param_3_6 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135 = fsub float %32, %param_3_6
  %multiply.111 = fmul float %subtract.134, %subtract.135
  %add.82 = fadd float %param_3_566, %multiply.111
  %33 = call float @__nv_sqrtf(float %add.82)
  %34 = load float, float* bitcast ([4 x i8]* @120 to float*), align 4
  %add.83 = fadd float %33, %34
  %divide.46 = fdiv float %multiply.109, %add.83
  %subtract.136 = fsub float %param_3_061, %divide.46
  br label %concatenate.merge

concat_index_not_from_operand0:                   ; preds = %fusion.59.in_bounds-true
  %35 = icmp ult i32 %3, 96
  br i1 %35, label %concat_index_from_operand_id1, label %concat_index_not_from_operand1

concat_index_not_from_operand1:                   ; preds = %concat_index_not_from_operand0
  %36 = icmp ult i32 %3, 106
  br i1 %36, label %concat_index_from_operand_id2, label %concat_index_not_from_operand2

concat_index_not_from_operand2:                   ; preds = %concat_index_not_from_operand1
  %37 = icmp ult i32 %3, 1386
  br i1 %37, label %concat_index_from_operand_id3, label %concat_index_not_from_operand3

concat_index_not_from_operand3:                   ; preds = %concat_index_not_from_operand2
  unreachable

concatenate.merge:                                ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %38 = phi float [ %subtract.120, %concat_index_from_operand_id0 ], [ %subtract.125, %concat_index_from_operand_id1 ], [ %subtract.130, %concat_index_from_operand_id2 ], [ %subtract.136, %concat_index_from_operand_id3 ]
  %39 = icmp ult i32 %3, 32
  br i1 %39, label %concat_index_from_operand_id073, label %concat_index_not_from_operand0121

concat_index_from_operand_id073:                  ; preds = %concatenate.merge
  %40 = phi i32 [ 0, %concatenate.merge ]
  %41 = sub nsw i32 %3, %40
  %param_0_274 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %41
  %param_0_275 = load float, float* %param_0_274, align 4, !invariant.load !65
  %param_0_476 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %41
  %param_0_477 = load float, float* %param_0_476, align 4, !invariant.load !65
  %param_0_278 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %41
  %param_0_279 = load float, float* %param_0_278, align 4, !invariant.load !65
  %subtract.11680 = fsub float %param_0_477, %param_0_279
  %42 = load float, float* bitcast ([4 x i8]* @121 to float*), align 4
  %param_0_381 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.11782 = fsub float %42, %param_0_381
  %multiply.9683 = fmul float %subtract.11680, %subtract.11782
  %add.7184 = fadd float %param_0_275, %multiply.9683
  br label %concatenate.1.merge

concat_index_from_operand_id185:                  ; preds = %concat_index_not_from_operand0121
  %43 = phi i32 [ 32, %concat_index_not_from_operand0121 ]
  %44 = sub nsw i32 %3, %43
  %param_1_286 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %44
  %param_1_287 = load float, float* %param_1_286, align 4, !invariant.load !65
  %param_1_488 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %44
  %param_1_489 = load float, float* %param_1_488, align 4, !invariant.load !65
  %param_1_290 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %44
  %param_1_291 = load float, float* %param_1_290, align 4, !invariant.load !65
  %subtract.12192 = fsub float %param_1_489, %param_1_291
  %45 = load float, float* bitcast ([4 x i8]* @122 to float*), align 4
  %param_1_393 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.12294 = fsub float %45, %param_1_393
  %multiply.10095 = fmul float %subtract.12192, %subtract.12294
  %add.7496 = fadd float %param_1_287, %multiply.10095
  br label %concatenate.1.merge

concat_index_from_operand_id297:                  ; preds = %concat_index_not_from_operand1122
  %46 = phi i32 [ 96, %concat_index_not_from_operand1122 ]
  %47 = sub nsw i32 %3, %46
  %param_2_298 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %47
  %param_2_299 = load float, float* %param_2_298, align 4, !invariant.load !65
  %param_2_4100 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %47
  %param_2_4101 = load float, float* %param_2_4100, align 4, !invariant.load !65
  %param_2_2102 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %47
  %param_2_2103 = load float, float* %param_2_2102, align 4, !invariant.load !65
  %subtract.126104 = fsub float %param_2_4101, %param_2_2103
  %48 = load float, float* bitcast ([4 x i8]* @123 to float*), align 4
  %param_2_3105 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127106 = fsub float %48, %param_2_3105
  %multiply.104107 = fmul float %subtract.126104, %subtract.127106
  %add.77108 = fadd float %param_2_299, %multiply.104107
  br label %concatenate.1.merge

concat_index_from_operand_id3109:                 ; preds = %concat_index_not_from_operand2123
  %49 = phi i32 [ 106, %concat_index_not_from_operand2123 ]
  %50 = sub nsw i32 %3, %49
  %51 = mul nuw nsw i32 %50, 1
  %52 = add nuw nsw i32 0, %51
  %53 = urem i32 %52, 10
  %54 = udiv i32 %52, 10
  %55 = udiv i32 %54, 128
  %param_3_2110 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %54, i32 %53
  %param_3_2111 = load float, float* %param_3_2110, align 4, !invariant.load !65
  %param_3_4112 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %54, i32 %53
  %param_3_4113 = load float, float* %param_3_4112, align 4, !invariant.load !65
  %param_3_2114 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %54, i32 %53
  %param_3_2115 = load float, float* %param_3_2114, align 4, !invariant.load !65
  %subtract.132116 = fsub float %param_3_4113, %param_3_2115
  %56 = load float, float* bitcast ([4 x i8]* @124 to float*), align 4
  %param_3_3117 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133118 = fsub float %56, %param_3_3117
  %multiply.108119 = fmul float %subtract.132116, %subtract.133118
  %add.81120 = fadd float %param_3_2111, %multiply.108119
  br label %concatenate.1.merge

concat_index_not_from_operand0121:                ; preds = %concatenate.merge
  %57 = icmp ult i32 %3, 96
  br i1 %57, label %concat_index_from_operand_id185, label %concat_index_not_from_operand1122

concat_index_not_from_operand1122:                ; preds = %concat_index_not_from_operand0121
  %58 = icmp ult i32 %3, 106
  br i1 %58, label %concat_index_from_operand_id297, label %concat_index_not_from_operand2123

concat_index_not_from_operand2123:                ; preds = %concat_index_not_from_operand1122
  %59 = icmp ult i32 %3, 1386
  br i1 %59, label %concat_index_from_operand_id3109, label %concat_index_not_from_operand3124

concat_index_not_from_operand3124:                ; preds = %concat_index_not_from_operand2123
  unreachable

concatenate.1.merge:                              ; preds = %concat_index_from_operand_id3109, %concat_index_from_operand_id297, %concat_index_from_operand_id185, %concat_index_from_operand_id073
  %60 = phi float [ %add.7184, %concat_index_from_operand_id073 ], [ %add.7496, %concat_index_from_operand_id185 ], [ %add.77108, %concat_index_from_operand_id297 ], [ %add.81120, %concat_index_from_operand_id3109 ]
  %61 = icmp ult i32 %3, 32
  br i1 %61, label %concat_index_from_operand_id0125, label %concat_index_not_from_operand0185

concat_index_from_operand_id0125:                 ; preds = %concatenate.1.merge
  %62 = phi i32 [ 0, %concatenate.1.merge ]
  %63 = sub nsw i32 %3, %62
  %param_0_5126 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %63
  %param_0_5127 = load float, float* %param_0_5126, align 4, !invariant.load !65
  %param_0_4128 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %63
  %param_0_4129 = load float, float* %param_0_4128, align 4, !invariant.load !65
  %param_0_4130 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %63
  %param_0_4131 = load float, float* %param_0_4130, align 4, !invariant.load !65
  %multiply.98132 = fmul float %param_0_4129, %param_0_4131
  %param_0_5133 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %63
  %param_0_5134 = load float, float* %param_0_5133, align 4, !invariant.load !65
  %subtract.118135 = fsub float %multiply.98132, %param_0_5134
  %64 = load float, float* bitcast ([4 x i8]* @125 to float*), align 4
  %param_0_6136 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119137 = fsub float %64, %param_0_6136
  %multiply.99138 = fmul float %subtract.118135, %subtract.119137
  %add.72139 = fadd float %param_0_5127, %multiply.99138
  br label %concatenate.2.merge

concat_index_from_operand_id1140:                 ; preds = %concat_index_not_from_operand0185
  %65 = phi i32 [ 32, %concat_index_not_from_operand0185 ]
  %66 = sub nsw i32 %3, %65
  %param_1_5141 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %66
  %param_1_5142 = load float, float* %param_1_5141, align 4, !invariant.load !65
  %param_1_4143 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %66
  %param_1_4144 = load float, float* %param_1_4143, align 4, !invariant.load !65
  %param_1_4145 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %66
  %param_1_4146 = load float, float* %param_1_4145, align 4, !invariant.load !65
  %multiply.102147 = fmul float %param_1_4144, %param_1_4146
  %param_1_5148 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %66
  %param_1_5149 = load float, float* %param_1_5148, align 4, !invariant.load !65
  %subtract.123150 = fsub float %multiply.102147, %param_1_5149
  %67 = load float, float* bitcast ([4 x i8]* @126 to float*), align 4
  %param_1_6151 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124152 = fsub float %67, %param_1_6151
  %multiply.103153 = fmul float %subtract.123150, %subtract.124152
  %add.75154 = fadd float %param_1_5142, %multiply.103153
  br label %concatenate.2.merge

concat_index_from_operand_id2155:                 ; preds = %concat_index_not_from_operand1186
  %68 = phi i32 [ 96, %concat_index_not_from_operand1186 ]
  %69 = sub nsw i32 %3, %68
  %param_2_5156 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %69
  %param_2_5157 = load float, float* %param_2_5156, align 4, !invariant.load !65
  %param_2_4158 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %69
  %param_2_4159 = load float, float* %param_2_4158, align 4, !invariant.load !65
  %param_2_4160 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %69
  %param_2_4161 = load float, float* %param_2_4160, align 4, !invariant.load !65
  %multiply.106162 = fmul float %param_2_4159, %param_2_4161
  %param_2_5163 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %69
  %param_2_5164 = load float, float* %param_2_5163, align 4, !invariant.load !65
  %subtract.128165 = fsub float %multiply.106162, %param_2_5164
  %70 = load float, float* bitcast ([4 x i8]* @127 to float*), align 4
  %param_2_6166 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129167 = fsub float %70, %param_2_6166
  %multiply.107168 = fmul float %subtract.128165, %subtract.129167
  %add.79169 = fadd float %param_2_5157, %multiply.107168
  br label %concatenate.2.merge

concat_index_from_operand_id3170:                 ; preds = %concat_index_not_from_operand2187
  %71 = phi i32 [ 106, %concat_index_not_from_operand2187 ]
  %72 = sub nsw i32 %3, %71
  %73 = mul nuw nsw i32 %72, 1
  %74 = add nuw nsw i32 0, %73
  %75 = urem i32 %74, 10
  %76 = udiv i32 %74, 10
  %77 = udiv i32 %76, 128
  %param_3_5171 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %76, i32 %75
  %param_3_5172 = load float, float* %param_3_5171, align 4, !invariant.load !65
  %param_3_4173 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %76, i32 %75
  %param_3_4174 = load float, float* %param_3_4173, align 4, !invariant.load !65
  %param_3_4175 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %76, i32 %75
  %param_3_4176 = load float, float* %param_3_4175, align 4, !invariant.load !65
  %multiply.110177 = fmul float %param_3_4174, %param_3_4176
  %param_3_5178 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %76, i32 %75
  %param_3_5179 = load float, float* %param_3_5178, align 4, !invariant.load !65
  %subtract.134180 = fsub float %multiply.110177, %param_3_5179
  %78 = load float, float* bitcast ([4 x i8]* @128 to float*), align 4
  %param_3_6181 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135182 = fsub float %78, %param_3_6181
  %multiply.111183 = fmul float %subtract.134180, %subtract.135182
  %add.82184 = fadd float %param_3_5172, %multiply.111183
  br label %concatenate.2.merge

concat_index_not_from_operand0185:                ; preds = %concatenate.1.merge
  %79 = icmp ult i32 %3, 96
  br i1 %79, label %concat_index_from_operand_id1140, label %concat_index_not_from_operand1186

concat_index_not_from_operand1186:                ; preds = %concat_index_not_from_operand0185
  %80 = icmp ult i32 %3, 106
  br i1 %80, label %concat_index_from_operand_id2155, label %concat_index_not_from_operand2187

concat_index_not_from_operand2187:                ; preds = %concat_index_not_from_operand1186
  %81 = icmp ult i32 %3, 1386
  br i1 %81, label %concat_index_from_operand_id3170, label %concat_index_not_from_operand3188

concat_index_not_from_operand3188:                ; preds = %concat_index_not_from_operand2187
  unreachable

concatenate.2.merge:                              ; preds = %concat_index_from_operand_id3170, %concat_index_from_operand_id2155, %concat_index_from_operand_id1140, %concat_index_from_operand_id0125
  %82 = phi float [ %add.72139, %concat_index_from_operand_id0125 ], [ %add.75154, %concat_index_from_operand_id1140 ], [ %add.79169, %concat_index_from_operand_id2155 ], [ %add.82184, %concat_index_from_operand_id3170 ]
  %83 = icmp ult i32 %3, 32
  br i1 %83, label %concat_index_from_operand_id0190, label %concat_index_not_from_operand0322

concat_index_from_operand_id0190:                 ; preds = %concatenate.2.merge
  %84 = phi i32 [ 0, %concatenate.2.merge ]
  %85 = sub nsw i32 %3, %84
  %param_0_0191 = getelementptr inbounds [32 x float], [32 x float]* %arg6.7.typed, i32 0, i32 %85
  %param_0_0192 = load float, float* %param_0_0191, align 4, !invariant.load !65
  %param_0_2193 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %85
  %param_0_2194 = load float, float* %param_0_2193, align 4, !invariant.load !65
  %param_0_4195 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %85
  %param_0_4196 = load float, float* %param_0_4195, align 4, !invariant.load !65
  %param_0_2197 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %85
  %param_0_2198 = load float, float* %param_0_2197, align 4, !invariant.load !65
  %subtract.116199 = fsub float %param_0_4196, %param_0_2198
  %86 = load float, float* bitcast ([4 x i8]* @129 to float*), align 4
  %param_0_3200 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117201 = fsub float %86, %param_0_3200
  %multiply.96202 = fmul float %subtract.116199, %subtract.117201
  %add.71203 = fadd float %param_0_2194, %multiply.96202
  %param_0_1204 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.97205 = fmul float %add.71203, %param_0_1204
  %param_0_5206 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %85
  %param_0_5207 = load float, float* %param_0_5206, align 4, !invariant.load !65
  %param_0_4208 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %85
  %param_0_4209 = load float, float* %param_0_4208, align 4, !invariant.load !65
  %param_0_4210 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %85
  %param_0_4211 = load float, float* %param_0_4210, align 4, !invariant.load !65
  %multiply.98212 = fmul float %param_0_4209, %param_0_4211
  %param_0_5213 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %85
  %param_0_5214 = load float, float* %param_0_5213, align 4, !invariant.load !65
  %subtract.118215 = fsub float %multiply.98212, %param_0_5214
  %87 = load float, float* bitcast ([4 x i8]* @130 to float*), align 4
  %param_0_6216 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119217 = fsub float %87, %param_0_6216
  %multiply.99218 = fmul float %subtract.118215, %subtract.119217
  %add.72219 = fadd float %param_0_5207, %multiply.99218
  %88 = call float @__nv_sqrtf(float %add.72219)
  %89 = load float, float* bitcast ([4 x i8]* @131 to float*), align 4
  %add.73220 = fadd float %88, %89
  %divide.43221 = fdiv float %multiply.97205, %add.73220
  %subtract.120222 = fsub float %param_0_0192, %divide.43221
  br label %concatenate.merge189

concat_index_from_operand_id1223:                 ; preds = %concat_index_not_from_operand0322
  %90 = phi i32 [ 32, %concat_index_not_from_operand0322 ]
  %91 = sub nsw i32 %3, %90
  %param_1_0224 = getelementptr inbounds [64 x float], [64 x float]* %arg8.9.typed, i32 0, i32 %91
  %param_1_0225 = load float, float* %param_1_0224, align 4, !invariant.load !65
  %param_1_2226 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %91
  %param_1_2227 = load float, float* %param_1_2226, align 4, !invariant.load !65
  %param_1_4228 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %91
  %param_1_4229 = load float, float* %param_1_4228, align 4, !invariant.load !65
  %param_1_2230 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %91
  %param_1_2231 = load float, float* %param_1_2230, align 4, !invariant.load !65
  %subtract.121232 = fsub float %param_1_4229, %param_1_2231
  %92 = load float, float* bitcast ([4 x i8]* @132 to float*), align 4
  %param_1_3233 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122234 = fsub float %92, %param_1_3233
  %multiply.100235 = fmul float %subtract.121232, %subtract.122234
  %add.74236 = fadd float %param_1_2227, %multiply.100235
  %param_1_1237 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.101238 = fmul float %add.74236, %param_1_1237
  %param_1_5239 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %91
  %param_1_5240 = load float, float* %param_1_5239, align 4, !invariant.load !65
  %param_1_4241 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %91
  %param_1_4242 = load float, float* %param_1_4241, align 4, !invariant.load !65
  %param_1_4243 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %91
  %param_1_4244 = load float, float* %param_1_4243, align 4, !invariant.load !65
  %multiply.102245 = fmul float %param_1_4242, %param_1_4244
  %param_1_5246 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %91
  %param_1_5247 = load float, float* %param_1_5246, align 4, !invariant.load !65
  %subtract.123248 = fsub float %multiply.102245, %param_1_5247
  %93 = load float, float* bitcast ([4 x i8]* @133 to float*), align 4
  %param_1_6249 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124250 = fsub float %93, %param_1_6249
  %multiply.103251 = fmul float %subtract.123248, %subtract.124250
  %add.75252 = fadd float %param_1_5240, %multiply.103251
  %94 = call float @__nv_sqrtf(float %add.75252)
  %95 = load float, float* bitcast ([4 x i8]* @134 to float*), align 4
  %add.76253 = fadd float %94, %95
  %divide.44254 = fdiv float %multiply.101238, %add.76253
  %subtract.125255 = fsub float %param_1_0225, %divide.44254
  br label %concatenate.merge189

concat_index_from_operand_id2256:                 ; preds = %concat_index_not_from_operand1323
  %96 = phi i32 [ 96, %concat_index_not_from_operand1323 ]
  %97 = sub nsw i32 %3, %96
  %param_2_0257 = getelementptr inbounds [10 x float], [10 x float]* %arg14.15.typed, i32 0, i32 %97
  %param_2_0258 = load float, float* %param_2_0257, align 4, !invariant.load !65
  %param_2_2259 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %97
  %param_2_2260 = load float, float* %param_2_2259, align 4, !invariant.load !65
  %param_2_4261 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %97
  %param_2_4262 = load float, float* %param_2_4261, align 4, !invariant.load !65
  %param_2_2263 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %97
  %param_2_2264 = load float, float* %param_2_2263, align 4, !invariant.load !65
  %subtract.126265 = fsub float %param_2_4262, %param_2_2264
  %98 = load float, float* bitcast ([4 x i8]* @135 to float*), align 4
  %param_2_3266 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127267 = fsub float %98, %param_2_3266
  %multiply.104268 = fmul float %subtract.126265, %subtract.127267
  %add.77269 = fadd float %param_2_2260, %multiply.104268
  %param_2_1270 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.105271 = fmul float %add.77269, %param_2_1270
  %param_2_5272 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %97
  %param_2_5273 = load float, float* %param_2_5272, align 4, !invariant.load !65
  %param_2_4274 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %97
  %param_2_4275 = load float, float* %param_2_4274, align 4, !invariant.load !65
  %param_2_4276 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %97
  %param_2_4277 = load float, float* %param_2_4276, align 4, !invariant.load !65
  %multiply.106278 = fmul float %param_2_4275, %param_2_4277
  %param_2_5279 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %97
  %param_2_5280 = load float, float* %param_2_5279, align 4, !invariant.load !65
  %subtract.128281 = fsub float %multiply.106278, %param_2_5280
  %99 = load float, float* bitcast ([4 x i8]* @136 to float*), align 4
  %param_2_6282 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129283 = fsub float %99, %param_2_6282
  %multiply.107284 = fmul float %subtract.128281, %subtract.129283
  %add.79285 = fadd float %param_2_5273, %multiply.107284
  %100 = call float @__nv_sqrtf(float %add.79285)
  %101 = load float, float* bitcast ([4 x i8]* @137 to float*), align 4
  %add.80286 = fadd float %100, %101
  %divide.45287 = fdiv float %multiply.105271, %add.80286
  %subtract.130288 = fsub float %param_2_0258, %divide.45287
  br label %concatenate.merge189

concat_index_from_operand_id3289:                 ; preds = %concat_index_not_from_operand2324
  %102 = phi i32 [ 106, %concat_index_not_from_operand2324 ]
  %103 = sub nsw i32 %3, %102
  %104 = mul nuw nsw i32 %103, 1
  %105 = add nuw nsw i32 0, %104
  %106 = urem i32 %105, 10
  %107 = udiv i32 %105, 10
  %108 = udiv i32 %107, 128
  %param_3_0290 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg15.16.typed, i32 0, i32 %107, i32 %106
  %param_3_0291 = load float, float* %param_3_0290, align 4, !invariant.load !65
  %param_3_2292 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %107, i32 %106
  %param_3_2293 = load float, float* %param_3_2292, align 4, !invariant.load !65
  %param_3_4294 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %107, i32 %106
  %param_3_4295 = load float, float* %param_3_4294, align 4, !invariant.load !65
  %param_3_2296 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %107, i32 %106
  %param_3_2297 = load float, float* %param_3_2296, align 4, !invariant.load !65
  %subtract.132298 = fsub float %param_3_4295, %param_3_2297
  %109 = load float, float* bitcast ([4 x i8]* @138 to float*), align 4
  %param_3_3299 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133300 = fsub float %109, %param_3_3299
  %multiply.108301 = fmul float %subtract.132298, %subtract.133300
  %add.81302 = fadd float %param_3_2293, %multiply.108301
  %param_3_1303 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.109304 = fmul float %add.81302, %param_3_1303
  %param_3_5305 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %107, i32 %106
  %param_3_5306 = load float, float* %param_3_5305, align 4, !invariant.load !65
  %param_3_4307 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %107, i32 %106
  %param_3_4308 = load float, float* %param_3_4307, align 4, !invariant.load !65
  %param_3_4309 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %107, i32 %106
  %param_3_4310 = load float, float* %param_3_4309, align 4, !invariant.load !65
  %multiply.110311 = fmul float %param_3_4308, %param_3_4310
  %param_3_5312 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %107, i32 %106
  %param_3_5313 = load float, float* %param_3_5312, align 4, !invariant.load !65
  %subtract.134314 = fsub float %multiply.110311, %param_3_5313
  %110 = load float, float* bitcast ([4 x i8]* @139 to float*), align 4
  %param_3_6315 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135316 = fsub float %110, %param_3_6315
  %multiply.111317 = fmul float %subtract.134314, %subtract.135316
  %add.82318 = fadd float %param_3_5306, %multiply.111317
  %111 = call float @__nv_sqrtf(float %add.82318)
  %112 = load float, float* bitcast ([4 x i8]* @140 to float*), align 4
  %add.83319 = fadd float %111, %112
  %divide.46320 = fdiv float %multiply.109304, %add.83319
  %subtract.136321 = fsub float %param_3_0291, %divide.46320
  br label %concatenate.merge189

concat_index_not_from_operand0322:                ; preds = %concatenate.2.merge
  %113 = icmp ult i32 %3, 96
  br i1 %113, label %concat_index_from_operand_id1223, label %concat_index_not_from_operand1323

concat_index_not_from_operand1323:                ; preds = %concat_index_not_from_operand0322
  %114 = icmp ult i32 %3, 106
  br i1 %114, label %concat_index_from_operand_id2256, label %concat_index_not_from_operand2324

concat_index_not_from_operand2324:                ; preds = %concat_index_not_from_operand1323
  %115 = icmp ult i32 %3, 1386
  br i1 %115, label %concat_index_from_operand_id3289, label %concat_index_not_from_operand3325

concat_index_not_from_operand3325:                ; preds = %concat_index_not_from_operand2324
  unreachable

concatenate.merge189:                             ; preds = %concat_index_from_operand_id3289, %concat_index_from_operand_id2256, %concat_index_from_operand_id1223, %concat_index_from_operand_id0190
  %116 = phi float [ %subtract.120222, %concat_index_from_operand_id0190 ], [ %subtract.125255, %concat_index_from_operand_id1223 ], [ %subtract.130288, %concat_index_from_operand_id2256 ], [ %subtract.136321, %concat_index_from_operand_id3289 ]
  %117 = icmp ult i32 %3, 32
  br i1 %117, label %concat_index_from_operand_id0327, label %concat_index_not_from_operand0375

concat_index_from_operand_id0327:                 ; preds = %concatenate.merge189
  %118 = phi i32 [ 0, %concatenate.merge189 ]
  %119 = sub nsw i32 %3, %118
  %param_0_2328 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %119
  %param_0_2329 = load float, float* %param_0_2328, align 4, !invariant.load !65
  %param_0_4330 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %119
  %param_0_4331 = load float, float* %param_0_4330, align 4, !invariant.load !65
  %param_0_2332 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %119
  %param_0_2333 = load float, float* %param_0_2332, align 4, !invariant.load !65
  %subtract.116334 = fsub float %param_0_4331, %param_0_2333
  %120 = load float, float* bitcast ([4 x i8]* @141 to float*), align 4
  %param_0_3335 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117336 = fsub float %120, %param_0_3335
  %multiply.96337 = fmul float %subtract.116334, %subtract.117336
  %add.71338 = fadd float %param_0_2329, %multiply.96337
  br label %concatenate.1.merge326

concat_index_from_operand_id1339:                 ; preds = %concat_index_not_from_operand0375
  %121 = phi i32 [ 32, %concat_index_not_from_operand0375 ]
  %122 = sub nsw i32 %3, %121
  %param_1_2340 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %122
  %param_1_2341 = load float, float* %param_1_2340, align 4, !invariant.load !65
  %param_1_4342 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %122
  %param_1_4343 = load float, float* %param_1_4342, align 4, !invariant.load !65
  %param_1_2344 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %122
  %param_1_2345 = load float, float* %param_1_2344, align 4, !invariant.load !65
  %subtract.121346 = fsub float %param_1_4343, %param_1_2345
  %123 = load float, float* bitcast ([4 x i8]* @142 to float*), align 4
  %param_1_3347 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122348 = fsub float %123, %param_1_3347
  %multiply.100349 = fmul float %subtract.121346, %subtract.122348
  %add.74350 = fadd float %param_1_2341, %multiply.100349
  br label %concatenate.1.merge326

concat_index_from_operand_id2351:                 ; preds = %concat_index_not_from_operand1376
  %124 = phi i32 [ 96, %concat_index_not_from_operand1376 ]
  %125 = sub nsw i32 %3, %124
  %param_2_2352 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %125
  %param_2_2353 = load float, float* %param_2_2352, align 4, !invariant.load !65
  %param_2_4354 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %125
  %param_2_4355 = load float, float* %param_2_4354, align 4, !invariant.load !65
  %param_2_2356 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %125
  %param_2_2357 = load float, float* %param_2_2356, align 4, !invariant.load !65
  %subtract.126358 = fsub float %param_2_4355, %param_2_2357
  %126 = load float, float* bitcast ([4 x i8]* @143 to float*), align 4
  %param_2_3359 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127360 = fsub float %126, %param_2_3359
  %multiply.104361 = fmul float %subtract.126358, %subtract.127360
  %add.77362 = fadd float %param_2_2353, %multiply.104361
  br label %concatenate.1.merge326

concat_index_from_operand_id3363:                 ; preds = %concat_index_not_from_operand2377
  %127 = phi i32 [ 106, %concat_index_not_from_operand2377 ]
  %128 = sub nsw i32 %3, %127
  %129 = mul nuw nsw i32 %128, 1
  %130 = add nuw nsw i32 0, %129
  %131 = urem i32 %130, 10
  %132 = udiv i32 %130, 10
  %133 = udiv i32 %132, 128
  %param_3_2364 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %132, i32 %131
  %param_3_2365 = load float, float* %param_3_2364, align 4, !invariant.load !65
  %param_3_4366 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %132, i32 %131
  %param_3_4367 = load float, float* %param_3_4366, align 4, !invariant.load !65
  %param_3_2368 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %132, i32 %131
  %param_3_2369 = load float, float* %param_3_2368, align 4, !invariant.load !65
  %subtract.132370 = fsub float %param_3_4367, %param_3_2369
  %134 = load float, float* bitcast ([4 x i8]* @144 to float*), align 4
  %param_3_3371 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133372 = fsub float %134, %param_3_3371
  %multiply.108373 = fmul float %subtract.132370, %subtract.133372
  %add.81374 = fadd float %param_3_2365, %multiply.108373
  br label %concatenate.1.merge326

concat_index_not_from_operand0375:                ; preds = %concatenate.merge189
  %135 = icmp ult i32 %3, 96
  br i1 %135, label %concat_index_from_operand_id1339, label %concat_index_not_from_operand1376

concat_index_not_from_operand1376:                ; preds = %concat_index_not_from_operand0375
  %136 = icmp ult i32 %3, 106
  br i1 %136, label %concat_index_from_operand_id2351, label %concat_index_not_from_operand2377

concat_index_not_from_operand2377:                ; preds = %concat_index_not_from_operand1376
  %137 = icmp ult i32 %3, 1386
  br i1 %137, label %concat_index_from_operand_id3363, label %concat_index_not_from_operand3378

concat_index_not_from_operand3378:                ; preds = %concat_index_not_from_operand2377
  unreachable

concatenate.1.merge326:                           ; preds = %concat_index_from_operand_id3363, %concat_index_from_operand_id2351, %concat_index_from_operand_id1339, %concat_index_from_operand_id0327
  %138 = phi float [ %add.71338, %concat_index_from_operand_id0327 ], [ %add.74350, %concat_index_from_operand_id1339 ], [ %add.77362, %concat_index_from_operand_id2351 ], [ %add.81374, %concat_index_from_operand_id3363 ]
  %139 = icmp ult i32 %3, 32
  br i1 %139, label %concat_index_from_operand_id0380, label %concat_index_not_from_operand0440

concat_index_from_operand_id0380:                 ; preds = %concatenate.1.merge326
  %140 = phi i32 [ 0, %concatenate.1.merge326 ]
  %141 = sub nsw i32 %3, %140
  %param_0_5381 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %141
  %param_0_5382 = load float, float* %param_0_5381, align 4, !invariant.load !65
  %param_0_4383 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %141
  %param_0_4384 = load float, float* %param_0_4383, align 4, !invariant.load !65
  %param_0_4385 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %141
  %param_0_4386 = load float, float* %param_0_4385, align 4, !invariant.load !65
  %multiply.98387 = fmul float %param_0_4384, %param_0_4386
  %param_0_5388 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %141
  %param_0_5389 = load float, float* %param_0_5388, align 4, !invariant.load !65
  %subtract.118390 = fsub float %multiply.98387, %param_0_5389
  %142 = load float, float* bitcast ([4 x i8]* @145 to float*), align 4
  %param_0_6391 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119392 = fsub float %142, %param_0_6391
  %multiply.99393 = fmul float %subtract.118390, %subtract.119392
  %add.72394 = fadd float %param_0_5382, %multiply.99393
  br label %concatenate.2.merge379

concat_index_from_operand_id1395:                 ; preds = %concat_index_not_from_operand0440
  %143 = phi i32 [ 32, %concat_index_not_from_operand0440 ]
  %144 = sub nsw i32 %3, %143
  %param_1_5396 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %144
  %param_1_5397 = load float, float* %param_1_5396, align 4, !invariant.load !65
  %param_1_4398 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %144
  %param_1_4399 = load float, float* %param_1_4398, align 4, !invariant.load !65
  %param_1_4400 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %144
  %param_1_4401 = load float, float* %param_1_4400, align 4, !invariant.load !65
  %multiply.102402 = fmul float %param_1_4399, %param_1_4401
  %param_1_5403 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %144
  %param_1_5404 = load float, float* %param_1_5403, align 4, !invariant.load !65
  %subtract.123405 = fsub float %multiply.102402, %param_1_5404
  %145 = load float, float* bitcast ([4 x i8]* @146 to float*), align 4
  %param_1_6406 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124407 = fsub float %145, %param_1_6406
  %multiply.103408 = fmul float %subtract.123405, %subtract.124407
  %add.75409 = fadd float %param_1_5397, %multiply.103408
  br label %concatenate.2.merge379

concat_index_from_operand_id2410:                 ; preds = %concat_index_not_from_operand1441
  %146 = phi i32 [ 96, %concat_index_not_from_operand1441 ]
  %147 = sub nsw i32 %3, %146
  %param_2_5411 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %147
  %param_2_5412 = load float, float* %param_2_5411, align 4, !invariant.load !65
  %param_2_4413 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %147
  %param_2_4414 = load float, float* %param_2_4413, align 4, !invariant.load !65
  %param_2_4415 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %147
  %param_2_4416 = load float, float* %param_2_4415, align 4, !invariant.load !65
  %multiply.106417 = fmul float %param_2_4414, %param_2_4416
  %param_2_5418 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %147
  %param_2_5419 = load float, float* %param_2_5418, align 4, !invariant.load !65
  %subtract.128420 = fsub float %multiply.106417, %param_2_5419
  %148 = load float, float* bitcast ([4 x i8]* @147 to float*), align 4
  %param_2_6421 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129422 = fsub float %148, %param_2_6421
  %multiply.107423 = fmul float %subtract.128420, %subtract.129422
  %add.79424 = fadd float %param_2_5412, %multiply.107423
  br label %concatenate.2.merge379

concat_index_from_operand_id3425:                 ; preds = %concat_index_not_from_operand2442
  %149 = phi i32 [ 106, %concat_index_not_from_operand2442 ]
  %150 = sub nsw i32 %3, %149
  %151 = mul nuw nsw i32 %150, 1
  %152 = add nuw nsw i32 0, %151
  %153 = urem i32 %152, 10
  %154 = udiv i32 %152, 10
  %155 = udiv i32 %154, 128
  %param_3_5426 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %154, i32 %153
  %param_3_5427 = load float, float* %param_3_5426, align 4, !invariant.load !65
  %param_3_4428 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %154, i32 %153
  %param_3_4429 = load float, float* %param_3_4428, align 4, !invariant.load !65
  %param_3_4430 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %154, i32 %153
  %param_3_4431 = load float, float* %param_3_4430, align 4, !invariant.load !65
  %multiply.110432 = fmul float %param_3_4429, %param_3_4431
  %param_3_5433 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %154, i32 %153
  %param_3_5434 = load float, float* %param_3_5433, align 4, !invariant.load !65
  %subtract.134435 = fsub float %multiply.110432, %param_3_5434
  %156 = load float, float* bitcast ([4 x i8]* @148 to float*), align 4
  %param_3_6436 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135437 = fsub float %156, %param_3_6436
  %multiply.111438 = fmul float %subtract.134435, %subtract.135437
  %add.82439 = fadd float %param_3_5427, %multiply.111438
  br label %concatenate.2.merge379

concat_index_not_from_operand0440:                ; preds = %concatenate.1.merge326
  %157 = icmp ult i32 %3, 96
  br i1 %157, label %concat_index_from_operand_id1395, label %concat_index_not_from_operand1441

concat_index_not_from_operand1441:                ; preds = %concat_index_not_from_operand0440
  %158 = icmp ult i32 %3, 106
  br i1 %158, label %concat_index_from_operand_id2410, label %concat_index_not_from_operand2442

concat_index_not_from_operand2442:                ; preds = %concat_index_not_from_operand1441
  %159 = icmp ult i32 %3, 1386
  br i1 %159, label %concat_index_from_operand_id3425, label %concat_index_not_from_operand3443

concat_index_not_from_operand3443:                ; preds = %concat_index_not_from_operand2442
  unreachable

concatenate.2.merge379:                           ; preds = %concat_index_from_operand_id3425, %concat_index_from_operand_id2410, %concat_index_from_operand_id1395, %concat_index_from_operand_id0380
  %160 = phi float [ %add.72394, %concat_index_from_operand_id0380 ], [ %add.75409, %concat_index_from_operand_id1395 ], [ %add.79424, %concat_index_from_operand_id2410 ], [ %add.82439, %concat_index_from_operand_id3425 ]
  %161 = icmp ult i32 %3, 32
  br i1 %161, label %concat_index_from_operand_id0445, label %concat_index_not_from_operand0577

concat_index_from_operand_id0445:                 ; preds = %concatenate.2.merge379
  %162 = phi i32 [ 0, %concatenate.2.merge379 ]
  %163 = sub nsw i32 %3, %162
  %param_0_0446 = getelementptr inbounds [32 x float], [32 x float]* %arg6.7.typed, i32 0, i32 %163
  %param_0_0447 = load float, float* %param_0_0446, align 4, !invariant.load !65
  %param_0_2448 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %163
  %param_0_2449 = load float, float* %param_0_2448, align 4, !invariant.load !65
  %param_0_4450 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %163
  %param_0_4451 = load float, float* %param_0_4450, align 4, !invariant.load !65
  %param_0_2452 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %163
  %param_0_2453 = load float, float* %param_0_2452, align 4, !invariant.load !65
  %subtract.116454 = fsub float %param_0_4451, %param_0_2453
  %164 = load float, float* bitcast ([4 x i8]* @149 to float*), align 4
  %param_0_3455 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117456 = fsub float %164, %param_0_3455
  %multiply.96457 = fmul float %subtract.116454, %subtract.117456
  %add.71458 = fadd float %param_0_2449, %multiply.96457
  %param_0_1459 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.97460 = fmul float %add.71458, %param_0_1459
  %param_0_5461 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %163
  %param_0_5462 = load float, float* %param_0_5461, align 4, !invariant.load !65
  %param_0_4463 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %163
  %param_0_4464 = load float, float* %param_0_4463, align 4, !invariant.load !65
  %param_0_4465 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %163
  %param_0_4466 = load float, float* %param_0_4465, align 4, !invariant.load !65
  %multiply.98467 = fmul float %param_0_4464, %param_0_4466
  %param_0_5468 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %163
  %param_0_5469 = load float, float* %param_0_5468, align 4, !invariant.load !65
  %subtract.118470 = fsub float %multiply.98467, %param_0_5469
  %165 = load float, float* bitcast ([4 x i8]* @150 to float*), align 4
  %param_0_6471 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119472 = fsub float %165, %param_0_6471
  %multiply.99473 = fmul float %subtract.118470, %subtract.119472
  %add.72474 = fadd float %param_0_5462, %multiply.99473
  %166 = call float @__nv_sqrtf(float %add.72474)
  %167 = load float, float* bitcast ([4 x i8]* @151 to float*), align 4
  %add.73475 = fadd float %166, %167
  %divide.43476 = fdiv float %multiply.97460, %add.73475
  %subtract.120477 = fsub float %param_0_0447, %divide.43476
  br label %concatenate.merge444

concat_index_from_operand_id1478:                 ; preds = %concat_index_not_from_operand0577
  %168 = phi i32 [ 32, %concat_index_not_from_operand0577 ]
  %169 = sub nsw i32 %3, %168
  %param_1_0479 = getelementptr inbounds [64 x float], [64 x float]* %arg8.9.typed, i32 0, i32 %169
  %param_1_0480 = load float, float* %param_1_0479, align 4, !invariant.load !65
  %param_1_2481 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %169
  %param_1_2482 = load float, float* %param_1_2481, align 4, !invariant.load !65
  %param_1_4483 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %169
  %param_1_4484 = load float, float* %param_1_4483, align 4, !invariant.load !65
  %param_1_2485 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %169
  %param_1_2486 = load float, float* %param_1_2485, align 4, !invariant.load !65
  %subtract.121487 = fsub float %param_1_4484, %param_1_2486
  %170 = load float, float* bitcast ([4 x i8]* @152 to float*), align 4
  %param_1_3488 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122489 = fsub float %170, %param_1_3488
  %multiply.100490 = fmul float %subtract.121487, %subtract.122489
  %add.74491 = fadd float %param_1_2482, %multiply.100490
  %param_1_1492 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.101493 = fmul float %add.74491, %param_1_1492
  %param_1_5494 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %169
  %param_1_5495 = load float, float* %param_1_5494, align 4, !invariant.load !65
  %param_1_4496 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %169
  %param_1_4497 = load float, float* %param_1_4496, align 4, !invariant.load !65
  %param_1_4498 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %169
  %param_1_4499 = load float, float* %param_1_4498, align 4, !invariant.load !65
  %multiply.102500 = fmul float %param_1_4497, %param_1_4499
  %param_1_5501 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %169
  %param_1_5502 = load float, float* %param_1_5501, align 4, !invariant.load !65
  %subtract.123503 = fsub float %multiply.102500, %param_1_5502
  %171 = load float, float* bitcast ([4 x i8]* @153 to float*), align 4
  %param_1_6504 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124505 = fsub float %171, %param_1_6504
  %multiply.103506 = fmul float %subtract.123503, %subtract.124505
  %add.75507 = fadd float %param_1_5495, %multiply.103506
  %172 = call float @__nv_sqrtf(float %add.75507)
  %173 = load float, float* bitcast ([4 x i8]* @154 to float*), align 4
  %add.76508 = fadd float %172, %173
  %divide.44509 = fdiv float %multiply.101493, %add.76508
  %subtract.125510 = fsub float %param_1_0480, %divide.44509
  br label %concatenate.merge444

concat_index_from_operand_id2511:                 ; preds = %concat_index_not_from_operand1578
  %174 = phi i32 [ 96, %concat_index_not_from_operand1578 ]
  %175 = sub nsw i32 %3, %174
  %param_2_0512 = getelementptr inbounds [10 x float], [10 x float]* %arg14.15.typed, i32 0, i32 %175
  %param_2_0513 = load float, float* %param_2_0512, align 4, !invariant.load !65
  %param_2_2514 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %175
  %param_2_2515 = load float, float* %param_2_2514, align 4, !invariant.load !65
  %param_2_4516 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %175
  %param_2_4517 = load float, float* %param_2_4516, align 4, !invariant.load !65
  %param_2_2518 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %175
  %param_2_2519 = load float, float* %param_2_2518, align 4, !invariant.load !65
  %subtract.126520 = fsub float %param_2_4517, %param_2_2519
  %176 = load float, float* bitcast ([4 x i8]* @155 to float*), align 4
  %param_2_3521 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127522 = fsub float %176, %param_2_3521
  %multiply.104523 = fmul float %subtract.126520, %subtract.127522
  %add.77524 = fadd float %param_2_2515, %multiply.104523
  %param_2_1525 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.105526 = fmul float %add.77524, %param_2_1525
  %param_2_5527 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %175
  %param_2_5528 = load float, float* %param_2_5527, align 4, !invariant.load !65
  %param_2_4529 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %175
  %param_2_4530 = load float, float* %param_2_4529, align 4, !invariant.load !65
  %param_2_4531 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %175
  %param_2_4532 = load float, float* %param_2_4531, align 4, !invariant.load !65
  %multiply.106533 = fmul float %param_2_4530, %param_2_4532
  %param_2_5534 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %175
  %param_2_5535 = load float, float* %param_2_5534, align 4, !invariant.load !65
  %subtract.128536 = fsub float %multiply.106533, %param_2_5535
  %177 = load float, float* bitcast ([4 x i8]* @156 to float*), align 4
  %param_2_6537 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129538 = fsub float %177, %param_2_6537
  %multiply.107539 = fmul float %subtract.128536, %subtract.129538
  %add.79540 = fadd float %param_2_5528, %multiply.107539
  %178 = call float @__nv_sqrtf(float %add.79540)
  %179 = load float, float* bitcast ([4 x i8]* @157 to float*), align 4
  %add.80541 = fadd float %178, %179
  %divide.45542 = fdiv float %multiply.105526, %add.80541
  %subtract.130543 = fsub float %param_2_0513, %divide.45542
  br label %concatenate.merge444

concat_index_from_operand_id3544:                 ; preds = %concat_index_not_from_operand2579
  %180 = phi i32 [ 106, %concat_index_not_from_operand2579 ]
  %181 = sub nsw i32 %3, %180
  %182 = mul nuw nsw i32 %181, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 10
  %185 = udiv i32 %183, 10
  %186 = udiv i32 %185, 128
  %param_3_0545 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg15.16.typed, i32 0, i32 %185, i32 %184
  %param_3_0546 = load float, float* %param_3_0545, align 4, !invariant.load !65
  %param_3_2547 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %185, i32 %184
  %param_3_2548 = load float, float* %param_3_2547, align 4, !invariant.load !65
  %param_3_4549 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %185, i32 %184
  %param_3_4550 = load float, float* %param_3_4549, align 4, !invariant.load !65
  %param_3_2551 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %185, i32 %184
  %param_3_2552 = load float, float* %param_3_2551, align 4, !invariant.load !65
  %subtract.132553 = fsub float %param_3_4550, %param_3_2552
  %187 = load float, float* bitcast ([4 x i8]* @158 to float*), align 4
  %param_3_3554 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133555 = fsub float %187, %param_3_3554
  %multiply.108556 = fmul float %subtract.132553, %subtract.133555
  %add.81557 = fadd float %param_3_2548, %multiply.108556
  %param_3_1558 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.109559 = fmul float %add.81557, %param_3_1558
  %param_3_5560 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %185, i32 %184
  %param_3_5561 = load float, float* %param_3_5560, align 4, !invariant.load !65
  %param_3_4562 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %185, i32 %184
  %param_3_4563 = load float, float* %param_3_4562, align 4, !invariant.load !65
  %param_3_4564 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %185, i32 %184
  %param_3_4565 = load float, float* %param_3_4564, align 4, !invariant.load !65
  %multiply.110566 = fmul float %param_3_4563, %param_3_4565
  %param_3_5567 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %185, i32 %184
  %param_3_5568 = load float, float* %param_3_5567, align 4, !invariant.load !65
  %subtract.134569 = fsub float %multiply.110566, %param_3_5568
  %188 = load float, float* bitcast ([4 x i8]* @159 to float*), align 4
  %param_3_6570 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135571 = fsub float %188, %param_3_6570
  %multiply.111572 = fmul float %subtract.134569, %subtract.135571
  %add.82573 = fadd float %param_3_5561, %multiply.111572
  %189 = call float @__nv_sqrtf(float %add.82573)
  %190 = load float, float* bitcast ([4 x i8]* @160 to float*), align 4
  %add.83574 = fadd float %189, %190
  %divide.46575 = fdiv float %multiply.109559, %add.83574
  %subtract.136576 = fsub float %param_3_0546, %divide.46575
  br label %concatenate.merge444

concat_index_not_from_operand0577:                ; preds = %concatenate.2.merge379
  %191 = icmp ult i32 %3, 96
  br i1 %191, label %concat_index_from_operand_id1478, label %concat_index_not_from_operand1578

concat_index_not_from_operand1578:                ; preds = %concat_index_not_from_operand0577
  %192 = icmp ult i32 %3, 106
  br i1 %192, label %concat_index_from_operand_id2511, label %concat_index_not_from_operand2579

concat_index_not_from_operand2579:                ; preds = %concat_index_not_from_operand1578
  %193 = icmp ult i32 %3, 1386
  br i1 %193, label %concat_index_from_operand_id3544, label %concat_index_not_from_operand3580

concat_index_not_from_operand3580:                ; preds = %concat_index_not_from_operand2579
  unreachable

concatenate.merge444:                             ; preds = %concat_index_from_operand_id3544, %concat_index_from_operand_id2511, %concat_index_from_operand_id1478, %concat_index_from_operand_id0445
  %194 = phi float [ %subtract.120477, %concat_index_from_operand_id0445 ], [ %subtract.125510, %concat_index_from_operand_id1478 ], [ %subtract.130543, %concat_index_from_operand_id2511 ], [ %subtract.136576, %concat_index_from_operand_id3544 ]
  %195 = icmp ult i32 %3, 32
  br i1 %195, label %concat_index_from_operand_id0582, label %concat_index_not_from_operand0630

concat_index_from_operand_id0582:                 ; preds = %concatenate.merge444
  %196 = phi i32 [ 0, %concatenate.merge444 ]
  %197 = sub nsw i32 %3, %196
  %param_0_2583 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %197
  %param_0_2584 = load float, float* %param_0_2583, align 4, !invariant.load !65
  %param_0_4585 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %197
  %param_0_4586 = load float, float* %param_0_4585, align 4, !invariant.load !65
  %param_0_2587 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %197
  %param_0_2588 = load float, float* %param_0_2587, align 4, !invariant.load !65
  %subtract.116589 = fsub float %param_0_4586, %param_0_2588
  %198 = load float, float* bitcast ([4 x i8]* @161 to float*), align 4
  %param_0_3590 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117591 = fsub float %198, %param_0_3590
  %multiply.96592 = fmul float %subtract.116589, %subtract.117591
  %add.71593 = fadd float %param_0_2584, %multiply.96592
  br label %concatenate.1.merge581

concat_index_from_operand_id1594:                 ; preds = %concat_index_not_from_operand0630
  %199 = phi i32 [ 32, %concat_index_not_from_operand0630 ]
  %200 = sub nsw i32 %3, %199
  %param_1_2595 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %200
  %param_1_2596 = load float, float* %param_1_2595, align 4, !invariant.load !65
  %param_1_4597 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %200
  %param_1_4598 = load float, float* %param_1_4597, align 4, !invariant.load !65
  %param_1_2599 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %200
  %param_1_2600 = load float, float* %param_1_2599, align 4, !invariant.load !65
  %subtract.121601 = fsub float %param_1_4598, %param_1_2600
  %201 = load float, float* bitcast ([4 x i8]* @162 to float*), align 4
  %param_1_3602 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122603 = fsub float %201, %param_1_3602
  %multiply.100604 = fmul float %subtract.121601, %subtract.122603
  %add.74605 = fadd float %param_1_2596, %multiply.100604
  br label %concatenate.1.merge581

concat_index_from_operand_id2606:                 ; preds = %concat_index_not_from_operand1631
  %202 = phi i32 [ 96, %concat_index_not_from_operand1631 ]
  %203 = sub nsw i32 %3, %202
  %param_2_2607 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %203
  %param_2_2608 = load float, float* %param_2_2607, align 4, !invariant.load !65
  %param_2_4609 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %203
  %param_2_4610 = load float, float* %param_2_4609, align 4, !invariant.load !65
  %param_2_2611 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %203
  %param_2_2612 = load float, float* %param_2_2611, align 4, !invariant.load !65
  %subtract.126613 = fsub float %param_2_4610, %param_2_2612
  %204 = load float, float* bitcast ([4 x i8]* @163 to float*), align 4
  %param_2_3614 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127615 = fsub float %204, %param_2_3614
  %multiply.104616 = fmul float %subtract.126613, %subtract.127615
  %add.77617 = fadd float %param_2_2608, %multiply.104616
  br label %concatenate.1.merge581

concat_index_from_operand_id3618:                 ; preds = %concat_index_not_from_operand2632
  %205 = phi i32 [ 106, %concat_index_not_from_operand2632 ]
  %206 = sub nsw i32 %3, %205
  %207 = mul nuw nsw i32 %206, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 10
  %210 = udiv i32 %208, 10
  %211 = udiv i32 %210, 128
  %param_3_2619 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %210, i32 %209
  %param_3_2620 = load float, float* %param_3_2619, align 4, !invariant.load !65
  %param_3_4621 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %210, i32 %209
  %param_3_4622 = load float, float* %param_3_4621, align 4, !invariant.load !65
  %param_3_2623 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %210, i32 %209
  %param_3_2624 = load float, float* %param_3_2623, align 4, !invariant.load !65
  %subtract.132625 = fsub float %param_3_4622, %param_3_2624
  %212 = load float, float* bitcast ([4 x i8]* @164 to float*), align 4
  %param_3_3626 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133627 = fsub float %212, %param_3_3626
  %multiply.108628 = fmul float %subtract.132625, %subtract.133627
  %add.81629 = fadd float %param_3_2620, %multiply.108628
  br label %concatenate.1.merge581

concat_index_not_from_operand0630:                ; preds = %concatenate.merge444
  %213 = icmp ult i32 %3, 96
  br i1 %213, label %concat_index_from_operand_id1594, label %concat_index_not_from_operand1631

concat_index_not_from_operand1631:                ; preds = %concat_index_not_from_operand0630
  %214 = icmp ult i32 %3, 106
  br i1 %214, label %concat_index_from_operand_id2606, label %concat_index_not_from_operand2632

concat_index_not_from_operand2632:                ; preds = %concat_index_not_from_operand1631
  %215 = icmp ult i32 %3, 1386
  br i1 %215, label %concat_index_from_operand_id3618, label %concat_index_not_from_operand3633

concat_index_not_from_operand3633:                ; preds = %concat_index_not_from_operand2632
  unreachable

concatenate.1.merge581:                           ; preds = %concat_index_from_operand_id3618, %concat_index_from_operand_id2606, %concat_index_from_operand_id1594, %concat_index_from_operand_id0582
  %216 = phi float [ %add.71593, %concat_index_from_operand_id0582 ], [ %add.74605, %concat_index_from_operand_id1594 ], [ %add.77617, %concat_index_from_operand_id2606 ], [ %add.81629, %concat_index_from_operand_id3618 ]
  %217 = icmp ult i32 %3, 32
  br i1 %217, label %concat_index_from_operand_id0635, label %concat_index_not_from_operand0695

concat_index_from_operand_id0635:                 ; preds = %concatenate.1.merge581
  %218 = phi i32 [ 0, %concatenate.1.merge581 ]
  %219 = sub nsw i32 %3, %218
  %param_0_5636 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %219
  %param_0_5637 = load float, float* %param_0_5636, align 4, !invariant.load !65
  %param_0_4638 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %219
  %param_0_4639 = load float, float* %param_0_4638, align 4, !invariant.load !65
  %param_0_4640 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %219
  %param_0_4641 = load float, float* %param_0_4640, align 4, !invariant.load !65
  %multiply.98642 = fmul float %param_0_4639, %param_0_4641
  %param_0_5643 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %219
  %param_0_5644 = load float, float* %param_0_5643, align 4, !invariant.load !65
  %subtract.118645 = fsub float %multiply.98642, %param_0_5644
  %220 = load float, float* bitcast ([4 x i8]* @165 to float*), align 4
  %param_0_6646 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119647 = fsub float %220, %param_0_6646
  %multiply.99648 = fmul float %subtract.118645, %subtract.119647
  %add.72649 = fadd float %param_0_5637, %multiply.99648
  br label %concatenate.2.merge634

concat_index_from_operand_id1650:                 ; preds = %concat_index_not_from_operand0695
  %221 = phi i32 [ 32, %concat_index_not_from_operand0695 ]
  %222 = sub nsw i32 %3, %221
  %param_1_5651 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %222
  %param_1_5652 = load float, float* %param_1_5651, align 4, !invariant.load !65
  %param_1_4653 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %222
  %param_1_4654 = load float, float* %param_1_4653, align 4, !invariant.load !65
  %param_1_4655 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %222
  %param_1_4656 = load float, float* %param_1_4655, align 4, !invariant.load !65
  %multiply.102657 = fmul float %param_1_4654, %param_1_4656
  %param_1_5658 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %222
  %param_1_5659 = load float, float* %param_1_5658, align 4, !invariant.load !65
  %subtract.123660 = fsub float %multiply.102657, %param_1_5659
  %223 = load float, float* bitcast ([4 x i8]* @166 to float*), align 4
  %param_1_6661 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124662 = fsub float %223, %param_1_6661
  %multiply.103663 = fmul float %subtract.123660, %subtract.124662
  %add.75664 = fadd float %param_1_5652, %multiply.103663
  br label %concatenate.2.merge634

concat_index_from_operand_id2665:                 ; preds = %concat_index_not_from_operand1696
  %224 = phi i32 [ 96, %concat_index_not_from_operand1696 ]
  %225 = sub nsw i32 %3, %224
  %param_2_5666 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %225
  %param_2_5667 = load float, float* %param_2_5666, align 4, !invariant.load !65
  %param_2_4668 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %225
  %param_2_4669 = load float, float* %param_2_4668, align 4, !invariant.load !65
  %param_2_4670 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %225
  %param_2_4671 = load float, float* %param_2_4670, align 4, !invariant.load !65
  %multiply.106672 = fmul float %param_2_4669, %param_2_4671
  %param_2_5673 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %225
  %param_2_5674 = load float, float* %param_2_5673, align 4, !invariant.load !65
  %subtract.128675 = fsub float %multiply.106672, %param_2_5674
  %226 = load float, float* bitcast ([4 x i8]* @167 to float*), align 4
  %param_2_6676 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129677 = fsub float %226, %param_2_6676
  %multiply.107678 = fmul float %subtract.128675, %subtract.129677
  %add.79679 = fadd float %param_2_5667, %multiply.107678
  br label %concatenate.2.merge634

concat_index_from_operand_id3680:                 ; preds = %concat_index_not_from_operand2697
  %227 = phi i32 [ 106, %concat_index_not_from_operand2697 ]
  %228 = sub nsw i32 %3, %227
  %229 = mul nuw nsw i32 %228, 1
  %230 = add nuw nsw i32 0, %229
  %231 = urem i32 %230, 10
  %232 = udiv i32 %230, 10
  %233 = udiv i32 %232, 128
  %param_3_5681 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %232, i32 %231
  %param_3_5682 = load float, float* %param_3_5681, align 4, !invariant.load !65
  %param_3_4683 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %232, i32 %231
  %param_3_4684 = load float, float* %param_3_4683, align 4, !invariant.load !65
  %param_3_4685 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %232, i32 %231
  %param_3_4686 = load float, float* %param_3_4685, align 4, !invariant.load !65
  %multiply.110687 = fmul float %param_3_4684, %param_3_4686
  %param_3_5688 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %232, i32 %231
  %param_3_5689 = load float, float* %param_3_5688, align 4, !invariant.load !65
  %subtract.134690 = fsub float %multiply.110687, %param_3_5689
  %234 = load float, float* bitcast ([4 x i8]* @168 to float*), align 4
  %param_3_6691 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135692 = fsub float %234, %param_3_6691
  %multiply.111693 = fmul float %subtract.134690, %subtract.135692
  %add.82694 = fadd float %param_3_5682, %multiply.111693
  br label %concatenate.2.merge634

concat_index_not_from_operand0695:                ; preds = %concatenate.1.merge581
  %235 = icmp ult i32 %3, 96
  br i1 %235, label %concat_index_from_operand_id1650, label %concat_index_not_from_operand1696

concat_index_not_from_operand1696:                ; preds = %concat_index_not_from_operand0695
  %236 = icmp ult i32 %3, 106
  br i1 %236, label %concat_index_from_operand_id2665, label %concat_index_not_from_operand2697

concat_index_not_from_operand2697:                ; preds = %concat_index_not_from_operand1696
  %237 = icmp ult i32 %3, 1386
  br i1 %237, label %concat_index_from_operand_id3680, label %concat_index_not_from_operand3698

concat_index_not_from_operand3698:                ; preds = %concat_index_not_from_operand2697
  unreachable

concatenate.2.merge634:                           ; preds = %concat_index_from_operand_id3680, %concat_index_from_operand_id2665, %concat_index_from_operand_id1650, %concat_index_from_operand_id0635
  %238 = phi float [ %add.72649, %concat_index_from_operand_id0635 ], [ %add.75664, %concat_index_from_operand_id1650 ], [ %add.79679, %concat_index_from_operand_id2665 ], [ %add.82694, %concat_index_from_operand_id3680 ]
  %239 = icmp ult i32 %3, 32
  br i1 %239, label %concat_index_from_operand_id0700, label %concat_index_not_from_operand0832

concat_index_from_operand_id0700:                 ; preds = %concatenate.2.merge634
  %240 = phi i32 [ 0, %concatenate.2.merge634 ]
  %241 = sub nsw i32 %3, %240
  %param_0_0701 = getelementptr inbounds [32 x float], [32 x float]* %arg6.7.typed, i32 0, i32 %241
  %param_0_0702 = load float, float* %param_0_0701, align 4, !invariant.load !65
  %param_0_2703 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %241
  %param_0_2704 = load float, float* %param_0_2703, align 4, !invariant.load !65
  %param_0_4705 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %241
  %param_0_4706 = load float, float* %param_0_4705, align 4, !invariant.load !65
  %param_0_2707 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %241
  %param_0_2708 = load float, float* %param_0_2707, align 4, !invariant.load !65
  %subtract.116709 = fsub float %param_0_4706, %param_0_2708
  %242 = load float, float* bitcast ([4 x i8]* @169 to float*), align 4
  %param_0_3710 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117711 = fsub float %242, %param_0_3710
  %multiply.96712 = fmul float %subtract.116709, %subtract.117711
  %add.71713 = fadd float %param_0_2704, %multiply.96712
  %param_0_1714 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.97715 = fmul float %add.71713, %param_0_1714
  %param_0_5716 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %241
  %param_0_5717 = load float, float* %param_0_5716, align 4, !invariant.load !65
  %param_0_4718 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %241
  %param_0_4719 = load float, float* %param_0_4718, align 4, !invariant.load !65
  %param_0_4720 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %241
  %param_0_4721 = load float, float* %param_0_4720, align 4, !invariant.load !65
  %multiply.98722 = fmul float %param_0_4719, %param_0_4721
  %param_0_5723 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %241
  %param_0_5724 = load float, float* %param_0_5723, align 4, !invariant.load !65
  %subtract.118725 = fsub float %multiply.98722, %param_0_5724
  %243 = load float, float* bitcast ([4 x i8]* @170 to float*), align 4
  %param_0_6726 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119727 = fsub float %243, %param_0_6726
  %multiply.99728 = fmul float %subtract.118725, %subtract.119727
  %add.72729 = fadd float %param_0_5717, %multiply.99728
  %244 = call float @__nv_sqrtf(float %add.72729)
  %245 = load float, float* bitcast ([4 x i8]* @171 to float*), align 4
  %add.73730 = fadd float %244, %245
  %divide.43731 = fdiv float %multiply.97715, %add.73730
  %subtract.120732 = fsub float %param_0_0702, %divide.43731
  br label %concatenate.merge699

concat_index_from_operand_id1733:                 ; preds = %concat_index_not_from_operand0832
  %246 = phi i32 [ 32, %concat_index_not_from_operand0832 ]
  %247 = sub nsw i32 %3, %246
  %param_1_0734 = getelementptr inbounds [64 x float], [64 x float]* %arg8.9.typed, i32 0, i32 %247
  %param_1_0735 = load float, float* %param_1_0734, align 4, !invariant.load !65
  %param_1_2736 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %247
  %param_1_2737 = load float, float* %param_1_2736, align 4, !invariant.load !65
  %param_1_4738 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %247
  %param_1_4739 = load float, float* %param_1_4738, align 4, !invariant.load !65
  %param_1_2740 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %247
  %param_1_2741 = load float, float* %param_1_2740, align 4, !invariant.load !65
  %subtract.121742 = fsub float %param_1_4739, %param_1_2741
  %248 = load float, float* bitcast ([4 x i8]* @172 to float*), align 4
  %param_1_3743 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122744 = fsub float %248, %param_1_3743
  %multiply.100745 = fmul float %subtract.121742, %subtract.122744
  %add.74746 = fadd float %param_1_2737, %multiply.100745
  %param_1_1747 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.101748 = fmul float %add.74746, %param_1_1747
  %param_1_5749 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %247
  %param_1_5750 = load float, float* %param_1_5749, align 4, !invariant.load !65
  %param_1_4751 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %247
  %param_1_4752 = load float, float* %param_1_4751, align 4, !invariant.load !65
  %param_1_4753 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %247
  %param_1_4754 = load float, float* %param_1_4753, align 4, !invariant.load !65
  %multiply.102755 = fmul float %param_1_4752, %param_1_4754
  %param_1_5756 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %247
  %param_1_5757 = load float, float* %param_1_5756, align 4, !invariant.load !65
  %subtract.123758 = fsub float %multiply.102755, %param_1_5757
  %249 = load float, float* bitcast ([4 x i8]* @173 to float*), align 4
  %param_1_6759 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124760 = fsub float %249, %param_1_6759
  %multiply.103761 = fmul float %subtract.123758, %subtract.124760
  %add.75762 = fadd float %param_1_5750, %multiply.103761
  %250 = call float @__nv_sqrtf(float %add.75762)
  %251 = load float, float* bitcast ([4 x i8]* @174 to float*), align 4
  %add.76763 = fadd float %250, %251
  %divide.44764 = fdiv float %multiply.101748, %add.76763
  %subtract.125765 = fsub float %param_1_0735, %divide.44764
  br label %concatenate.merge699

concat_index_from_operand_id2766:                 ; preds = %concat_index_not_from_operand1833
  %252 = phi i32 [ 96, %concat_index_not_from_operand1833 ]
  %253 = sub nsw i32 %3, %252
  %param_2_0767 = getelementptr inbounds [10 x float], [10 x float]* %arg14.15.typed, i32 0, i32 %253
  %param_2_0768 = load float, float* %param_2_0767, align 4, !invariant.load !65
  %param_2_2769 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %253
  %param_2_2770 = load float, float* %param_2_2769, align 4, !invariant.load !65
  %param_2_4771 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %253
  %param_2_4772 = load float, float* %param_2_4771, align 4, !invariant.load !65
  %param_2_2773 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %253
  %param_2_2774 = load float, float* %param_2_2773, align 4, !invariant.load !65
  %subtract.126775 = fsub float %param_2_4772, %param_2_2774
  %254 = load float, float* bitcast ([4 x i8]* @175 to float*), align 4
  %param_2_3776 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127777 = fsub float %254, %param_2_3776
  %multiply.104778 = fmul float %subtract.126775, %subtract.127777
  %add.77779 = fadd float %param_2_2770, %multiply.104778
  %param_2_1780 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.105781 = fmul float %add.77779, %param_2_1780
  %param_2_5782 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %253
  %param_2_5783 = load float, float* %param_2_5782, align 4, !invariant.load !65
  %param_2_4784 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %253
  %param_2_4785 = load float, float* %param_2_4784, align 4, !invariant.load !65
  %param_2_4786 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %253
  %param_2_4787 = load float, float* %param_2_4786, align 4, !invariant.load !65
  %multiply.106788 = fmul float %param_2_4785, %param_2_4787
  %param_2_5789 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %253
  %param_2_5790 = load float, float* %param_2_5789, align 4, !invariant.load !65
  %subtract.128791 = fsub float %multiply.106788, %param_2_5790
  %255 = load float, float* bitcast ([4 x i8]* @176 to float*), align 4
  %param_2_6792 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129793 = fsub float %255, %param_2_6792
  %multiply.107794 = fmul float %subtract.128791, %subtract.129793
  %add.79795 = fadd float %param_2_5783, %multiply.107794
  %256 = call float @__nv_sqrtf(float %add.79795)
  %257 = load float, float* bitcast ([4 x i8]* @177 to float*), align 4
  %add.80796 = fadd float %256, %257
  %divide.45797 = fdiv float %multiply.105781, %add.80796
  %subtract.130798 = fsub float %param_2_0768, %divide.45797
  br label %concatenate.merge699

concat_index_from_operand_id3799:                 ; preds = %concat_index_not_from_operand2834
  %258 = phi i32 [ 106, %concat_index_not_from_operand2834 ]
  %259 = sub nsw i32 %3, %258
  %260 = mul nuw nsw i32 %259, 1
  %261 = add nuw nsw i32 0, %260
  %262 = urem i32 %261, 10
  %263 = udiv i32 %261, 10
  %264 = udiv i32 %263, 128
  %param_3_0800 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg15.16.typed, i32 0, i32 %263, i32 %262
  %param_3_0801 = load float, float* %param_3_0800, align 4, !invariant.load !65
  %param_3_2802 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %263, i32 %262
  %param_3_2803 = load float, float* %param_3_2802, align 4, !invariant.load !65
  %param_3_4804 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %263, i32 %262
  %param_3_4805 = load float, float* %param_3_4804, align 4, !invariant.load !65
  %param_3_2806 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %263, i32 %262
  %param_3_2807 = load float, float* %param_3_2806, align 4, !invariant.load !65
  %subtract.132808 = fsub float %param_3_4805, %param_3_2807
  %265 = load float, float* bitcast ([4 x i8]* @178 to float*), align 4
  %param_3_3809 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133810 = fsub float %265, %param_3_3809
  %multiply.108811 = fmul float %subtract.132808, %subtract.133810
  %add.81812 = fadd float %param_3_2803, %multiply.108811
  %param_3_1813 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.109814 = fmul float %add.81812, %param_3_1813
  %param_3_5815 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %263, i32 %262
  %param_3_5816 = load float, float* %param_3_5815, align 4, !invariant.load !65
  %param_3_4817 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %263, i32 %262
  %param_3_4818 = load float, float* %param_3_4817, align 4, !invariant.load !65
  %param_3_4819 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %263, i32 %262
  %param_3_4820 = load float, float* %param_3_4819, align 4, !invariant.load !65
  %multiply.110821 = fmul float %param_3_4818, %param_3_4820
  %param_3_5822 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %263, i32 %262
  %param_3_5823 = load float, float* %param_3_5822, align 4, !invariant.load !65
  %subtract.134824 = fsub float %multiply.110821, %param_3_5823
  %266 = load float, float* bitcast ([4 x i8]* @179 to float*), align 4
  %param_3_6825 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135826 = fsub float %266, %param_3_6825
  %multiply.111827 = fmul float %subtract.134824, %subtract.135826
  %add.82828 = fadd float %param_3_5816, %multiply.111827
  %267 = call float @__nv_sqrtf(float %add.82828)
  %268 = load float, float* bitcast ([4 x i8]* @180 to float*), align 4
  %add.83829 = fadd float %267, %268
  %divide.46830 = fdiv float %multiply.109814, %add.83829
  %subtract.136831 = fsub float %param_3_0801, %divide.46830
  br label %concatenate.merge699

concat_index_not_from_operand0832:                ; preds = %concatenate.2.merge634
  %269 = icmp ult i32 %3, 96
  br i1 %269, label %concat_index_from_operand_id1733, label %concat_index_not_from_operand1833

concat_index_not_from_operand1833:                ; preds = %concat_index_not_from_operand0832
  %270 = icmp ult i32 %3, 106
  br i1 %270, label %concat_index_from_operand_id2766, label %concat_index_not_from_operand2834

concat_index_not_from_operand2834:                ; preds = %concat_index_not_from_operand1833
  %271 = icmp ult i32 %3, 1386
  br i1 %271, label %concat_index_from_operand_id3799, label %concat_index_not_from_operand3835

concat_index_not_from_operand3835:                ; preds = %concat_index_not_from_operand2834
  unreachable

concatenate.merge699:                             ; preds = %concat_index_from_operand_id3799, %concat_index_from_operand_id2766, %concat_index_from_operand_id1733, %concat_index_from_operand_id0700
  %272 = phi float [ %subtract.120732, %concat_index_from_operand_id0700 ], [ %subtract.125765, %concat_index_from_operand_id1733 ], [ %subtract.130798, %concat_index_from_operand_id2766 ], [ %subtract.136831, %concat_index_from_operand_id3799 ]
  %273 = icmp ult i32 %3, 32
  br i1 %273, label %concat_index_from_operand_id0837, label %concat_index_not_from_operand0885

concat_index_from_operand_id0837:                 ; preds = %concatenate.merge699
  %274 = phi i32 [ 0, %concatenate.merge699 ]
  %275 = sub nsw i32 %3, %274
  %param_0_2838 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %275
  %param_0_2839 = load float, float* %param_0_2838, align 4, !invariant.load !65
  %param_0_4840 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %275
  %param_0_4841 = load float, float* %param_0_4840, align 4, !invariant.load !65
  %param_0_2842 = getelementptr inbounds [32 x float], [32 x float]* %arg34.35.typed, i32 0, i32 %275
  %param_0_2843 = load float, float* %param_0_2842, align 4, !invariant.load !65
  %subtract.116844 = fsub float %param_0_4841, %param_0_2843
  %276 = load float, float* bitcast ([4 x i8]* @181 to float*), align 4
  %param_0_3845 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.117846 = fsub float %276, %param_0_3845
  %multiply.96847 = fmul float %subtract.116844, %subtract.117846
  %add.71848 = fadd float %param_0_2839, %multiply.96847
  br label %concatenate.1.merge836

concat_index_from_operand_id1849:                 ; preds = %concat_index_not_from_operand0885
  %277 = phi i32 [ 32, %concat_index_not_from_operand0885 ]
  %278 = sub nsw i32 %3, %277
  %param_1_2850 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %278
  %param_1_2851 = load float, float* %param_1_2850, align 4, !invariant.load !65
  %param_1_4852 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %278
  %param_1_4853 = load float, float* %param_1_4852, align 4, !invariant.load !65
  %param_1_2854 = getelementptr inbounds [64 x float], [64 x float]* %arg30.31.typed, i32 0, i32 %278
  %param_1_2855 = load float, float* %param_1_2854, align 4, !invariant.load !65
  %subtract.121856 = fsub float %param_1_4853, %param_1_2855
  %279 = load float, float* bitcast ([4 x i8]* @182 to float*), align 4
  %param_1_3857 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.122858 = fsub float %279, %param_1_3857
  %multiply.100859 = fmul float %subtract.121856, %subtract.122858
  %add.74860 = fadd float %param_1_2851, %multiply.100859
  br label %concatenate.1.merge836

concat_index_from_operand_id2861:                 ; preds = %concat_index_not_from_operand1886
  %280 = phi i32 [ 96, %concat_index_not_from_operand1886 ]
  %281 = sub nsw i32 %3, %280
  %param_2_2862 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %281
  %param_2_2863 = load float, float* %param_2_2862, align 4, !invariant.load !65
  %param_2_4864 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %281
  %param_2_4865 = load float, float* %param_2_4864, align 4, !invariant.load !65
  %param_2_2866 = getelementptr inbounds [10 x float], [10 x float]* %arg16.17.typed, i32 0, i32 %281
  %param_2_2867 = load float, float* %param_2_2866, align 4, !invariant.load !65
  %subtract.126868 = fsub float %param_2_4865, %param_2_2867
  %282 = load float, float* bitcast ([4 x i8]* @183 to float*), align 4
  %param_2_3869 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.127870 = fsub float %282, %param_2_3869
  %multiply.104871 = fmul float %subtract.126868, %subtract.127870
  %add.77872 = fadd float %param_2_2863, %multiply.104871
  br label %concatenate.1.merge836

concat_index_from_operand_id3873:                 ; preds = %concat_index_not_from_operand2887
  %283 = phi i32 [ 106, %concat_index_not_from_operand2887 ]
  %284 = sub nsw i32 %3, %283
  %285 = mul nuw nsw i32 %284, 1
  %286 = add nuw nsw i32 0, %285
  %287 = urem i32 %286, 10
  %288 = udiv i32 %286, 10
  %289 = udiv i32 %288, 128
  %param_3_2874 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %288, i32 %287
  %param_3_2875 = load float, float* %param_3_2874, align 4, !invariant.load !65
  %param_3_4876 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %288, i32 %287
  %param_3_4877 = load float, float* %param_3_4876, align 4, !invariant.load !65
  %param_3_2878 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg18.19.typed, i32 0, i32 %288, i32 %287
  %param_3_2879 = load float, float* %param_3_2878, align 4, !invariant.load !65
  %subtract.132880 = fsub float %param_3_4877, %param_3_2879
  %290 = load float, float* bitcast ([4 x i8]* @184 to float*), align 4
  %param_3_3881 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.133882 = fsub float %290, %param_3_3881
  %multiply.108883 = fmul float %subtract.132880, %subtract.133882
  %add.81884 = fadd float %param_3_2875, %multiply.108883
  br label %concatenate.1.merge836

concat_index_not_from_operand0885:                ; preds = %concatenate.merge699
  %291 = icmp ult i32 %3, 96
  br i1 %291, label %concat_index_from_operand_id1849, label %concat_index_not_from_operand1886

concat_index_not_from_operand1886:                ; preds = %concat_index_not_from_operand0885
  %292 = icmp ult i32 %3, 106
  br i1 %292, label %concat_index_from_operand_id2861, label %concat_index_not_from_operand2887

concat_index_not_from_operand2887:                ; preds = %concat_index_not_from_operand1886
  %293 = icmp ult i32 %3, 1386
  br i1 %293, label %concat_index_from_operand_id3873, label %concat_index_not_from_operand3888

concat_index_not_from_operand3888:                ; preds = %concat_index_not_from_operand2887
  unreachable

concatenate.1.merge836:                           ; preds = %concat_index_from_operand_id3873, %concat_index_from_operand_id2861, %concat_index_from_operand_id1849, %concat_index_from_operand_id0837
  %294 = phi float [ %add.71848, %concat_index_from_operand_id0837 ], [ %add.74860, %concat_index_from_operand_id1849 ], [ %add.77872, %concat_index_from_operand_id2861 ], [ %add.81884, %concat_index_from_operand_id3873 ]
  %295 = icmp ult i32 %3, 32
  br i1 %295, label %concat_index_from_operand_id0890, label %concat_index_not_from_operand0950

concat_index_from_operand_id0890:                 ; preds = %concatenate.1.merge836
  %296 = phi i32 [ 0, %concatenate.1.merge836 ]
  %297 = sub nsw i32 %3, %296
  %param_0_5891 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %297
  %param_0_5892 = load float, float* %param_0_5891, align 4, !invariant.load !65
  %param_0_4893 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %297
  %param_0_4894 = load float, float* %param_0_4893, align 4, !invariant.load !65
  %param_0_4895 = getelementptr inbounds [32 x float], [32 x float]* %fusion.33.typed, i32 0, i32 %297
  %param_0_4896 = load float, float* %param_0_4895, align 4, !invariant.load !65
  %multiply.98897 = fmul float %param_0_4894, %param_0_4896
  %param_0_5898 = getelementptr inbounds [32 x float], [32 x float]* %arg35.36.typed, i32 0, i32 %297
  %param_0_5899 = load float, float* %param_0_5898, align 4, !invariant.load !65
  %subtract.118900 = fsub float %multiply.98897, %param_0_5899
  %298 = load float, float* bitcast ([4 x i8]* @185 to float*), align 4
  %param_0_6901 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.119902 = fsub float %298, %param_0_6901
  %multiply.99903 = fmul float %subtract.118900, %subtract.119902
  %add.72904 = fadd float %param_0_5892, %multiply.99903
  br label %concatenate.2.merge889

concat_index_from_operand_id1905:                 ; preds = %concat_index_not_from_operand0950
  %299 = phi i32 [ 32, %concat_index_not_from_operand0950 ]
  %300 = sub nsw i32 %3, %299
  %param_1_5906 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %300
  %param_1_5907 = load float, float* %param_1_5906, align 4, !invariant.load !65
  %param_1_4908 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %300
  %param_1_4909 = load float, float* %param_1_4908, align 4, !invariant.load !65
  %param_1_4910 = getelementptr inbounds [64 x float], [64 x float]* %fusion.25.typed, i32 0, i32 %300
  %param_1_4911 = load float, float* %param_1_4910, align 4, !invariant.load !65
  %multiply.102912 = fmul float %param_1_4909, %param_1_4911
  %param_1_5913 = getelementptr inbounds [64 x float], [64 x float]* %arg31.32.typed, i32 0, i32 %300
  %param_1_5914 = load float, float* %param_1_5913, align 4, !invariant.load !65
  %subtract.123915 = fsub float %multiply.102912, %param_1_5914
  %301 = load float, float* bitcast ([4 x i8]* @186 to float*), align 4
  %param_1_6916 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.124917 = fsub float %301, %param_1_6916
  %multiply.103918 = fmul float %subtract.123915, %subtract.124917
  %add.75919 = fadd float %param_1_5907, %multiply.103918
  br label %concatenate.2.merge889

concat_index_from_operand_id2920:                 ; preds = %concat_index_not_from_operand1951
  %302 = phi i32 [ 96, %concat_index_not_from_operand1951 ]
  %303 = sub nsw i32 %3, %302
  %param_2_5921 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %303
  %param_2_5922 = load float, float* %param_2_5921, align 4, !invariant.load !65
  %param_2_4923 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %303
  %param_2_4924 = load float, float* %param_2_4923, align 4, !invariant.load !65
  %param_2_4925 = getelementptr inbounds [10 x float], [10 x float]* %get-tuple-element.116.typed, i32 0, i32 %303
  %param_2_4926 = load float, float* %param_2_4925, align 4, !invariant.load !65
  %multiply.106927 = fmul float %param_2_4924, %param_2_4926
  %param_2_5928 = getelementptr inbounds [10 x float], [10 x float]* %arg17.18.typed, i32 0, i32 %303
  %param_2_5929 = load float, float* %param_2_5928, align 4, !invariant.load !65
  %subtract.128930 = fsub float %multiply.106927, %param_2_5929
  %304 = load float, float* bitcast ([4 x i8]* @187 to float*), align 4
  %param_2_6931 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.129932 = fsub float %304, %param_2_6931
  %multiply.107933 = fmul float %subtract.128930, %subtract.129932
  %add.79934 = fadd float %param_2_5922, %multiply.107933
  br label %concatenate.2.merge889

concat_index_from_operand_id3935:                 ; preds = %concat_index_not_from_operand2952
  %305 = phi i32 [ 106, %concat_index_not_from_operand2952 ]
  %306 = sub nsw i32 %3, %305
  %307 = mul nuw nsw i32 %306, 1
  %308 = add nuw nsw i32 0, %307
  %309 = urem i32 %308, 10
  %310 = udiv i32 %308, 10
  %311 = udiv i32 %310, 128
  %param_3_5936 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %310, i32 %309
  %param_3_5937 = load float, float* %param_3_5936, align 4, !invariant.load !65
  %param_3_4938 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %310, i32 %309
  %param_3_4939 = load float, float* %param_3_4938, align 4, !invariant.load !65
  %param_3_4940 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %custom-call.18.typed, i32 0, i32 %310, i32 %309
  %param_3_4941 = load float, float* %param_3_4940, align 4, !invariant.load !65
  %multiply.110942 = fmul float %param_3_4939, %param_3_4941
  %param_3_5943 = getelementptr inbounds [128 x [10 x float]], [128 x [10 x float]]* %arg19.20.typed, i32 0, i32 %310, i32 %309
  %param_3_5944 = load float, float* %param_3_5943, align 4, !invariant.load !65
  %subtract.134945 = fsub float %multiply.110942, %param_3_5944
  %312 = load float, float* bitcast ([4 x i8]* @188 to float*), align 4
  %param_3_6946 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.135947 = fsub float %312, %param_3_6946
  %multiply.111948 = fmul float %subtract.134945, %subtract.135947
  %add.82949 = fadd float %param_3_5937, %multiply.111948
  br label %concatenate.2.merge889

concat_index_not_from_operand0950:                ; preds = %concatenate.1.merge836
  %313 = icmp ult i32 %3, 96
  br i1 %313, label %concat_index_from_operand_id1905, label %concat_index_not_from_operand1951

concat_index_not_from_operand1951:                ; preds = %concat_index_not_from_operand0950
  %314 = icmp ult i32 %3, 106
  br i1 %314, label %concat_index_from_operand_id2920, label %concat_index_not_from_operand2952

concat_index_not_from_operand2952:                ; preds = %concat_index_not_from_operand1951
  %315 = icmp ult i32 %3, 1386
  br i1 %315, label %concat_index_from_operand_id3935, label %concat_index_not_from_operand3953

concat_index_not_from_operand3953:                ; preds = %concat_index_not_from_operand2952
  unreachable

concatenate.2.merge889:                           ; preds = %concat_index_from_operand_id3935, %concat_index_from_operand_id2920, %concat_index_from_operand_id1905, %concat_index_from_operand_id0890
  %316 = phi float [ %add.72904, %concat_index_from_operand_id0890 ], [ %add.75919, %concat_index_from_operand_id1905 ], [ %add.79934, %concat_index_from_operand_id2920 ], [ %add.82949, %concat_index_from_operand_id3935 ]
  %317 = icmp sge i32 %3, 0
  %318 = icmp slt i32 %3, 32
  %319 = and i1 %317, %318
  br i1 %319, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge889
  %320 = icmp sge i32 %3, 0
  %321 = icmp slt i32 %3, 32
  %322 = and i1 %320, %321
  br i1 %322, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %323 = icmp sge i32 %3, 0
  %324 = icmp slt i32 %3, 32
  %325 = and i1 %323, %324
  br i1 %325, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %326 = icmp sge i32 %3, 32
  %327 = icmp slt i32 %3, 96
  %328 = and i1 %326, %327
  br i1 %328, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  %329 = icmp sge i32 %3, 32
  %330 = icmp slt i32 %3, 96
  %331 = and i1 %329, %330
  br i1 %331, label %slice4-true, label %slice4-after

slice4-after:                                     ; preds = %slice4-true, %slice3-after
  %332 = icmp sge i32 %3, 32
  %333 = icmp slt i32 %3, 96
  %334 = and i1 %332, %333
  br i1 %334, label %slice5-true, label %slice5-after

slice5-after:                                     ; preds = %slice5-true, %slice4-after
  %335 = icmp sge i32 %3, 96
  %336 = icmp slt i32 %3, 106
  %337 = and i1 %335, %336
  br i1 %337, label %slice6-true, label %slice6-after

slice6-after:                                     ; preds = %slice6-true, %slice5-after
  %338 = icmp sge i32 %3, 96
  %339 = icmp slt i32 %3, 106
  %340 = and i1 %338, %339
  br i1 %340, label %slice7-true, label %slice7-after

slice7-after:                                     ; preds = %slice7-true, %slice6-after
  %341 = icmp sge i32 %3, 96
  %342 = icmp slt i32 %3, 106
  %343 = and i1 %341, %342
  br i1 %343, label %slice8-true, label %slice8-after

slice8-after:                                     ; preds = %slice8-true, %slice7-after
  %344 = icmp sge i32 %3, 106
  %345 = icmp slt i32 %3, 1386
  %346 = and i1 %344, %345
  br i1 %346, label %slice9-true, label %slice9-after

slice9-after:                                     ; preds = %slice9-true, %slice8-after
  %347 = icmp sge i32 %3, 106
  %348 = icmp slt i32 %3, 1386
  %349 = and i1 %347, %348
  br i1 %349, label %slice10-true, label %slice10-after

slice10-after:                                    ; preds = %slice10-true, %slice9-after
  %350 = icmp sge i32 %3, 106
  %351 = icmp slt i32 %3, 1386
  %352 = and i1 %350, %351
  br i1 %352, label %slice11-true, label %slice11-after

slice11-after:                                    ; preds = %slice11-true, %slice10-after
  br label %fusion.59.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge889
  %353 = sub i32 %3, 0
  %354 = getelementptr inbounds [32 x float], [32 x float]* %fusion.59.typed2, i32 0, i32 %353
  store float %38, float* %354, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %355 = sub i32 %3, 0
  %356 = getelementptr inbounds [32 x float], [32 x float]* %fusion.59.typed4, i32 0, i32 %355
  store float %60, float* %356, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %357 = sub i32 %3, 0
  %358 = getelementptr inbounds [32 x float], [32 x float]* %fusion.59.typed6, i32 0, i32 %357
  store float %82, float* %358, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %359 = sub i32 %3, 32
  %360 = getelementptr inbounds [64 x float], [64 x float]* %fusion.59.typed8, i32 0, i32 %359
  store float %116, float* %360, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %361 = sub i32 %3, 32
  %362 = getelementptr inbounds [64 x float], [64 x float]* %fusion.59.typed10, i32 0, i32 %361
  store float %138, float* %362, align 4
  br label %slice4-after

slice5-true:                                      ; preds = %slice4-after
  %363 = sub i32 %3, 32
  %364 = getelementptr inbounds [64 x float], [64 x float]* %fusion.59.typed12, i32 0, i32 %363
  store float %160, float* %364, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %365 = sub i32 %3, 96
  %366 = getelementptr inbounds [10 x float], [10 x float]* %fusion.59.typed14, i32 0, i32 %365
  store float %194, float* %366, align 4
  br label %slice6-after

slice7-true:                                      ; preds = %slice6-after
  %367 = sub i32 %3, 96
  %368 = getelementptr inbounds [10 x float], [10 x float]* %fusion.59.typed16, i32 0, i32 %367
  store float %216, float* %368, align 4
  br label %slice7-after

slice8-true:                                      ; preds = %slice7-after
  %369 = sub i32 %3, 96
  %370 = getelementptr inbounds [10 x float], [10 x float]* %fusion.59.typed18, i32 0, i32 %369
  store float %238, float* %370, align 4
  br label %slice8-after

slice9-true:                                      ; preds = %slice8-after
  %371 = sub i32 %3, 106
  %372 = getelementptr inbounds [1280 x float], [1280 x float]* %fusion.59.typed20, i32 0, i32 %371
  store float %272, float* %372, align 4
  br label %slice9-after

slice10-true:                                     ; preds = %slice9-after
  %373 = sub i32 %3, 106
  %374 = getelementptr inbounds [1280 x float], [1280 x float]* %fusion.59.typed22, i32 0, i32 %373
  store float %294, float* %374, align 4
  br label %slice10-after

slice11-true:                                     ; preds = %slice10-after
  %375 = sub i32 %3, 106
  %376 = getelementptr inbounds [1280 x float], [1280 x float]* %fusion.59.typed24, i32 0, i32 %375
  store float %316, float* %376, align 4
  br label %slice11-after
}

define void @fusion_53(i8* noalias align 64 dereferenceable(204800) %alloc13, i8* noalias align 64 dereferenceable(204800) %alloc14, i8* noalias align 64 dereferenceable(204800) %alloc15, i8* noalias align 16 dereferenceable(204800) %alloc16, i8* noalias align 16 dereferenceable(204800) %alloc17, i8* noalias align 16 dereferenceable(204800) %alloc18, i8* noalias align 16 dereferenceable(4) %alloc84, i8* noalias align 16 dereferenceable(4) %alloc86, i8* noalias align 64 dereferenceable(1141056672) %temp_buf) {
entry:
  %fusion.53.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141056384
  %fusion.53.typed = bitcast i8* %fusion.53.raw to [3 x i8*]*
  %fusion.53.raw1 = getelementptr inbounds i8, i8* %alloc13, i64 0
  %fusion.53.typed2 = bitcast i8* %fusion.53.raw1 to [5 x [5 x [32 x [64 x float]]]]*
  %fusion.53.raw3 = getelementptr inbounds i8, i8* %alloc14, i64 0
  %fusion.53.typed4 = bitcast i8* %fusion.53.raw3 to [5 x [5 x [32 x [64 x float]]]]*
  %fusion.53.raw5 = getelementptr inbounds i8, i8* %alloc15, i64 0
  %fusion.53.typed6 = bitcast i8* %fusion.53.raw5 to [5 x [5 x [32 x [64 x float]]]]*
  %arg4.5.raw = getelementptr inbounds i8, i8* %alloc84, i64 0
  %arg4.5.typed = bitcast i8* %arg4.5.raw to float*
  %get-tuple-element.75.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1140850688
  %get-tuple-element.75.typed = bitcast i8* %get-tuple-element.75.raw to [64 x [32 x [5 x [5 x float]]]]*
  %arg28.29.raw = getelementptr inbounds i8, i8* %alloc17, i64 0
  %arg28.29.typed = bitcast i8* %arg28.29.raw to [5 x [5 x [32 x [64 x float]]]]*
  %arg5.6.raw = getelementptr inbounds i8, i8* %alloc86, i64 0
  %arg5.6.typed = bitcast i8* %arg5.6.raw to float*
  %arg29.30.raw = getelementptr inbounds i8, i8* %alloc18, i64 0
  %arg29.30.typed = bitcast i8* %arg29.30.raw to [5 x [5 x [32 x [64 x float]]]]*
  %fusion.31.raw = getelementptr inbounds i8, i8* %temp_buf, i64 1141055488
  %fusion.31.typed = bitcast i8* %fusion.31.raw to float*
  %arg9.10.raw = getelementptr inbounds i8, i8* %alloc16, i64 0
  %arg9.10.typed = bitcast i8* %arg9.10.raw to [5 x [5 x [32 x [64 x float]]]]*
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = icmp eq i32 0, %0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %3 = icmp eq i32 0, %2
  %4 = and i1 %3, %1
  br i1 %4, label %emit_mof_tuple-true, label %emit_mof_tuple-after

emit_mof_tuple-after:                             ; preds = %emit_mof_tuple-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !69
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %7 = mul nuw nsw i32 %5, 256
  %linear_index = add nuw nsw i32 %7, %6
  %linear_index_in_range = icmp ult i32 %linear_index, 12800
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %8 = udiv i32 %linear_index_base, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index_base, 64
  %11 = urem i32 %10, 32
  %12 = udiv i32 %linear_index_base, 2048
  %13 = urem i32 %12, 5
  %14 = udiv i32 %linear_index_base, 10240
  %linear_index7 = add nuw nsw i32 %linear_index_base, 1
  %15 = udiv i32 %linear_index7, 1
  %16 = urem i32 %15, 64
  %17 = udiv i32 %linear_index7, 64
  %18 = urem i32 %17, 32
  %19 = udiv i32 %linear_index7, 2048
  %20 = urem i32 %19, 5
  %21 = udiv i32 %linear_index7, 10240
  %linear_index8 = add nuw nsw i32 %linear_index_base, 2
  %22 = udiv i32 %linear_index8, 1
  %23 = urem i32 %22, 64
  %24 = udiv i32 %linear_index8, 64
  %25 = urem i32 %24, 32
  %26 = udiv i32 %linear_index8, 2048
  %27 = urem i32 %26, 5
  %28 = udiv i32 %linear_index8, 10240
  %linear_index9 = add nuw nsw i32 %linear_index_base, 3
  %29 = udiv i32 %linear_index9, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %linear_index9, 64
  %32 = urem i32 %31, 32
  %33 = udiv i32 %linear_index9, 2048
  %34 = urem i32 %33, 5
  %35 = udiv i32 %linear_index9, 10240
  %36 = icmp ult i32 %linear_index_base, 51200
  br i1 %36, label %fusion.53.in_bounds-true, label %fusion.53.in_bounds-after

fusion.53.in_bounds-after:                        ; preds = %fusion.53.in_bounds-true, %emit_mof_tuple-after
  ret void

emit_mof_tuple-true:                              ; preds = %entry
  %37 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed2 to i8*
  %38 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.53.typed, i64 0, i64 0
  store i8* %37, i8** %38, align 8
  %39 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed4 to i8*
  %40 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.53.typed, i64 0, i64 1
  store i8* %39, i8** %40, align 8
  %41 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed6 to i8*
  %42 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fusion.53.typed, i64 0, i64 2
  store i8* %41, i8** %42, align 8
  br label %emit_mof_tuple-after

fusion.53.in_bounds-true:                         ; preds = %emit_mof_tuple-after
  %param_2.262 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg28.29.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_2.26210 = load float, float* %param_2.262, align 4, !invariant.load !65
  %param_1.230 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.23011 = load float, float* %param_1.230, align 4, !invariant.load !65
  %subtract.99 = fsub float %param_1.23011, %param_2.26210
  %43 = load float, float* bitcast ([4 x i8]* @189 to float*), align 4
  %param_0.141 = load float, float* %arg4.5.typed, align 4, !invariant.load !65
  %subtract.98 = fsub float %43, %param_0.141
  %multiply.83 = fmul float %subtract.99, %subtract.98
  %add.61 = fadd float %param_2.26210, %multiply.83
  %44 = insertvalue { float, float, float } undef, float %add.61, 0
  %param_6.105 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_6.10512 = load float, float* %param_6.105, align 4, !invariant.load !65
  %param_5.120 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.24.clone.1 = fmul float %add.61, %param_5.120
  %param_4.117 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg29.30.typed, i32 0, i32 %14, i32 %13, i32 %11, i32 %9
  %param_4.11713 = load float, float* %param_4.117, align 4, !invariant.load !65
  %param_1.23014 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.23015 = load float, float* %param_1.23014, align 4, !invariant.load !65
  %param_1.23016 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %9, i32 %11, i32 %14, i32 %13
  %param_1.23017 = load float, float* %param_1.23016, align 4, !invariant.load !65
  %multiply.75.clone.1 = fmul float %param_1.23015, %param_1.23017
  %subtract.87.clone.1 = fsub float %multiply.75.clone.1, %param_4.11713
  %45 = load float, float* bitcast ([4 x i8]* @190 to float*), align 4
  %param_3.149 = load float, float* %arg5.6.typed, align 4, !invariant.load !65
  %subtract.86.clone.1 = fsub float %45, %param_3.149
  %multiply.74.clone.1 = fmul float %subtract.87.clone.1, %subtract.86.clone.1
  %add.54.clone.1 = fadd float %param_4.11713, %multiply.74.clone.1
  %46 = call float @__nv_sqrtf(float %add.54.clone.1)
  %47 = load float, float* bitcast ([4 x i8]* @191 to float*), align 4
  %add.19.clone.1 = fadd float %46, %47
  %divide.7.clone.1 = fdiv float %multiply.24.clone.1, %add.19.clone.1
  %subtract.19.clone.1 = fsub float %param_6.10512, %divide.7.clone.1
  %48 = insertvalue { float, float, float } %44, float %subtract.19.clone.1, 1
  %49 = insertvalue { float, float, float } %48, float %add.54.clone.1, 2
  %50 = extractvalue { float, float, float } %49, 0
  %51 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed2 to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index_base
  store float %50, float* %52, align 4
  %53 = extractvalue { float, float, float } %49, 1
  %54 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed4 to float*
  %55 = getelementptr inbounds float, float* %54, i32 %linear_index_base
  store float %53, float* %55, align 4
  %56 = extractvalue { float, float, float } %49, 2
  %57 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed6 to float*
  %58 = getelementptr inbounds float, float* %57, i32 %linear_index_base
  store float %56, float* %58, align 4
  %param_2.26218 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg28.29.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_2.26219 = load float, float* %param_2.26218, align 4, !invariant.load !65
  %param_1.23020 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.23021 = load float, float* %param_1.23020, align 4, !invariant.load !65
  %subtract.9922 = fsub float %param_1.23021, %param_2.26219
  %multiply.8323 = fmul float %subtract.9922, %subtract.98
  %add.6124 = fadd float %param_2.26219, %multiply.8323
  %59 = insertvalue { float, float, float } undef, float %add.6124, 0
  %param_6.10525 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_6.10526 = load float, float* %param_6.10525, align 4, !invariant.load !65
  %param_5.12027 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.24.clone.128 = fmul float %add.6124, %param_5.12027
  %param_4.11729 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg29.30.typed, i32 0, i32 %21, i32 %20, i32 %18, i32 %16
  %param_4.11730 = load float, float* %param_4.11729, align 4, !invariant.load !65
  %param_1.23031 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.23032 = load float, float* %param_1.23031, align 4, !invariant.load !65
  %param_1.23033 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %16, i32 %18, i32 %21, i32 %20
  %param_1.23034 = load float, float* %param_1.23033, align 4, !invariant.load !65
  %multiply.75.clone.135 = fmul float %param_1.23032, %param_1.23034
  %subtract.87.clone.136 = fsub float %multiply.75.clone.135, %param_4.11730
  %multiply.74.clone.137 = fmul float %subtract.87.clone.136, %subtract.86.clone.1
  %add.54.clone.138 = fadd float %param_4.11730, %multiply.74.clone.137
  %60 = call float @__nv_sqrtf(float %add.54.clone.138)
  %61 = load float, float* bitcast ([4 x i8]* @192 to float*), align 4
  %add.19.clone.139 = fadd float %60, %61
  %divide.7.clone.140 = fdiv float %multiply.24.clone.128, %add.19.clone.139
  %subtract.19.clone.141 = fsub float %param_6.10526, %divide.7.clone.140
  %62 = insertvalue { float, float, float } %59, float %subtract.19.clone.141, 1
  %63 = insertvalue { float, float, float } %62, float %add.54.clone.138, 2
  %64 = extractvalue { float, float, float } %63, 0
  %65 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed2 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index7
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float, float } %63, 1
  %68 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed4 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index7
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %63, 2
  %71 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed6 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index7
  store float %70, float* %72, align 4
  %param_2.26242 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg28.29.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_2.26243 = load float, float* %param_2.26242, align 4, !invariant.load !65
  %param_1.23044 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.23045 = load float, float* %param_1.23044, align 4, !invariant.load !65
  %subtract.9946 = fsub float %param_1.23045, %param_2.26243
  %multiply.8347 = fmul float %subtract.9946, %subtract.98
  %add.6148 = fadd float %param_2.26243, %multiply.8347
  %73 = insertvalue { float, float, float } undef, float %add.6148, 0
  %param_6.10549 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_6.10550 = load float, float* %param_6.10549, align 4, !invariant.load !65
  %param_5.12051 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.24.clone.152 = fmul float %add.6148, %param_5.12051
  %param_4.11753 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg29.30.typed, i32 0, i32 %28, i32 %27, i32 %25, i32 %23
  %param_4.11754 = load float, float* %param_4.11753, align 4, !invariant.load !65
  %param_1.23055 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.23056 = load float, float* %param_1.23055, align 4, !invariant.load !65
  %param_1.23057 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %23, i32 %25, i32 %28, i32 %27
  %param_1.23058 = load float, float* %param_1.23057, align 4, !invariant.load !65
  %multiply.75.clone.159 = fmul float %param_1.23056, %param_1.23058
  %subtract.87.clone.160 = fsub float %multiply.75.clone.159, %param_4.11754
  %multiply.74.clone.161 = fmul float %subtract.87.clone.160, %subtract.86.clone.1
  %add.54.clone.162 = fadd float %param_4.11754, %multiply.74.clone.161
  %74 = call float @__nv_sqrtf(float %add.54.clone.162)
  %75 = load float, float* bitcast ([4 x i8]* @193 to float*), align 4
  %add.19.clone.163 = fadd float %74, %75
  %divide.7.clone.164 = fdiv float %multiply.24.clone.152, %add.19.clone.163
  %subtract.19.clone.165 = fsub float %param_6.10550, %divide.7.clone.164
  %76 = insertvalue { float, float, float } %73, float %subtract.19.clone.165, 1
  %77 = insertvalue { float, float, float } %76, float %add.54.clone.162, 2
  %78 = extractvalue { float, float, float } %77, 0
  %79 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed2 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index8
  store float %78, float* %80, align 4
  %81 = extractvalue { float, float, float } %77, 1
  %82 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed4 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index8
  store float %81, float* %83, align 4
  %84 = extractvalue { float, float, float } %77, 2
  %85 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed6 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index8
  store float %84, float* %86, align 4
  %param_2.26266 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg28.29.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_2.26267 = load float, float* %param_2.26266, align 4, !invariant.load !65
  %param_1.23068 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.23069 = load float, float* %param_1.23068, align 4, !invariant.load !65
  %subtract.9970 = fsub float %param_1.23069, %param_2.26267
  %multiply.8371 = fmul float %subtract.9970, %subtract.98
  %add.6172 = fadd float %param_2.26267, %multiply.8371
  %87 = insertvalue { float, float, float } undef, float %add.6172, 0
  %param_6.10573 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg9.10.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_6.10574 = load float, float* %param_6.10573, align 4, !invariant.load !65
  %param_5.12075 = load float, float* %fusion.31.typed, align 4, !invariant.load !65
  %multiply.24.clone.176 = fmul float %add.6172, %param_5.12075
  %param_4.11777 = getelementptr inbounds [5 x [5 x [32 x [64 x float]]]], [5 x [5 x [32 x [64 x float]]]]* %arg29.30.typed, i32 0, i32 %35, i32 %34, i32 %32, i32 %30
  %param_4.11778 = load float, float* %param_4.11777, align 4, !invariant.load !65
  %param_1.23079 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.23080 = load float, float* %param_1.23079, align 4, !invariant.load !65
  %param_1.23081 = getelementptr inbounds [64 x [32 x [5 x [5 x float]]]], [64 x [32 x [5 x [5 x float]]]]* %get-tuple-element.75.typed, i32 0, i32 %30, i32 %32, i32 %35, i32 %34
  %param_1.23082 = load float, float* %param_1.23081, align 4, !invariant.load !65
  %multiply.75.clone.183 = fmul float %param_1.23080, %param_1.23082
  %subtract.87.clone.184 = fsub float %multiply.75.clone.183, %param_4.11778
  %multiply.74.clone.185 = fmul float %subtract.87.clone.184, %subtract.86.clone.1
  %add.54.clone.186 = fadd float %param_4.11778, %multiply.74.clone.185
  %88 = call float @__nv_sqrtf(float %add.54.clone.186)
  %89 = load float, float* bitcast ([4 x i8]* @194 to float*), align 4
  %add.19.clone.187 = fadd float %88, %89
  %divide.7.clone.188 = fdiv float %multiply.24.clone.176, %add.19.clone.187
  %subtract.19.clone.189 = fsub float %param_6.10574, %divide.7.clone.188
  %90 = insertvalue { float, float, float } %87, float %subtract.19.clone.189, 1
  %91 = insertvalue { float, float, float } %90, float %add.54.clone.186, 2
  %92 = extractvalue { float, float, float } %91, 0
  %93 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed2 to float*
  %94 = getelementptr inbounds float, float* %93, i32 %linear_index9
  store float %92, float* %94, align 4
  %95 = extractvalue { float, float, float } %91, 1
  %96 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed4 to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index9
  store float %95, float* %97, align 4
  %98 = extractvalue { float, float, float } %91, 2
  %99 = bitcast [5 x [5 x [32 x [64 x float]]]]* %fusion.53.typed6 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index9
  store float %98, float* %100, align 4
  br label %fusion.53.in_bounds-after
}

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind }
attributes #4 = { convergent inaccessiblememonly nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63}

!0 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_31, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_31, !"reqntidx", i32 1}
!2 = !{void (i8*, i8*, i8*)* @copy_32, !"kernel", i32 1}
!3 = !{void (i8*, i8*, i8*)* @copy_32, !"reqntidx", i32 200}
!4 = !{void (i8*, i8*, i8*)* @broadcast_84, !"kernel", i32 1}
!5 = !{void (i8*, i8*, i8*)* @broadcast_84, !"reqntidx", i32 1024}
!6 = !{void (i8*, i8*, i8*)* @copy_33, !"kernel", i32 1}
!7 = !{void (i8*, i8*, i8*)* @copy_33, !"reqntidx", i32 256}
!8 = !{void (i8*, i8*, i8*)* @broadcast_77, !"kernel", i32 1}
!9 = !{void (i8*, i8*, i8*)* @broadcast_77, !"reqntidx", i32 1024}
!10 = !{void (i8*, i8*)* @copy_34, !"kernel", i32 1}
!11 = !{void (i8*, i8*)* @copy_34, !"reqntidx", i32 256}
!12 = !{void (i8*)* @reduce_window_66, !"kernel", i32 1}
!13 = !{void (i8*)* @reduce_window_66, !"reqntidx", i32 1024}
!14 = !{void (i8*)* @fusion_45, !"kernel", i32 1}
!15 = !{void (i8*)* @fusion_45, !"reqntidx", i32 256}
!16 = !{void (i8*, i8*, i8*)* @fusion_48, !"kernel", i32 1}
!17 = !{void (i8*, i8*, i8*)* @fusion_48, !"reqntidx", i32 256}
!18 = !{void (i8*, i8*, i8*)* @reduce, !"kernel", i32 1}
!19 = !{void (i8*, i8*, i8*)* @reduce, !"reqntidx", i32 256}
!20 = !{void (i8*, i8*, i8*)* @fusion_44, !"kernel", i32 1}
!21 = !{void (i8*, i8*, i8*)* @fusion_44, !"reqntidx", i32 256}
!22 = !{void (i8*, i8*, i8*)* @reduce_1, !"kernel", i32 1}
!23 = !{void (i8*, i8*, i8*)* @reduce_1, !"reqntidx", i32 256}
!24 = !{void (i8*, i8*, i8*, i8*)* @fusion_47, !"kernel", i32 1}
!25 = !{void (i8*, i8*, i8*, i8*)* @fusion_47, !"reqntidx", i32 256}
!26 = !{void (i8*, i8*, i8*)* @reduce_129, !"kernel", i32 1}
!27 = !{void (i8*, i8*, i8*)* @reduce_129, !"reqntidx", i32 256}
!28 = !{void (i8*, i8*, i8*, i8*)* @fusion_49, !"kernel", i32 1}
!29 = !{void (i8*, i8*, i8*, i8*)* @fusion_49, !"reqntidx", i32 256}
!30 = !{void (i8*, i8*, i8*, i8*)* @fusion_58, !"kernel", i32 1}
!31 = !{void (i8*, i8*, i8*, i8*)* @fusion_58, !"reqntidx", i32 256}
!32 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_57, !"kernel", i32 1}
!33 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_57, !"reqntidx", i32 1024}
!34 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_41, !"kernel", i32 1}
!35 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_41, !"reqntidx", i32 256}
!36 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_56, !"kernel", i32 1}
!37 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_56, !"reqntidx", i32 1024}
!38 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_6, !"kernel", i32 1}
!39 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_6, !"reqntidx", i32 256}
!40 = !{void (i8*)* @fusion_36, !"kernel", i32 1}
!41 = !{void (i8*)* @fusion_36, !"reqntidx", i32 256}
!42 = !{void (i8*, i8*)* @fusion_18, !"kernel", i32 1}
!43 = !{void (i8*, i8*)* @fusion_18, !"reqntidx", i32 32}
!44 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_15, !"kernel", i32 1}
!45 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_15, !"reqntidx", i32 32}
!46 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_55, !"kernel", i32 1}
!47 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_55, !"reqntidx", i32 256}
!48 = !{void (i8*)* @select_and_scatter_337, !"kernel", i32 1}
!49 = !{void (i8*)* @select_and_scatter_337, !"reqntidx", i32 1024}
!50 = !{void (i8*)* @fusion_35, !"kernel", i32 1}
!51 = !{void (i8*)* @fusion_35, !"reqntidx", i32 128}
!52 = !{void (i8*, i8*)* @fusion_25, !"kernel", i32 1}
!53 = !{void (i8*, i8*)* @fusion_25, !"reqntidx", i32 64}
!54 = !{void (i8*)* @fusion_34, !"kernel", i32 1}
!55 = !{void (i8*)* @fusion_34, !"reqntidx", i32 128}
!56 = !{void (i8*, i8*)* @fusion_33, !"kernel", i32 1}
!57 = !{void (i8*, i8*)* @fusion_33, !"reqntidx", i32 96}
!58 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_51, !"kernel", i32 1}
!59 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_51, !"reqntidx", i32 200}
!60 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_59, !"kernel", i32 1}
!61 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_59, !"reqntidx", i32 1024}
!62 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_53, !"kernel", i32 1}
!63 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_53, !"reqntidx", i32 256}
!64 = !{i32 0, i32 1}
!65 = !{}
!66 = !{i32 0, i32 200}
!67 = !{i32 0, i32 10}
!68 = !{i32 0, i32 1024}
!69 = !{i32 0, i32 50}
!70 = !{i32 0, i32 256}
!71 = !{i32 0, i32 128}
!72 = !{i32 0, i32 6400}
!73 = !{i32 0, i32 4608}
!74 = distinct !{!74, !75}
!75 = !{!"llvm.loop.vectorize.enable", i1 false}
!76 = !{i32 0, i32 2}
!77 = distinct !{!77, !75}
!78 = !{i32 0, i32 576}
!79 = !{i32 0, i32 32}
!80 = !{i32 0, i32 16384}
!81 = distinct !{!81, !75}
!82 = distinct !{!82, !75}
!83 = !{i32 0, i32 864}
!84 = distinct !{!84, !75}
!85 = !{i32 0, i32 64}
!86 = !{i32 0, i32 8192}
!87 = distinct !{!87, !75}
!88 = distinct !{!88, !75}
!89 = distinct !{!89, !75}
!90 = !{i32 0, i32 96}
!91 = !{i32 0, i32 4096}
!92 = distinct !{!92, !75}
!93 = distinct !{!93, !75}
