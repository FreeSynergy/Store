zentinel-description =
    Zentinel is the reverse proxy and TLS gateway for FreeSynergy.

    It sits in front of all services and handles TLS termination, ACME certificate
    renewal (Let's Encrypt and ZeroSSL), and HTTP routing. DNS-01 challenges are
    supported via pluggable DNS providers (Cloudflare, Hetzner, IONOS, and more).

    Zentinel is typically installed as part of the zentinel bundle together with
    Zentinel Control Plane, which provides the configuration dashboard.

zentinel-features =
    - TLS termination for all services
    - Automatic certificate renewal (ACME / Let's Encrypt)
    - HTTP/HTTPS routing with path-based rules
    - DNS-01 challenge support (Cloudflare, Hetzner, IONOS, …)
    - HTTP-01 challenge support
    - KDL-based configuration
