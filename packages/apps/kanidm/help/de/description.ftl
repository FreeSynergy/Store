kanidm-description =
    Kanidm ist ein moderner Identity- und Access-Management-Server, vollständig in Rust geschrieben.

    Es ist der Standard-IAM-Provider von FreeSynergy und wird von Tuwunel (OIDC),
    Stalwart (OIDC) und fs-node (Authentifizierung) benötigt. Alle Dienste authentifizieren
    sich über Kanidm mit OAuth2 oder OIDC — Benutzer loggen sich einmal ein und haben
    Zugriff auf alles.

    FreeSynergy liefert Kanidm aus seinem eigenen Fork (FreeSynergy/fs-kanidm) um
    kontrollierte Builds, signierte Releases und die Möglichkeit zu Backports zu gewährleisten.

kanidm-features =
    - OAuth2- und OIDC-Provider
    - LDAP-Server (für Legacy-Anwendungen)
    - SCIM 2.0 Benutzer-Provisionierung
    - WebAuthn und Passkey-Unterstützung
    - MFA (TOTP, Sicherheitsschlüssel)
    - Eingebautes Web-Admin-UI
    - Vollständig in Rust — kein JVM, keine Python-Runtime
