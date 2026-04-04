stalwart-description =
    Stalwart is a modern all-in-one mail server written in Rust, supporting SMTP, IMAP, and JMAP.

    FreeSynergy ships a pre-configured fork with Kanidm OIDC authentication and S3-compatible
    storage for message data. No separate user database is needed — accounts are managed
    centrally in Kanidm and provisioned automatically via SCIM.

stalwart-features =
    - SMTP, SMTPS, and SMTP Submission (ports 25, 465, 587)
    - IMAP and IMAPS (ports 143, 993)
    - JMAP for modern clients (Bulwark Mail uses JMAP)
    - Built-in anti-spam, DKIM signing, SPF and DMARC enforcement
    - OIDC single sign-on via Kanidm
    - SCIM user provisioning from Kanidm
    - S3-compatible storage for email data
    - Web admin UI for configuration and monitoring
