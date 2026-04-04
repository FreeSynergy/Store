zentinel-plane-description =
    Le Zentinel Control Plane gère la flotte de proxies Zentinel avec une configuration centralisée des routes et TLS.

    Il fournit une API REST et un tableau de bord pour ajouter, mettre à jour et supprimer des routes proxy
    sur toutes les instances Zentinel. FreeSynergy l'utilise pour la gestion centralisée de l'ingress — quand
    un nouveau service est installé, le fs-container-adapter enregistre ses routes ici automatiquement.

zentinel-plane-features =
    - Configuration centralisée des routes pour tous les proxies Zentinel
    - Provisionnement et renouvellement automatiques des certificats TLS
    - Surveillance de l'état de toutes les instances proxy
    - API REST pour la gestion programmatique des routes
    - Tableau de bord pour les routes actives et l'état des certificats
    - Enregistrement automatique des routes via l'intégration fs-registry
    - API d'administration protégée par OAuth2 (Kanidm)
