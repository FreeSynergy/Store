# i18n/de/overview.ftl — FreeSynergy Registry Hilfetexte (Deutsch)

help-registry-title = FreeSynergy Registry

help-registry-body =
    FreeSynergy Registry ist das Live-Service-Verzeichnis für diesen Node.
    Es ist ein Node-Boot-Hintergrunddienst — er startet, bevor sich ein Nutzer
    einloggt, und läuft die gesamte Laufzeit des Nodes.

    Wenn ein Dienst (z.B. Kanidm) startet, registriert er sich bei der Registry:
    "Ich bin kanidm, ich stelle die auth-Capability unter http://kanidm:8443 bereit."
    Wenn ein Dienst stoppt, deregistriert er sich (oder die Registry entfernt ihn
    nach einer fehlgeschlagenen Gesundheitsprüfung). Der Bus nutzt diese Information
    zum Routing von Events: "Sende dieses Auth-Event an denjenigen, der für die
    auth-Rolle registriert ist."

    Das bedeutet, der Bus muss nie wissen, welcher spezifische Dienst Auth übernimmt
    — er sendet einfach an die Rolle. Wenn Kanidm durch ein anderes IAM-System
    ersetzt wird, ändert sich nur der Registry-Eintrag. Alle anderen Programme
    funktionieren unverändert weiter.

help-registry-roles-title = Rollen und Capabilities

help-registry-roles-body =
    Eine Rolle ist eine benannte Fähigkeit, die ein Dienst bereitstellen kann.
    Rollen sind im Plattform-Typsystem (fs-types) definiert und versioniert.

    Standard-Rollen:
    auth        — Identität und Zugangsverwaltung (Kanidm)
    mail        — E-Mail-Senden und -Empfangen (Stalwart)
    git         — Git-Hosting und CI (Forgejo)
    chat        — Echtzeit-Messaging (Tuwunel)
    wiki        — kollaborative Dokumentation (Outline)
    storage     — S3-kompatibler Objektspeicher (Node eingebaut)
    tasks       — Aufgaben- und Projektverwaltung (Vikunja)
    map         — Kartenkachel-Server und Geocoding
    calendar    — Kalender und Terminplanung
    push        — Push-Benachrichtigungs-Gateway

    Ein Dienst kann mehrere Rollen bereitstellen. Ein Node kann mehrere Dienste
    haben, die dieselbe Rolle bereitstellen (z.B. zwei Forgejo-Instanzen) — der
    Bus routet zur primären, es sei denn, eine bestimmte Instanz wird angefordert.

help-registry-adapter-title = Adapter-Muster (ersetzt Bridge)

help-registry-adapter-body =
    Die Registry verwendet das Adapter-Muster anstelle des früheren Bridge-Systems.
    Jeder Dienst wird mit einem typisierten Rust-Adapter geliefert, der die
    Plattform-Service-Traits implementiert:

        struct KanidmAdapter;
        impl AuthService for KanidmAdapter { ... }

        struct StalwartAdapter;
        impl MailService for StalwartAdapter { ... }

    Der Adapter wird gegen die Plattform-Trait-Definition kompiliert — wenn sich
    der Trait ändert, kompiliert der Adapter nicht mehr. Keine Laufzeit-Überraschungen.
    Kein generischer Dispatcher, der fehlerhaft formatierte Anfragen stillschweigend
    akzeptiert.

    Die Registry hält die aktive Adapter-Instanz für jeden registrierten Dienst.
    Der Bus ruft die Adapter-Methode direkt auf, ohne einen string-basierten
    Dispatcher zu durchlaufen.
