kanidm-description =
    Kanidm is a modern identity and access management server built entirely in Rust.

    It is the default IAM provider for FreeSynergy and required by Tuwunel (OIDC),
    Stalwart (OIDC), and fs-node (authentication). All services authenticate through
    Kanidm using OAuth2 or OIDC — users log in once and access everything.

    FreeSynergy ships Kanidm from its own fork (FreeSynergy/fs-kanidm) to ensure
    controlled builds, signed releases, and the ability to backport patches.

kanidm-features =
    - OAuth2 and OIDC provider
    - LDAP server (for legacy applications)
    - SCIM 2.0 user provisioning
    - WebAuthn and passkey support
    - MFA (TOTP, security keys)
    - Built-in web admin UI
    - Written entirely in Rust — no JVM, no Python runtime
