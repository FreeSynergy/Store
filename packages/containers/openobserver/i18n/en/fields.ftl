# help/en/fields.ftl — OpenObserve field help texts (English)

help-openobserver-field-admin-title = Admin Credentials

help-openobserver-field-admin-body =
    ZO_ROOT_USER_EMAIL: Email address for the root admin account.
    Created only on first start. Used to log into the OpenObserve UI.

    ZO_ROOT_USER_PASSWORD: Password for the root admin account.
    Auto-generated and stored in vault.

    These credentials are only used for the initial setup and admin operations.
    After setup, create additional user accounts (Settings > Users) for team
    members who need access to the dashboards.

    The root account always uses local password authentication — it cannot be
    converted to OIDC. Keep the generated password in the vault as a recovery
    credential.

    API authentication also uses these credentials via HTTP Basic Auth:
        Authorization: Basic <base64(email:password)>

help-openobserver-field-storage-title = Data Directory (ZO_DATA_DIR)

help-openobserver-field-storage-body =
    The directory inside the container where OpenObserve stores all its data:
    - WAL (Write-Ahead Log) — incoming data not yet compacted
    - Indexes — inverted indexes for full-text search
    - Streams — compressed columnar data for logs, metrics and traces
    - Metadata — dashboard definitions, alert rules, user settings

    Default: /data — backed by the host volume at {config_dir}/data/

    Storage sizing guidelines:
    - Retention 7 days, ~10 services: 5–10 GB
    - Retention 30 days, ~15 services: 20–50 GB
    - Retention 90 days, 15+ services: 100–200 GB

    OpenObserve compresses data aggressively (typically 10–20x compression
    for log data). Actual usage is much lower than raw log volume.

    Monitor disk usage regularly — OpenObserve does not auto-delete old data
    unless you configure retention policies under Settings > Streams.

help-openobserver-field-ports-title = HTTP and gRPC Ports

help-openobserver-field-ports-body =
    ZO_HTTP_PORT (default: 5080):
    The main API and dashboard port. All browser traffic and OTLP/HTTP
    ingestion goes through this port. The Zentinel proxy forwards HTTPS
    traffic here.

    ZO_GRPC_PORT (default: 5081):
    The OTLP/gRPC port for high-throughput telemetry ingestion. Used by
    the OTel Collector as the preferred ingestion method (lower overhead
    than HTTP). This port is internal-only — not exposed via Zentinel.

    Both ports must be unique on the host. If you run multiple OpenObserve
    instances (unusual), assign different port numbers.

help-openobserver-field-wal-title = WAL Memory Mode (ZO_WAL_MEMORY_MODE_ENABLED)

help-openobserver-field-wal-body =
    Controls whether incoming data is buffered in memory before being written
    to disk.

    "true" (default): WAL is kept in memory. Significantly higher ingest
    throughput. Up to ~1 second of data may be lost if the process crashes.

    "false": WAL is flushed to disk on every write. Lower throughput but
    no data loss on crash.

    For most deployments, "true" is the right choice:
    - Losing 1 second of logs/metrics on a crash is acceptable
    - The throughput gain is significant for busy platforms
    - Data is not lost on graceful shutdown (only on hard crash/kill -9)

    Set to "false" only if you require strict durability guarantees.

help-openobserver-field-telemetry-title = Telemetry / Phone-Home (ZO_TELEMETRY)

help-openobserver-field-telemetry-body =
    Controls whether OpenObserve sends anonymous usage statistics to the
    OpenObserve team.

    "false" (default in this deployment): No data sent. Private deployment.

    "true": Sends aggregate usage metrics (no log content, no personally
    identifiable information). Helps the project prioritize features.

    ZO_TELEMETRY_URL: The endpoint for telemetry data. Leave empty when
    ZO_TELEMETRY = "false".

    This is always set to "false" in FreeSynergy deployments to ensure data
    privacy. Change only if you explicitly want to contribute usage data
    and have reviewed the OpenObserve privacy policy.
