kanidm-description =
    Kanidm is a modern, high-performance identity and access management server built entirely in Rust.

    It is the central IAM backbone for FreeSynergy — every service authenticates through Kanidm.
    It provides OAuth2, OIDC, LDAP, SCIM 2.0, WebAuthn passkeys, and MFA out of the box.
    FreeSynergy ships its own fork with SCIM provisioning and PAM integration pre-configured.

kanidm-features =
    - OAuth2 and OpenID Connect (OIDC) identity provider
    - SCIM 2.0 for automated user and group provisioning
    - LDAP interface for legacy application compatibility
    - WebAuthn passkeys and TOTP/FIDO2 multi-factor authentication
    - PAM integration for Linux system login
    - Self-service password and SSH key management
    - Group-based access control for all FreeSynergy services
    - Built-in web UI and CLI (kanidm client)
