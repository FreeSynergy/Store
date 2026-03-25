# help/en/overview.ftl — Outline help texts (English)

help-outline-title = Outline — Collaborative Wiki & Knowledge Base

help-outline-body =
    Outline is a modern, open-source wiki and knowledge base with a clean,
    Notion-like editing experience. It serves as the documentation and knowledge
    management layer of the FreeSynergy platform.

    Features:
    - Real-time collaborative editing
    - Rich markdown editor with slash commands
    - Nested document collections and automatic table of contents
    - Full-text search with instant results
    - Document history and version comparison
    - File and image attachments
    - Public sharing with optional password protection
    - API for programmatic document access
    - OIDC / SSO authentication

    Dependencies: PostgreSQL (documents and user data), Dragonfly (caching,
    sessions), Kanidm (SSO), optionally Stalwart (email invitations).

    All documents are stored in PostgreSQL. Uploaded files and images are stored
    on the local volume (FILE_STORAGE = "local") or in an S3-compatible bucket.
    FreeSynergy's built-in S3 server is the recommended storage backend for
    multi-user deployments.

help-outline-install-title = Installing Outline

help-outline-install-body =
    1. Before installing, create an OAuth2 client in Kanidm:
       - Client name: "outline"
       - Redirect URI: https://wiki.example.com/auth/oidc.callback
       - Scopes: openid, email, profile
       - Note the client secret.

    2. Run the setup wizard. Required fields:
       - Service domain (e.g. wiki.example.com)
       - OIDC client secret from Kanidm
       - Secret key and utils secret (auto-generated)

    3. After first start, the first user to log in via OIDC becomes an admin.
       Create collections and invite team members from the settings panel.

    4. Configure email (optional) for invitation emails and notifications:
       - SMTP_HOST, SMTP_PORT, SMTP_FROM_EMAIL, SMTP_PASSWORD

    Note: Outline uses Node.js (NODE_ENV = "production" required). The health
    check endpoint is /_health.

help-outline-storage-title = File Storage

help-outline-storage-body =
    Outline supports two file storage backends:

    1. Local storage (default, FILE_STORAGE = "local"):
       Files are stored in the container volume at /var/lib/outline/data.
       Mounted from {config_dir}/data on the host.
       Simple to set up, but not horizontally scalable.

    2. S3 storage (FILE_STORAGE = "s3"):
       Files are stored in an S3-compatible bucket. Requires additional
       environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY,
       AWS_REGION, AWS_S3_UPLOAD_BUCKET_NAME, AWS_S3_UPLOAD_BUCKET_URL.
       The FreeSynergy built-in S3 server (part of fs-node) can serve as the
       backend. Set the bucket URL to the node's S3 endpoint.

    File size limit is controlled by FILE_STORAGE_UPLOAD_MAX_SIZE (bytes).
    Default is 250 MB. Increase if your team shares large files.

    Backup: The data volume contains all uploaded files. Include it in your
    regular backup alongside the PostgreSQL dump.

help-outline-mail-title = Email Configuration

help-outline-mail-body =
    Outline sends emails for:
    - Team invitations (invite a user by email address)
    - Mention notifications
    - Document activity summaries

    To enable email, configure:
        SMTP_HOST:       mail server hostname (e.g. Stalwart container name)
        SMTP_PORT:       587 (STARTTLS) or 465 (implicit TLS)
        SMTP_USERNAME:   SMTP auth username
        SMTP_PASSWORD:   SMTP auth password (vault_outline_smtp_password)
        SMTP_FROM_EMAIL: sender address (e.g. wiki@example.com)
        SMTP_REPLY_EMAIL: reply-to address (can differ from from)
        SMTP_SECURE:     "true" (always in production)

    With Stalwart: set SMTP_HOST to the Stalwart container name, PORT to 587.
    Create a dedicated mailbox in Stalwart for the wiki sender address.

    Without email: team members can still be added by the admin. They will
    receive in-app notifications but no emails.
