# help/en/fields.ftl — Zentinel Control Plane field help texts (English)

help-zentinel-plane-field-port-title = Control Plane Port

help-zentinel-plane-field-port-body =
    The port the Zentinel Control Plane API and dashboard listen on inside the
    Podman network. Default is 9000.

    This port is NOT published externally. The Control Plane is accessed via
    Zentinel's own routing — it has a Zentinel contract that forwards the
    control plane domain (e.g. proxy-admin.example.com) to this port.

    Change this only if port 9000 conflicts with another internal service. If you
    change it, update the Zentinel routing configuration to match.

    Important: This is an internal port within the Podman network. External access
    is always via Zentinel on port 443 — never expose this port directly.
