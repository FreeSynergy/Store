kanidm-description =
    Kanidm è un moderno server di gestione delle identità e degli accessi
    scritto interamente in Rust.

    È il provider IAM predefinito per FreeSynergy ed è richiesto da Tuwunel
    (OIDC), Stalwart (OIDC) e fs-node (autenticazione). Tutti i servizi si
    autenticano tramite Kanidm utilizzando OAuth2 o OIDC — gli utenti
    effettuano l'accesso una sola volta e accedono a tutto.

    FreeSynergy distribuisce Kanidm dal proprio fork (FreeSynergy/fs-kanidm)
    per garantire build controllate, rilasci firmati e la possibilità di
    applicare patch retroattive.

kanidm-features =
    - Provider OAuth2 e OIDC
    - Server LDAP (per applicazioni legacy)
    - Provisioning utenti SCIM 2.0
    - Supporto WebAuthn e passkey
    - MFA (TOTP, chiavi di sicurezza)
    - Interfaccia web di amministrazione integrata
    - Scritto interamente in Rust — nessuna JVM, nessun runtime Python
