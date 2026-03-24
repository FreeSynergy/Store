kanidm-description =
    Kanidm est un serveur moderne de gestion des identités et des accès, entièrement développé en Rust.

    C'est le fournisseur IAM par défaut de FreeSynergy et il est requis par Tuwunel (OIDC),
    Stalwart (OIDC) et fs-node (authentification). Tous les services s'authentifient via
    Kanidm en utilisant OAuth2 ou OIDC — les utilisateurs se connectent une fois et accèdent à tout.

    FreeSynergy distribue Kanidm depuis son propre fork (FreeSynergy/fs-kanidm) pour garantir
    des compilations contrôlées, des versions signées et la capacité d'appliquer des correctifs rétroactifs.

kanidm-features =
    - Fournisseur OAuth2 et OIDC
    - Serveur LDAP (pour les applications legacy)
    - Provisionnement d'utilisateurs SCIM 2.0
    - Support WebAuthn et passkeys
    - MFA (TOTP, clés de sécurité)
    - Interface d'administration web intégrée
    - Entièrement écrit en Rust — sans JVM, sans runtime Python
