kanidm-description =
    Kanidm est un serveur moderne de gestion des identités et des accès, entièrement écrit en Rust.

    Il constitue le socle IAM central de FreeSynergy — chaque service s'authentifie via Kanidm.
    Il fournit OAuth2, OIDC, LDAP, SCIM 2.0, les passkeys WebAuthn et le MFA sans configuration supplémentaire.
    FreeSynergy livre son propre fork avec provisionnement SCIM et intégration PAM préconfigurés.

kanidm-features =
    - Fournisseur d'identité OAuth2 et OpenID Connect (OIDC)
    - SCIM 2.0 pour le provisionnement automatisé des utilisateurs et des groupes
    - Interface LDAP pour la compatibilité avec les applications legacy
    - Passkeys WebAuthn et authentification multi-facteurs TOTP/FIDO2
    - Intégration PAM pour la connexion système Linux
    - Gestion en libre-service des mots de passe et des clés SSH
    - Contrôle d'accès basé sur les groupes pour tous les services FreeSynergy
    - Interface web et CLI intégrées (client kanidm)
