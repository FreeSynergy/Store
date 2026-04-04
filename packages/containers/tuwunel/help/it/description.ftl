tuwunel-description =
    Tuwunel è un homeserver Matrix ad alte prestazioni scritto in Rust, biforcato e preconfigurato per FreeSynergy.

    Fornisce messaggistica cifrata in tempo reale, stanze, spazi e chiamate voce/video tramite
    il protocollo aperto Matrix. Gli utenti si autenticano via Kanidm OIDC — nessun account
    Matrix separato necessario. I media sono archiviati in storage compatibile S3.

tuwunel-features =
    - API client-server Matrix (CS-API r0/v3)
    - Messaggistica e condivisione file cifrati end-to-end
    - Stanze, spazi e messaggi diretti
    - Chiamate voce e video via Element Call (TURN/STUN)
    - Federazione Matrix con la rete Matrix
    - Single sign-on tramite Kanidm OIDC
    - Provisioning utenti SCIM da Kanidm
    - Storage multimediale compatibile S3
    - Supporto bot tramite fs-bots (adattatore fs-channel-matrix)
