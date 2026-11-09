# Architecture

## Layers

| Layer | Path | Holds |
|---|---|---|
| Modules | `modules/` | One resource family each, with secure defaults |
| Examples | `examples/` | Complete root configurations that combine modules |

## GKE upgrade flow

The `gke` module reads `strategy`, `max_surge`, and `max_unavailable` from each node pool entry. With `SURGE`, GKE adds the extra nodes, moves workloads, and then removes old nodes. Blue-green settings are read only when the strategy is `BLUE_GREEN`.

## Firewall evaluation

GCP evaluates rules from the lowest priority number. The `c2sfirewall` module places a VPN allow rule at 1000 and an outbound deny at 65534. GCP's implied rules sit at 65535.

## Host error alerting

A log metric counts `compute.instances.hostError` audit entries. An alert policy watches that metric and notifies a Slack channel.
