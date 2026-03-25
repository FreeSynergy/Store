# help/en/overview.ftl — Zentinel Control Plane help texts (English)

help-zentinel-plane-title = Zentinel Control Plane — Configuration Dashboard

help-zentinel-plane-body =
    Zentinel Control Plane is the management layer for the Zentinel reverse proxy.
    It provides a REST API and web dashboard for configuring all routing, certificate,
    and provider settings without editing configuration files directly.

    All changes made through the dashboard are applied to Zentinel in real time —
    no restart required for route updates and certificate configuration.

    Capabilities:
    - Route management: create, edit, and delete routing rules
    - Certificate management: view certificate status, trigger renewal manually
    - DNS provider configuration: set up DNS-01 challenge providers for wildcard certs
    - ACME provider selection: switch between Let's Encrypt and ZeroSSL
    - Real-time configuration reload
    - Audit log of configuration changes

    The control plane is included in the Zentinel bundle and is the recommended
    way to install both components together.

help-zentinel-plane-routes-title = Managing Routes

help-zentinel-plane-routes-body =
    Routes define how incoming HTTPS traffic is forwarded to internal services.
    Each route specifies:
    - Domain (e.g. forgejo.example.com)
    - Path prefix (e.g. / for the entire domain)
    - Upstream service address (container name and port)
    - Whether to strip the path prefix from the forwarded request
    - Whether the upstream uses its own TLS (upstream_tls)

    Routes can be created manually in the dashboard or are generated automatically
    from service contracts when running `fsn deploy`.

    Manually added routes persist across deployments unless explicitly removed.

help-zentinel-plane-certs-title = Certificate Management

help-zentinel-plane-certs-body =
    The control plane shows the status and expiry date of all TLS certificates
    managed by Zentinel. Certificates are renewed automatically by Zentinel before
    expiry — the dashboard lets you see renewal status and trigger early renewal.

    For wildcard certificates (*.example.com), a DNS-01 ACME challenge is required.
    Configure the DNS provider plugin in the control plane settings before requesting
    a wildcard certificate.

    Supported DNS providers: Cloudflare, Route 53, DigitalOcean, and others via
    the Zentinel DNS plugin interface.
