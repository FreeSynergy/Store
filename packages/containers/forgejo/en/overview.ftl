# help/en/overview.ftl — Forgejo help texts (English)

help-forgejo-title = Forgejo — Self-Hosted Git Forge

help-forgejo-body =
    Forgejo is a community-driven fork of Gitea — a lightweight, full-featured
    Git hosting platform. It provides the code collaboration layer of the
    FreeSynergy platform.

    Features:
    - Git repository hosting with web UI
    - Issues, pull requests, milestones and project boards
    - Forgejo Actions (CI/CD, compatible with GitHub Actions syntax)
    - Git LFS for large file storage
    - OAuth2 provider + OIDC consumer (SSO via Kanidm)
    - Webhook support for integration with other services
    - Package registry (npm, PyPI, container images, etc.)
    - Federation support (ForgeFed protocol)

    Dependencies: PostgreSQL (database), Dragonfly (cache/sessions/queues),
    Kanidm (SSO), optionally Stalwart (email notifications).

help-forgejo-install-title = Installing Forgejo

help-forgejo-install-body =
    1. Before installing Forgejo, create an OAuth2 client in Kanidm:
       - Client name: "forgejo"
       - Redirect URI: https://<forgejo-domain>/user/oauth2/kanidm/callback
       - Note the client secret.

    2. Run the setup wizard. Required fields:
       - Service domain (e.g. git.example.com)
       - OIDC client secret from Kanidm
       - Secret key (auto-generated)

    3. After the first start, Forgejo is immediately available via OIDC.
       Registration is disabled by default — users sign in through Kanidm.
       Admin accounts must be created via the Forgejo admin CLI or panel.

    4. To make someone an admin: log in as the first OIDC user, then run:
         podman exec {instance_name} forgejo admin user generate-access-token ...
       Or: log into the Forgejo admin panel at /admin/users.

help-forgejo-ssh-title = SSH Access for Git

help-forgejo-ssh-body =
    Forgejo exposes a Git-over-SSH server inside the container on port 2222
    (SSH_LISTEN_PORT). This port must be mapped to the host and reachable from
    clients. The SSH_PORT variable tells users which port to use in clone URLs.

    Example clone URL:  git@git.example.com:22/user/repo.git
    (assuming SSH_PORT = 22 and the host maps host:22 → container:2222)

    If your host already uses port 22 for its own SSH daemon, use a different
    external port (e.g. 2222) and set SSH_PORT = 2222 accordingly.

    Users must upload their SSH public keys in Forgejo's user settings before
    they can use Git-over-SSH.

    Note: Zentinel does not handle SSH traffic (it's a reverse proxy for HTTP/S).
    SSH must be port-forwarded at the host firewall level.

help-forgejo-mail-title = Email Notifications

help-forgejo-mail-body =
    Forgejo can send email for issue assignments, pull request reviews, and
    mentions. To enable this, configure the mailer settings:

    - FORGEJO__mailer__ENABLED = "true"
    - FORGEJO__mailer__SMTP_ADDR: hostname of the mail server
      (e.g. the Stalwart container name if using the Stalwart sub-service)
    - FORGEJO__mailer__SMTP_PORT: 465 for smtps, 587 for STARTTLS
    - FORGEJO__mailer__FROM: sender address (e.g. git@example.com)
    - FORGEJO__mailer__PASSWD: SMTP password (stored in vault)

    With Stalwart: set SMTP_ADDR to the Stalwart container name, PORT to 587,
    PROTOCOL to "smtp+starttls". Create a mailbox in Stalwart for the from address.

    Without a mail server: leave FORGEJO__mailer__ENABLED = "false". Users will
    still be notified in-app, just not by email.
