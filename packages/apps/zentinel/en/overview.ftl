# help/en/overview.ftl — Zentinel help texts (English)

help-zentinel-title = Zentinel — Reverse Proxy with Automatic TLS

help-zentinel-body =
    Zentinel is the single external entry point for the entire FreeSynergy platform.
    It is the ONLY container with published ports (80 and 443) — all other services
    are reachable only through Zentinel, never directly from the internet.

    Zentinel handles:
    - Reverse proxying all HTTP/S traffic to internal services
    - Automatic TLS certificate provisioning via ACME (Let's Encrypt / ZeroSSL)
    - Certificate renewal (automatic, before expiry)
    - HTTP → HTTPS redirect (all HTTP traffic is upgraded to HTTPS)
    - Routing based on domain names and path prefixes
    - WebSocket proxy support
    - Upstream TLS support (for services with their own TLS, e.g. Kanidm, Stalwart)

    Configuration is via a KDL (KDL Document Language) file, generated
    automatically by the generate-config plugin from all service contracts.
    You never edit the KDL file manually — it is regenerated on every `fsn deploy`.

    Constraint: per_host = 1, per_ip = 1 — exactly one Zentinel per host.

help-zentinel-tls-title = Automatic TLS (ACME)

help-zentinel-tls-body =
    Zentinel automatically obtains and renews TLS certificates for all configured
    domains using the ACME protocol (Automatic Certificate Management Environment).

    ACME providers supported:
    - Let's Encrypt (default, free, rate limits apply)
    - ZeroSSL (alternative, free tier available)

    The ACME email address is configured in the host.toml file under:
        [proxy]
        acme_email = "admin@example.com"

    This email receives expiry warnings from Let's Encrypt. Use a real,
    monitored address.

    Certificate storage: /data/certificates/ inside the container, backed
    by the config volume.

    Rate limits (Let's Encrypt):
    - 50 certificates per registered domain per week
    - 5 duplicate certificates per week
    - Do not redeploy/reinstall Zentinel frequently with production domains

    For local development: use a self-signed certificate or disable ACME.
    Wildcard certificates require DNS-01 challenge (configure the DNS plugin).

help-zentinel-routing-title = Routing and Service Contracts

help-zentinel-routing-body =
    Each service defines its routing requirements in the [contract] section
    of its module TOML. Zentinel's generate-config plugin reads all contracts
    and generates a KDL configuration file.

    Contract example (from kanidm.toml):
        [contract]
        upstream_tls = true
        [[contract.routes]]
        id    = "main"
        path  = "/"

    This tells Zentinel:
    - Forward all traffic for the Kanidm domain to the Kanidm container
    - Use HTTPS for the upstream connection (upstream_tls = true)

    The generated KDL maps each service's domain to its container name and port.
    The container name is automatically derived from the instance name at deploy time.

    Regenerate the config after adding or removing services:
        fsn deploy  (regenerates and restarts Zentinel)

help-zentinel-security-title = Security Model

help-zentinel-security-body =
    Zentinel is the platform's security boundary:

    1. ONLY Zentinel has published_ports = ["80:80", "443:443"]
       All other containers have NO published_ports — they are unreachable
       from outside the Podman network.

    2. All external traffic enters through Zentinel. Services that should not
       be publicly accessible (e.g. PostgreSQL, Dragonfly) simply have no
       Zentinel contract — they are invisible from the internet.

    3. TLS everywhere: Zentinel terminates TLS for all external connections.
       Internal connections between Zentinel and services may be plain HTTP
       (within the trusted Podman network) or HTTPS (upstream_tls = true).

    4. No other reverse proxies: Do not run Nginx, Caddy, or Apache alongside
       Zentinel. Having two proxies creates routing confusion and double TLS.

    Best practices:
    - Configure your host firewall to only allow ports 80, 443, and 22 (SSH)
    - Never open port ranges for services — let Zentinel route them
    - Use Zentinel's forward-auth for services without OIDC (e.g. OpenObserve)
