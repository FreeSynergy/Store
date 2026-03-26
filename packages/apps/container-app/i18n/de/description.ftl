container-app-description =
    FreeSynergy Container Manager ist die grafische Oberfläche für die Verwaltung
    containerisierter Dienste auf einem FreeSynergy-Node.

    Er liest Container-Pakete aus dem Store, generiert Podman-Quadlet-Service-Dateien
    aus Templates, verwaltet Konfigurationsvariablen und steuert laufende Dienste
    über systemctl — ohne Docker-Socket oder -Daemon.

    Der 6-Schritte-Installationsprozess: Template parsen, validieren, Variablen auflösen
    (mit typbewussten Eingabeaufforderungen), Quadlet-Dateien generieren, Store-Registry
    integrieren und ins Dateisystem schreiben.

container-app-features =
    - Container-Pakete aus dem Store mit Variablen-Eingabeaufforderungen installieren
    - Podman-Quadlet-Service-Generierung (kein Docker-Daemon erforderlich)
    - Service-Steuerung: starten, stoppen, neustarten, aktivieren, deaktivieren
    - Live-Protokoll-Viewer pro Dienst (journalctl-Integration)
    - Gesundheitsstatus-Dashboard für alle laufenden Dienste
    - Multi-Instanz-Unterstützung: denselben Dienst mehrfach mit verschiedenen Namen betreiben
    - Dienste in-place aktualisieren mit automatischer Konfigurations-Migration
