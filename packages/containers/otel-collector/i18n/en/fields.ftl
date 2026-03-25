# help/en/fields.ftl — OTel Collector field help texts (English)

help-otel-collector-field-docker-host-title = Docker Host Socket (DOCKER_HOST)

help-otel-collector-field-docker-host-body =
    The path to the Podman socket inside the container, configured to look like
    a Docker socket so the docker_stats receiver can use it.

    Default: unix:///var/run/docker.sock

    The socket is mounted read-only from the host:
        /run/user/{user_uid}/podman/podman.sock → /var/run/docker.sock

    The docker_stats receiver uses this to collect per-container metrics:
    - CPU usage percentage
    - Memory usage and limit
    - Network I/O (bytes sent/received)
    - Block I/O (disk reads/writes)

    Do not change this value unless you have remapped the socket mount
    in the container definition.

    Note: "docker.sock" in the path is intentional — Podman exposes the same
    API as Docker. The docker_stats receiver doesn't know the difference.

help-otel-collector-field-config-title = Collector Configuration File

help-otel-collector-field-config-body =
    The Collector is configured via /etc/otelcol-contrib/config.yaml inside
    the container. This file is generated from a Tera template at deploy time
    and mounted read-only.

    The generated config includes:
    - Receiver configurations (ports, journal path, socket path)
    - Processor settings (batch size, memory limits)
    - Exporter target (OpenObserve OTLP endpoint with credentials)
    - Pipeline definitions connecting receivers to exporters

    To inspect the current config:
        podman exec {instance_name} cat /etc/otelcol-contrib/config.yaml

    To reload after a config change: restart the container.
        podman restart {instance_name}

    Advanced: To add custom receivers or processors, modify the Tera template
    in the module's templates/ directory and redeploy with `fsn deploy`.
