# help/en/overview.ftl — OTel Collector help texts (English)

help-otel-collector-title = OpenTelemetry Collector — Telemetry Pipeline

help-otel-collector-body =
    The OpenTelemetry Collector is the central telemetry pipeline for the
    FreeSynergy platform. It collects logs, metrics and traces from all running
    services and forwards them to OpenObserve for storage and analysis.

    What it collects:
    - Container logs from all Podman containers (via journald receiver)
    - Container resource metrics (CPU, memory, network, disk I/O) via docker_stats
      receiver, using the Podman socket mounted as a Docker-compatible socket
    - Host-level metrics (disk, CPU, memory) via hostmetrics receiver
    - OTLP data pushed by applications that support OpenTelemetry natively

    The Collector runs as a single container per host with read-only access to:
    - /run/user/{uid}/podman/podman.sock (Podman socket)
    - /var/log/journal (systemd journal for container log collection)
    - /run/log/journal (current journal entries)

    Dependencies: OpenObserve (data destination). The Collector is always
    deployed as a sub-service alongside OpenObserve.

    Constraint: per_host = 1 — only one Collector instance per host.

help-otel-collector-pipeline-title = Collector Pipeline

help-otel-collector-body-pipeline =
    The OTel Collector is configured via otel-config.yaml (generated from a
    template at deploy time). The pipeline consists of:

    Receivers (data sources):
    - otlp: accepts OTLP/HTTP (port 4318) and OTLP/gRPC (port 4317) from apps
    - journald: reads container logs from systemd journal
    - docker_stats: scrapes Podman container metrics via the Docker socket
    - hostmetrics: collects host CPU, memory, disk metrics

    Processors (transformations):
    - batch: groups data into batches for efficient export
    - resource: adds metadata (host, service name) to all telemetry
    - memory_limiter: prevents OOM if the pipeline gets overloaded

    Exporters (destinations):
    - otlphttp: sends everything to OpenObserve via OTLP/HTTP

    The complete pipeline: Receivers → Processors → Exporters
    Each signal type (logs, metrics, traces) has its own pipeline.

help-otel-collector-podman-title = Podman Socket Integration

help-otel-collector-podman-body =
    The OTel Collector mounts the Podman socket as /var/run/docker.sock inside
    the container to make it appear as a Docker socket. This allows the
    docker_stats receiver to collect per-container CPU and memory metrics
    without requiring Docker.

    The socket is mounted read-only — the Collector can only read stats, not
    start/stop containers.

    Socket path on the host:
        /run/user/{user_uid}/podman/podman.sock

    The {user_uid} template variable is filled in by FreeSynergy at deploy time
    based on the user running the Podman daemon.

    Journal mounts:
        /var/log/journal — persistent journal logs (between reboots)
        /run/log/journal — volatile journal logs (current boot)

    Both are needed to capture all container log output. Journald collects
    logs from all Quadlet-managed containers automatically.
