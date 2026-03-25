# help/de/overview.ftl — FreeSynergy Node Hilfetexte (Deutsch)

help-node-title = FreeSynergy Node — Deployment-Engine

help-node-body =
    FreeSynergy Node ist der serverseitige Kern der FreeSynergy-Plattform.
    Er läuft als systemd-Dienst und stellt sowohl eine CLI als auch eine REST-API
    bereit. Alle anderen FreeSynergy-Programme — Desktop, Container Manager, Store,
    Browser — kommunizieren mit Node über die API.

    Hauptaufgaben:
    - Projektverwaltung: FreeSynergy-Projekte erstellen, auflisten und verwalten
    - Host-Verwaltung: Deployment-Ziele registrieren und konfigurieren
    - Paket-Lifecycle: Pakete auf Hosts installieren, aktualisieren und entfernen
    - S3-kompatibler Speicherserver: Profile, Backups, Medien und Secrets
    - Föderation: Mehrere FreeSynergy-Nodes zu einem Netzwerk verbinden
    - Message Bus: Ereignisse zwischen Diensten auf demselben Host weiterleiten

    Node ist im Store als protected = true markiert — er kann nicht entfernt werden,
    solange er der aktive Node eines Projekts ist.

help-node-cli-title = CLI und API

help-node-cli-body =
    Jeder CLI-Befehl entspricht direkt einem REST-API-Endpunkt. Die CLI ist
    eine dünne Wrapper-Schicht — alles, was per CLI möglich ist, funktioniert
    auch per HTTP-Anfrage an die API.

    Häufige Befehle:
        fsn project list          — alle Projekte auflisten
        fsn project create <name> — neues Projekt erstellen
        fsn host list             — registrierte Hosts auflisten
        fsn package install <id>  — Paket auf dem aktiven Host installieren
        fsn package remove <id>   — Paket entfernen
        fsn deploy                — alle ausstehenden Änderungen anwenden

    Die API ist auf einer laufenden Node-Instanz unter /api/docs dokumentiert.

help-node-storage-title = S3-kompatibler Speicher

help-node-storage-body =
    Node stellt einen integrierten S3-kompatiblen Speicherserver bereit, den
    andere Dienste für Dateispeicherung, Backups und Medien verwenden.
    Innerhalb des FreeSynergy Podman-Netzwerks erreichbar unter http://fs-node:9000.

    Automatisch erstellte Standard-Buckets:
    - profiles — Benutzerprofilbilder und Assets
    - backups  — automatisierte Dienst-Backups
    - media    — hochgeladene Dateien von Diensten (Forgejo-Anhänge usw.)

    Das Speicher-Root wird beim Start konfiguriert und ist standardmäßig
    {data_root}/s3. Alle Daten werden als einfache Dateien gespeichert.

help-node-federation-title = Föderation

help-node-federation-body =
    Föderation ermöglicht mehreren FreeSynergy-Nodes, Projekte, Benutzer und
    Ressourcen zu teilen. Ein föderierter Node kann:
    - Als Paket-Mirror für andere Nodes dienen
    - Benutzeridentitäten teilen (via Kanidm-Vertrauen)
    - Dienste im Auftrag eines primären Nodes hosten

    Konfiguration in host.toml unter [federation]. Vertrauensstufen:
    0 — Keine Föderation (isolierter Node)
    1 — Basis (Paket-Mirror, schreibgeschützter Profilzugriff)
    2 — Voll (SSO, geteilte Projekte, delegierte Dienste)
