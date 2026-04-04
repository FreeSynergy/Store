tuwunel-description =
    Tuwunel es un homeserver Matrix de alto rendimiento escrito en Rust, bifurcado y preconfigurado para FreeSynergy.

    Proporciona mensajería cifrada en tiempo real, salas, espacios y llamadas de voz/video a través
    del protocolo abierto Matrix. Los usuarios se autentican via Kanidm OIDC — no se necesitan
    cuentas Matrix separadas. Los archivos multimedia se almacenan en almacenamiento compatible con S3.

tuwunel-features =
    - API cliente-servidor Matrix (CS-API r0/v3)
    - Mensajería y transferencia de archivos cifrados de extremo a extremo
    - Salas, espacios y mensajes directos
    - Llamadas de voz y video via Element Call (TURN/STUN)
    - Federación Matrix con la red Matrix
    - Inicio de sesión único via Kanidm OIDC
    - Aprovisionamiento de usuarios SCIM desde Kanidm
    - Almacenamiento multimedia compatible con S3
    - Soporte de bots via fs-bots (adaptador fs-channel-matrix)
