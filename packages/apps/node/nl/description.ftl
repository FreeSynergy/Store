node-description =
    FreeSynergy Node is de server-side motor van het FreeSynergy-platform.

    Het beheert projecten, hosts en gefedereerde services. Het biedt een
    S3-compatibele opslagserver voor media, back-ups en profielen. Alle
    andere FreeSynergy-programma's — Desktop, Container Manager, Store —
    communiceren met Node via de REST API.

    Node draait als een systemd-service en biedt een CLI voor scripting
    en automatisering. Elk CLI-commando komt direct overeen met een
    API-eindpunt.

node-features =
    - Project- en hostbeheer
    - S3-compatibele opslagserver (profielen, back-ups, media)
    - Federatie met andere FreeSynergy-knooppunten
    - REST API (alle CLI-commando's zijn API-eindpunten)
    - Berichtenbusprovider
