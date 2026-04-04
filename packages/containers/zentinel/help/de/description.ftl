zentinel-description =
    Zentinel ist ein Rust-nativer Reverse-Proxy und API-Gateway — die Ingress-Schicht für alle FreeSynergy-Dienste.

    Es übernimmt TLS-Terminierung, HTTP/2, dynamisches Routing und Rate-Limiting. Jeder Container-Dienst
    wird über Zentinel exponiert, das Traffic automatisch basierend auf Capabilities in fs-registry routet.
    TLS-Zertifikate werden automatisch per ACME (Let's Encrypt) bereitgestellt.

zentinel-features =
    - Automatisches TLS via ACME (Let's Encrypt / eigene CA)
    - Dynamisches Routing — Routen ohne Neustart aktualisierbar
    - HTTP- und HTTPS-Ingress (Ports 80 und 443)
    - HTTP/2- und WebSocket-Unterstützung
    - Rate-Limiting und Anfragen-Drosselung
    - Verwaltung über Zentinel Control Plane
    - Auto-Routing aus fs-registry Capabilities
    - OAuth2-Token-Validierung für geschützte Routen
