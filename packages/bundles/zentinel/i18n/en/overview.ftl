# help/en/overview.ftl — Zentinel Bundle help texts (English)

help-zentinel-bundle-title = Zentinel Bundle — Reverse Proxy + Control Plane

help-zentinel-bundle-body =
    The Zentinel bundle installs both components required for FreeSynergy's
    reverse proxy infrastructure in a single step:

    - Zentinel — the reverse proxy server that handles all inbound HTTPS traffic,
      terminates TLS, and routes requests to the appropriate service.
    - Zentinel Control Plane — the REST API and web dashboard for managing routes,
      certificates, DNS providers, and ACME configuration.

    Installing the bundle is the recommended approach for new FreeSynergy nodes.
    Both components are configured and started together, and the control plane
    is pre-connected to the proxy.

    If you need only the proxy without the dashboard (e.g. for a minimal headless
    deployment), you can install the Zentinel app package directly instead.

help-zentinel-bundle-order-title = Installation Order

help-zentinel-bundle-order-body =
    Zentinel (and therefore this bundle) should be installed first — before any
    service that requires external HTTPS access. The reason:

    1. All services with a Zentinel contract define their domain in that contract.
    2. `fsn deploy` reads all contracts and generates Zentinel's routing config.
    3. Zentinel requests TLS certificates for those domains on first start.

    Recommended order:
    1. Install this bundle (Zentinel + Control Plane)
    2. Install Kanidm (IAM — needed by all OIDC services)
    3. Install remaining services (Forgejo, Outline, etc.)
    4. Run `fsn deploy` to apply all routing

    Zentinel will obtain TLS certificates for all configured domains on first deploy.
    Ensure your DNS records point to the host's public IP before running `fsn deploy`.
