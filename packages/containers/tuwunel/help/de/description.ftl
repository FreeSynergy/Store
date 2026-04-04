tuwunel-description =
    Tuwunel ist ein hochperformanter Matrix-Homeserver in Rust, als Fork für FreeSynergy vorkonfiguriert.

    Er bietet verschlüsselte Echtzeit-Kommunikation, Räume, Spaces und Sprach-/Videoanrufe über das offene Matrix-Protokoll.
    Benutzer melden sich über Kanidm OIDC an — keine separaten Matrix-Konten erforderlich.
    Mediendateien werden in S3-kompatiblem Speicher abgelegt. Unterstützt Federation mit anderen Matrix-Servern.

tuwunel-features =
    - Matrix Client-Server API (CS-API r0/v3)
    - Ende-zu-Ende-verschlüsselte Nachrichten und Dateiübertragung
    - Räume, Spaces und Direktnachrichten
    - Sprach- und Videoanrufe via Element Call (TURN/STUN)
    - Matrix-Federation mit dem Matrix-Netzwerk
    - Single Sign-On via Kanidm OIDC
    - SCIM-Benutzerbereitstellung aus Kanidm
    - S3-kompatibler Medienspeicher
    - Bot-Unterstützung via fs-bots (fs-channel-matrix Adapter)
