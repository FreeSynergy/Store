init-description =
    FreeSynergy Init est le binaire d'amorçage unique pour FreeSynergy.

    Téléchargez le binaire pour votre plateforme, rendez-le exécutable et lancez-le.
    Il clone le dépôt FreeSynergy Store sur votre machine et démarre l'assistant
    d'installation — sans gestionnaire de paquets ni dépendances préinstallées requises.

    Une fois qu'Init a terminé, il passe le relais au Store, qui installe Node,
    Desktop et tous les services que vous choisissez.

    Init lui-même n'est pas installé — il n'est nécessaire qu'une seule fois, lors de la configuration initiale.

init-usage =
    # Linux / macOS
    chmod +x fs-init
    ./fs-init

    # Windows
    fs-init.exe
