# IRI API Demo

A small demo of submitting work to ALCF resources through the [IRI Facility API](https://api.alcf.anl.gov). Run the scripts in order.

## 1. Create a token

```bash
./1_create_token.sh
```

Downloads `alcf_facility_api_globus_token.py` and authenticates you via Globus using your ALCF credentials. This creates an access token used by the later scripts.

## 2. Query resources

```bash
./2_query_resources.sh
```

Queries the status of all ALCF resources, then the status of Polaris specifically (by resource ID).

## 3. Submit a job

```bash
./3_submit_job.sh
```

Retrieves an access token and submits a short job to Polaris via a `POST` to the compute endpoint. The example runs `echo Start; sleep 10; echo End` on one node under the `ATPESC` queue and `ATPESC2026` account, writing stdout/stderr to `$HOME/logs`.

## Notes

- The Polaris resource ID is `55c1c993-1124-47f9-b823-514ba3849a9a`.
- Update the `queue_name`, `account`, and `filesystems` attributes for your own allocation.
- API reference: https://api.alcf.anl.gov
