# help/en/overview.ftl — Stalwart help texts (English)

help-stalwart-title = Stalwart — All-in-One Mail Server

help-stalwart-body =
    Stalwart is a modern, full-featured mail server written in Rust. It provides
    the email infrastructure for the FreeSynergy platform and other services that
    depend on transactional email (Forgejo, Outline, Vikunja, pretix).

    Protocols supported:
    - SMTP (port 25/587) — sending and receiving email
    - IMAP (port 993) — traditional email client access
    - JMAP — modern JSON-based email protocol (recommended for new clients)
    - CalDAV — calendar synchronization
    - CardDAV — contacts synchronization
    - Sieve — server-side email filtering rules
    - Anti-spam (built-in): SpamAssassin-compatible scoring

    Stalwart manages all its configuration via a Web Admin UI and stores settings
    in its own database — not in environment variables. Only STALWART_HOSTNAME and
    STALWART_DOMAINS are used for initial bootstrapping.

    Integration: Stalwart acts as a sub-service for Forgejo, Outline, Vikunja and
    pretix to send notifications. It also integrates with Kanidm for SSO access to
    the webmail and admin interfaces.

help-stalwart-install-title = Installing Stalwart

help-stalwart-install-body =
    1. Before installing, ensure you have:
       - A valid mail domain (e.g. example.com)
       - DNS control to add MX, SPF, DKIM and DMARC records
       - A hostname for the mail server (e.g. mail.example.com)

    2. Run the setup wizard:
       - STALWART_HOSTNAME: mail.example.com
       - STALWART_DOMAINS: example.com (comma-separated for multiple domains)
       - Admin password: auto-generated, stored in vault

    3. After the first start, visit https://mail.example.com/admin to access
       the Web Admin UI. Log in with "admin" and the generated password.

    4. In the Admin UI, configure:
       - DKIM signing keys for your domain
       - OIDC authentication (Settings > Authentication > OIDC)
       - Mailboxes for services that need a send-only address

    5. Add DNS records (see the DNS topic for details).

    Note: Stalwart uses its own TLS managed internally — the Zentinel proxy must
    use upstream_tls = true for the Stalwart route.

help-stalwart-dns-title = Required DNS Records

help-stalwart-dns-body =
    For email delivery to work correctly, add these DNS records for your domain:

    MX record:
        example.com.  MX  10  mail.example.com.

    SPF record (TXT):
        example.com.  TXT  "v=spf1 mx -all"
        (allows only your MX host to send mail for this domain)

    DKIM record (TXT):
        selector._domainkey.example.com.  TXT  "v=DKIM1; k=rsa; p=<public-key>"
        (generate the key in Stalwart Web Admin under Signing Keys)

    DMARC record (TXT):
        _dmarc.example.com.  TXT  "v=DMARC1; p=quarantine; rua=mailto:dmarc@example.com"

    SRV records (for auto-discovery):
        _submission._tcp.example.com.  SRV  0 1 587 mail.example.com.
        _imaps._tcp.example.com.       SRV  0 1 993 mail.example.com.

    Tip: Use mail-tester.com to verify your configuration after DNS propagates.
    A score of 10/10 means your mail server is correctly configured.

help-stalwart-oidc-title = OIDC Integration with Kanidm

help-stalwart-oidc-body =
    Stalwart supports OIDC for authentication to the webmail and admin interfaces.
    This is configured in the Web Admin UI — not via environment variables.

    Steps:
    1. In Kanidm, create an OAuth2 client named "stalwart":
       - Redirect URI: https://mail.example.com/auth/callback
       - Scopes: openid, email, profile
    2. Note the client ID and client secret.
    3. In Stalwart Web Admin: Settings > Authentication > OpenID Connect
       - Issuer URL: https://auth.example.com/oauth2/openid/stalwart
       - Client ID: stalwart
       - Client Secret: (from Kanidm)

    After OIDC is configured, users can log into the Stalwart webmail with their
    Kanidm credentials. The "admin" account continues to use local authentication.
