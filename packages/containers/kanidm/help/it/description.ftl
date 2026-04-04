kanidm-description =
    Kanidm è un server moderno per la gestione delle identità e degli accessi, scritto interamente in Rust.

    È il nucleo IAM centrale di FreeSynergy — ogni servizio si autentica tramite Kanidm.
    Fornisce OAuth2, OIDC, LDAP, SCIM 2.0, passkey WebAuthn e MFA senza configurazione aggiuntiva.
    FreeSynergy include il proprio fork con provisioning SCIM e integrazione PAM preconfigurati.

kanidm-features =
    - Provider di identità OAuth2 e OpenID Connect (OIDC)
    - SCIM 2.0 per il provisioning automatizzato di utenti e gruppi
    - Interfaccia LDAP per la compatibilità con applicazioni legacy
    - Passkey WebAuthn e autenticazione multi-fattore TOTP/FIDO2
    - Integrazione PAM per il login di sistema Linux
    - Gestione self-service di password e chiavi SSH
    - Controllo degli accessi basato su gruppi per tutti i servizi FreeSynergy
    - Interfaccia web e CLI integrate (client kanidm)
