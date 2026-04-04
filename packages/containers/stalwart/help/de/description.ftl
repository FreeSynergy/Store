stalwart-description =
    Stalwart ist ein moderner All-in-One-Mailserver in Rust, der SMTP, IMAP und JMAP unterstützt.

    FreeSynergy liefert einen vorkonfigurierten Fork mit Kanidm-OIDC-Authentifizierung und S3-kompatibler
    Speicherung für E-Mail-Daten. Benutzerkonten werden zentral in Kanidm verwaltet und automatisch
    per SCIM bereitgestellt — keine separate Benutzerdatenbank erforderlich.

stalwart-features =
    - SMTP, SMTPS und SMTP-Submission (Ports 25, 465, 587)
    - IMAP und IMAPS (Ports 143, 993)
    - JMAP für moderne Clients (Bulwark Mail nutzt JMAP)
    - Eingebauter Anti-Spam, DKIM-Signierung, SPF- und DMARC-Durchsetzung
    - Single Sign-On via Kanidm OIDC
    - SCIM-Benutzerbereitstellung aus Kanidm
    - S3-kompatibler Speicher für E-Mail-Daten
    - Web-Admin-UI für Konfiguration und Monitoring
