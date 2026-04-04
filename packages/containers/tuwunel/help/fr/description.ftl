tuwunel-description =
    Tuwunel est un serveur Matrix haute performance écrit en Rust, forké et préconfiguré pour FreeSynergy.

    Il fournit une messagerie chiffrée en temps réel, des salons, des espaces et des appels voix/vidéo
    via le protocole ouvert Matrix. Les utilisateurs s'authentifient via Kanidm OIDC — aucun compte
    Matrix séparé n'est nécessaire. Les médias sont stockés dans un stockage compatible S3.

tuwunel-features =
    - API client-serveur Matrix (CS-API r0/v3)
    - Messagerie et partage de fichiers chiffrés de bout en bout
    - Salons, espaces et messages directs
    - Appels voix et vidéo via Element Call (TURN/STUN)
    - Fédération Matrix avec le réseau Matrix
    - Authentification unique via Kanidm OIDC
    - Provisionnement SCIM des utilisateurs depuis Kanidm
    - Stockage multimédia compatible S3
    - Support des bots via fs-bots (adaptateur fs-channel-matrix)
