# i18n/de/overview.ftl — FreeSynergy Container Manager Hilfetexte (Deutsch)

help-container-app-title = FreeSynergy Container Manager

help-container-app-body =
    FreeSynergy Container Manager installiert und verwaltet containerisierte Dienste
    auf diesem FreeSynergy-Node. Er verwendet Podman Quadlet — systemd-natives
    Container-Service-Management — statt einem Docker-Daemon oder Compose-Runtime.

    Über den Container Manager installierte Dienste werden von systemd verwaltet:
    Sie starten beim Booten, werden bei Fehler neu gestartet und ihre Logs sind
    in journalctl verfügbar, genau wie jeder andere systemd-Dienst.

help-container-app-install-title = Einen Dienst installieren

help-container-app-install-body =
    1. Das Container-Paket im Store finden und auf Installieren klicken.
    2. Der Container Manager zeigt ein Formular mit allen konfigurierbaren Variablen
       des Dienstes (Ports, Passwörter, Domainnamen, Feature-Flags).
       Jede Variable hat eine inline Hilfe, die erklärt, was sie tut.
    3. Die erforderlichen Werte ausfüllen. Geheimnisse (Passwörter, Token) werden
       in einer systemd-Credential-Datei gespeichert, nicht in der Quadlet-Unit-Datei.
    4. Auf Bereitstellen klicken. Der Container Manager generiert die Quadlet-Dateien,
       schreibt sie nach /etc/containers/systemd/ und aktiviert den Dienst.
    5. Der Dienst startet und sein Status erscheint in der Dienst-Liste.

help-container-app-multi-title = Mehrere Instanzen

help-container-app-multi-body =
    Die meisten Container-Pakete unterstützen den Betrieb als mehrere Instanzen.
    Beispielsweise können zwei Forgejo-Instanzen (eine für interne Projekte, eine
    für öffentliche) auf demselben Node mit verschiedenen Ports und Datenverzeichnissen
    betrieben werden.

    Bei der Installation eines Pakets, das mehrere Instanzen unterstützt, wird nach
    einem Instanznamen gefragt. Der Instanzname wird allen Ressourcennamen vorangestellt
    (Quadlet-Datei, Datenverzeichnis, systemd-Service-Name).

    Instanzname-Regeln:
    - Nur Kleinbuchstaben, Ziffern und Bindestriche
    - 3–24 Zeichen
    - Muss für dieses Paket auf diesem Node eindeutig sein

help-container-app-logs-title = Dienst-Protokolle

help-container-app-logs-body =
    Auf einen laufenden Dienst klicken, um den Protokoll-Viewer zu öffnen. Logs werden
    in Echtzeit aus journalctl gestreamt. Es kann nach Zeitbereich, Log-Level oder
    einem bestimmten Text gefiltert werden.

    Bei Diensten, die strukturierte Logs schreiben (JSON), parst der Protokoll-Viewer
    diese und zeigt sie mit Feld-Hervorhebung an.
