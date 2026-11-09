# Refactor notes

## Feature map

| Original feature | Location in this repository |
|---|---|
| 22 modules | `modules/` |
| GKE node pools with surge settings | `examples/gke-regional-cluster` |
| Client-to-site firewall baseline | `modules/c2sfirewall`, `examples/baseline-firewall` |
| hostError log metric and alert | `modules/stackdriver`, `examples/host-error-alerting` |

## What changed and why

| Change | Reason |
|---|---|
| Only the newest version of each module is kept | ADR-003 |
| The version-only helper folder is not carried over | It held no resources |
| Module sources point at relative paths | The internal registry is not public |
| Comments removed from module code | They could hold environment details |
| Descriptions and types added to variables | Generated module docs |
| VPN ranges and ports became variables | They were specific to one environment |
| Token value replaced by a sensitive variable | ADR-005 |
| Secure defaults added | ADR-004 |
| Bucket soft delete now defaults to 7 days | The original turned it off |
| Unused variables removed | tflint |
