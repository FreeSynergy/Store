node-description =
    FreeSynergy Node est le moteur côté serveur de la plateforme FreeSynergy.

    Il gère les projets, les hôtes et les services fédérés. Il fournit un serveur de
    stockage compatible S3 pour les médias, les sauvegardes et les profils. Tous les
    autres programmes FreeSynergy — Desktop, Container Manager, Store — communiquent
    avec Node via son API REST.

    Node s'exécute en tant que service systemd et expose une CLI pour le scripting et
    l'automatisation. Chaque commande CLI correspond directement à un endpoint d'API.

node-features =
    - Gestion des projets et des hôtes
    - Serveur de stockage compatible S3 (profils, sauvegardes, médias)
    - Fédération avec d'autres nœuds FreeSynergy
    - API REST (toutes les commandes CLI sont des endpoints d'API)
    - Fournisseur de bus de messages
