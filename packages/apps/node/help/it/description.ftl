node-description =
    FreeSynergy Node è il motore lato server della piattaforma FreeSynergy.

    Gestisce progetti, host e servizi federati. Fornisce un server di
    storage compatibile con S3 per media, backup e profili. Tutti gli altri
    programmi FreeSynergy — Desktop, Container Manager, Store — comunicano
    con Node tramite la sua API REST.

    Node viene eseguito come servizio systemd e fornisce una CLI per
    scripting e automazione. Ogni comando CLI corrisponde direttamente a
    un endpoint API.

node-features =
    - Gestione di progetti e host
    - Server di storage compatibile con S3 (profili, backup, media)
    - Federazione con altri nodi FreeSynergy
    - API REST (tutti i comandi CLI sono endpoint API)
    - Provider del bus messaggi
