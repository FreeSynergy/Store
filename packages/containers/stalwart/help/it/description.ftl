stalwart-description =
    Stalwart è un server di posta all-in-one moderno scritto in Rust, che supporta SMTP, IMAP e JMAP.

    FreeSynergy include un fork preconfigurato con autenticazione OIDC di Kanidm e storage
    compatibile S3 per i dati email. Gli account utente sono gestiti centralmente in Kanidm
    e provisioned automaticamente via SCIM — nessun database separato necessario.

stalwart-features =
    - SMTP, SMTPS e invio SMTP (porte 25, 465, 587)
    - IMAP e IMAPS (porte 143, 993)
    - JMAP per client moderni (Bulwark Mail usa JMAP)
    - Anti-spam integrato, firma DKIM, applicazione SPF e DMARC
    - Single sign-on tramite Kanidm OIDC
    - Provisioning utenti SCIM da Kanidm
    - Storage compatibile S3 per i dati email
    - Interfaccia di amministrazione web per configurazione e monitoraggio
