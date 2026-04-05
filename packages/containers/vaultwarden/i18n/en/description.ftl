vaultwarden-description =
    Vaultwarden is a lightweight self-hosted implementation of the Bitwarden server API, written in Rust.

    It provides a full-featured password vault with secure notes, TOTP codes, and organisational sharing.
    Users authenticate via Kanidm OIDC — no separate Vaultwarden accounts are needed.
    Supports all official Bitwarden clients (browser extensions, mobile apps, desktop apps).

vaultwarden-features =
    - Bitwarden-compatible API (all official clients supported)
    - Password vault with strong AES-256 encryption
    - Secure notes and TOTP / 2FA management
    - Organisation sharing and collections
    - OIDC single sign-on via Kanidm
    - Admin panel for user and organisation management
    - WebSocket push notifications for instant vault sync
    - PostgreSQL or SQLite storage
