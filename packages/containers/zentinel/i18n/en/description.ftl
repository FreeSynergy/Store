zentinel-description =
    Zentinel is a Rust-native reverse proxy and API gateway — the ingress layer for all FreeSynergy services.

    It handles TLS termination, HTTP/2, dynamic routing, and rate limiting. Every container service
    is exposed through Zentinel, which automatically routes traffic based on capabilities registered
    in fs-registry. TLS certificates are provisioned automatically via ACME (Let's Encrypt).

zentinel-features =
    - Automatic TLS via ACME (Let's Encrypt / custom CA)
    - Dynamic routing — routes update without restart
    - HTTP and HTTPS ingress (ports 80 and 443)
    - HTTP/2 and WebSocket support
    - Rate limiting and request throttling
    - Managed via Zentinel Control Plane
    - Auto-routing from fs-registry capabilities
    - OAuth2 token validation for protected routes
