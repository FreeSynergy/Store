# help/en/overview.ftl — OpenObserve help texts (English)

help-openobserver-title = OpenObserve — Observability Platform

help-openobserver-body =
    OpenObserve (O2) is an open-source, high-performance observability platform
    for logs, metrics and distributed traces. It provides the monitoring and
    visibility layer for the entire FreeSynergy platform.

    Capabilities:
    - Log ingestion and full-text search (10x cheaper storage than Elasticsearch)
    - Metrics storage and querying (Prometheus-compatible)
    - Distributed tracing (OpenTelemetry / Jaeger compatible)
    - Real-time dashboards and alerts
    - SQL-based query language for all data types
    - Multi-tenant organization model

    In FreeSynergy, all platform services send their logs, metrics and traces
    to OpenObserve via the OTel Collector sub-service (otel-collector). The
    Collector scrapes Podman container stats, reads journald logs and forwards
    everything via OTLP to OpenObserve.

    Note: The OSS edition of OpenObserve does not natively support OIDC. For SSO
    access control, use Zentinel's forward-auth feature (see OIDC topic).

    Constraint: per_host = 1 — only one OpenObserve instance per host.

help-openobserver-install-title = Installing OpenObserve

help-openobserver-install-body =
    1. Run the setup wizard:
       - Admin email: your email address (used for the root account)
       - Admin password: auto-generated and stored in vault

    2. After first start, log in at https://logs.example.com with the generated
       credentials. The UI is immediately functional.

    3. Install the OTel Collector alongside OpenObserve:
       - Add otel-collector as a service with [load.services.openobserver]
       - The collector automatically discovers the OpenObserve endpoint
       - Within a few minutes, logs from all containers will appear in O2

    4. Create dashboards:
       - Platform overview: container CPU, memory, restart counts
       - Service-specific: Forgejo commits, Stalwart mail queue depth, etc.
       - Alerting rules for error rate spikes or service unavailability

    5. Configure alerts (Settings > Alerts) for critical conditions:
       - Container restart count > 3 in 5 minutes
       - HTTP 5xx error rate > 1%
       - Disk usage > 85%

help-openobserver-ingestion-title = Log and Metric Ingestion

help-openobserver-ingestion-body =
    OpenObserve accepts data via multiple protocols:

    OTLP/HTTP (default):
        POST https://logs.example.com/api/{org}/v1/logs
        POST https://logs.example.com/api/{org}/v1/metrics
        POST https://logs.example.com/api/{org}/v1/traces
        Authorization: Basic <base64(email:password)>

    OTLP/gRPC (ZO_GRPC_PORT, default 5081):
        Endpoint: logs.example.com:5081
        Used by the OTel Collector for high-throughput ingestion.

    The OTel Collector sub-service handles all of this automatically.
    You only need to interact with the API directly for custom integrations
    (e.g. sending application logs from your own services).

    Organization: OpenObserve uses "default" as the initial organization name.
    All data ingested by the OTel Collector goes to the "default" org.
    Create additional organizations for multi-tenant setups.

help-openobserver-oidc-title = Authentication / SSO

help-openobserver-oidc-body =
    The OpenObserve OSS edition does not support OIDC authentication natively.
    Two options for access control:

    Option 1 — Zentinel Forward-Auth:
    Configure Zentinel to use a forward-auth middleware that validates Kanidm
    sessions before forwarding requests to OpenObserve. This provides SSO
    at the proxy layer without OpenObserve needing OIDC support.

    Option 2 — Local accounts:
    Use the built-in user management (Settings > Users) to create accounts
    for each team member. Passwords are managed in OpenObserve — no SSO.

    For most deployments, Option 2 is simpler since OpenObserve is an internal
    tool accessed only by admins. Option 1 is recommended if many team members
    need access.

    Note: The root admin account (ZO_ROOT_USER_EMAIL) always uses local
    authentication regardless of which option you choose.
