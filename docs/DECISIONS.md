# Design decisions

## ADR-001: Surge upgrades for node pools

- **Context:** A node upgrade must not reduce serving capacity.
- **Decision:** Use the `SURGE` strategy with `max_surge = 5` and `max_unavailable = 0`.
- **Reason:** New nodes are ready before any old node is removed.
- **Alternatives:** Blue-green upgrades, which the module also supports. They double the pool for the soak period.

## ADR-002: VPN-only management and an explicit outbound deny

- **Context:** GCP allows all outbound traffic through an implied rule at priority 65535.
- **Decision:** Allow management ports from VPN ranges at priority 1000, and deny tcp and udp outbound at priority 65534.
- **Reason:** A rule at 65534 is evaluated before the implied allow, and higher-priority allow rules can still open specific paths.

## ADR-003: One module version in this repository

- **Context:** The original pinned versions in `ver_x.y.z` folders.
- **Decision:** Keep only the newest version here. In production, consume modules by git tag.
- **Reason:** Old folders added no information to a reference repository.

## ADR-004: Secure defaults

- **Context:** A scanner found several unsafe settings.
- **Decision:** Fix them in the modules: Secure Boot, GKE metadata server, workload identity, network policy, no client certificates, Shielded VM, bucket versioning, and public access prevention.
- **Reason:** Defaults protect every caller, including one who forgets.

## ADR-005: Secrets are inputs

- **Context:** The notification module had a token-shaped value in code.
- **Decision:** Replace it with a sensitive variable sent through `sensitive_labels`.
- **Reason:** Code should never hold a credential, even a sample one.
