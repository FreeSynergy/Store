# help/en/overview.ftl — Kanidm help texts (English)

help-kanidm-title = Kanidm — Identity & Access Management

help-kanidm-body =
    Kanidm is a modern, high-performance identity management server written in Rust.
    It serves as the central authentication hub for the entire FreeSynergy platform —
    every service that supports SSO authenticates through Kanidm.

    Key capabilities:
    - Single Sign-On (SSO) via OpenID Connect (OIDC / OAuth2)
    - User and group management with a clean web UI
    - Hardware security key support (WebAuthn / passkeys)
    - LDAP directory for legacy integrations
    - SCIM provisioning for automated user sync
    - Fine-grained access control and audit logging

    Services that integrate with Kanidm: Forgejo, Outline, Tuwunel (Matrix),
    Vikunja, pretix, Stalwart, CryptPad, uMap, OpenObserve.

    Tip: Install and configure Kanidm first, then register OIDC clients for each
    service before installing those services.

help-kanidm-install-title = Installing Kanidm

help-kanidm-install-body =
    1. Choose a domain for Kanidm (e.g. auth.example.com) and enter it in the
       setup wizard as the service domain.
    2. The wizard generates a secure admin password and stores it in the vault.
       Copy it immediately — you will need it for the first login.
    3. Start the container. Kanidm initializes its database on first start.
    4. Visit https://auth.example.com/ui and log in as "admin" with the generated
       password.
    5. Create a regular admin account for daily use. The built-in "admin" account
       is only for bootstrapping.

    Note: Kanidm uses its own TLS — the reverse proxy must be set to upstream_tls = true.
    The Zentinel contract for kanidm handles this automatically.

help-kanidm-oidc-title = Registering OAuth2 / OIDC Clients

help-kanidm-oidc-body =
    For each service that will use Kanidm for SSO:
    1. Log in to the Kanidm web UI.
    2. Navigate to OAuth2 > Add OAuth2 Application.
    3. Set the client name exactly as expected by the service:
       - Forgejo: "forgejo"
       - Outline: "outline"
       - Vikunja: "vikunja"
       - pretix: "pretix"
       - Stalwart: "stalwart"
       - CryptPad: "cryptpad"
       - uMap: "umap"
    4. Add the redirect URI: https://<service-domain>/auth/callback
       (each service documents its exact callback path)
    5. Note the generated client secret — paste it into the service's setup wizard.

    Tip: Use groups in Kanidm to control which users can access each service.
    Add the group as a scope mapping in the OAuth2 client configuration.

help-kanidm-ldap-title = LDAP and SCIM

help-kanidm-ldap-body =
    Kanidm exposes a read-only LDAP interface for legacy applications that cannot
    use OIDC. The LDAP port (636 for LDAPS) is not published externally — it is
    only accessible inside the Podman network.

    LDAP bind DN format:  dn=token
    LDAP base DN:         dc=<domain>,dc=<tld>

    SCIM is available for automated provisioning from external HR systems or
    identity providers. See the Kanidm documentation for endpoint details.

    Note: Most modern services should use OIDC, not LDAP. LDAP support in Kanidm
    is intentionally limited to read operations for security reasons.
