stalwart-description =
    Stalwart est un serveur de messagerie tout-en-un moderne écrit en Rust, supportant SMTP, IMAP et JMAP.

    FreeSynergy fournit un fork préconfiguré avec l'authentification OIDC de Kanidm et un stockage
    compatible S3 pour les données de messagerie. Les comptes utilisateurs sont gérés centralement
    dans Kanidm et provisionnés automatiquement via SCIM — aucune base de données séparée n'est requise.

stalwart-features =
    - SMTP, SMTPS et soumission SMTP (ports 25, 465, 587)
    - IMAP et IMAPS (ports 143, 993)
    - JMAP pour les clients modernes (Bulwark Mail utilise JMAP)
    - Anti-spam intégré, signature DKIM, application SPF et DMARC
    - Authentification unique via Kanidm OIDC
    - Provisionnement SCIM des utilisateurs depuis Kanidm
    - Stockage compatible S3 pour les données de messagerie
    - Interface d'administration web pour la configuration et la surveillance
