# help/en/fields.ftl — Forgejo field help texts (English)

help-forgejo-field-domain-title = Service Domain

help-forgejo-field-domain-body =
    The public domain of this Forgejo instance (e.g. git.example.com).
    Used to build clone URLs, email links and the OAuth2 redirect URI.

    FORGEJO__server__DOMAIN is the bare domain (no scheme).
    FORGEJO__server__ROOT_URL is the full URL: https://{domain}

    Both are derived from the service_domain you set in the setup wizard.
    Make sure the domain matches the Zentinel proxy route exactly.

help-forgejo-field-secret-key-title = Secret Key

help-forgejo-field-secret-key-body =
    The FORGEJO__security__SECRET_KEY is a cryptographic secret used to sign
    cookies and internal tokens. It is auto-generated (64 hex characters) and
    stored in the vault.

    Important: Rotating this key will invalidate all active user sessions.
    All users will be logged out. Only rotate if you suspect the key has
    been compromised.

    Never share this key or commit it to version control.

help-forgejo-field-registration-title = User Registration

help-forgejo-field-registration-body =
    FORGEJO__service__DISABLE_REGISTRATION = "true" (default) prevents any
    new user from creating an account via the registration form or API.

    In a FreeSynergy deployment, user creation happens through Kanidm.
    When a Kanidm user signs in via OIDC for the first time, Forgejo creates
    their account automatically (FORGEJO__openid__ENABLE_OPENID_SIGNUP = "true").

    Set DISABLE_REGISTRATION = "false" only if you explicitly want to allow
    users to register with local username/password credentials in addition to
    OIDC. Not recommended for private instances.

help-forgejo-field-ssh-port-title = SSH Port Configuration

help-forgejo-field-ssh-port-body =
    Two SSH port variables control how users connect via Git-over-SSH:

    SSH_PORT: The port users put in their clone URLs. Should match what's
    reachable from the internet (e.g. 22 or 2222).

    SSH_LISTEN_PORT: The port inside the container. Default 2222 avoids
    conflicting with the host's own sshd on port 22.

    Example: host port 2222 → container port 2222, set SSH_PORT = 2222.
    Or: firewall/router forwards 22 → host:2222 → container:2222, set SSH_PORT = 22.

    Clone URL format: git@git.example.com:{SSH_PORT}/user/repo.git
    (Forgejo omits the port from the URL if SSH_PORT = 22)

help-forgejo-field-lfs-title = Git LFS

help-forgejo-field-lfs-body =
    FORGEJO__server__LFS_START_SERVER = "true" enables the built-in Git LFS
    (Large File Storage) endpoint. LFS allows large binary files (images, models,
    compiled artifacts) to be stored outside the Git history.

    LFS objects are stored in Forgejo's data volume. Make sure the volume has
    sufficient space if your repositories use LFS heavily.

    LFS requires HTTPS — not available over plain SSH. Users must have the
    git-lfs client installed.

help-forgejo-field-oidc-title = OIDC Auto-Registration

help-forgejo-field-oidc-body =
    FORGEJO__openid__ENABLE_OPENID_SIGNUP = "true" (default) automatically
    creates a Forgejo account the first time a user signs in via OIDC.

    The username is taken from the OIDC claim "preferred_username" (the
    Kanidm username). Email and display name are also synced from OIDC claims.

    This means: as long as users exist in Kanidm and have been granted access
    to the Forgejo OAuth2 client, they can log into Forgejo immediately —
    no manual account creation needed.

    Set ENABLE_OPENID_SIGNUP = "false" to require an admin to create accounts
    manually before users can first sign in.
