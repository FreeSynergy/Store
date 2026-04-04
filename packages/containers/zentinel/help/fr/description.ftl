zentinel-description =
    Zentinel est un proxy inverse et passerelle API natif Rust — la couche d'entrée pour tous les services FreeSynergy.

    Il gère la terminaison TLS, HTTP/2, le routage dynamique et la limitation de débit. Chaque service conteneur
    est exposé via Zentinel, qui route automatiquement le trafic en fonction des capacités enregistrées dans fs-registry.
    Les certificats TLS sont provisionnés automatiquement via ACME (Let's Encrypt).

zentinel-features =
    - TLS automatique via ACME (Let's Encrypt / CA personnalisée)
    - Routage dynamique — les routes se mettent à jour sans redémarrage
    - Entrée HTTP et HTTPS (ports 80 et 443)
    - Support HTTP/2 et WebSocket
    - Limitation de débit et throttling des requêtes
    - Géré via le Zentinel Control Plane
    - Routage automatique depuis les capacités fs-registry
    - Validation de token OAuth2 pour les routes protégées
