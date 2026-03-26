registry-description =
    FreeSynergy Registry ist das Live-Capability-Verzeichnis für einen FreeSynergy-Node.

    Dienste registrieren sich beim Start mit den Fähigkeiten, die sie bereitstellen:
    auth (Kanidm), mail (Stalwart), git (Forgejo), chat (Tuwunel), wiki (Outline)
    usw. Der Message Bus fragt die Registry, um herauszufinden, an welchen Dienst
    ein Event geroutet werden soll. Programme kodieren niemals Service-Adressen fest
    — sie schlagen eine Rolle nach.

    Die Registry ist die Weiterentwicklung des früheren Bridge-Systems. Anstelle eines
    generischen dynamischen Executors registrieren Dienste jetzt typisierte Adapter.
    Der Compiler prüft, dass jeder Adapter den korrekten Trait implementiert —
    keine Laufzeit-Überraschungen.

registry-features =
    - Live-Service-Verzeichnis: welche Dienste registriert sind und was sie bereitstellen
    - Rollenbasiertes Routing: Bus routet Events nach Rolle, nicht nach Name
    - Typisiertes Adapter-Muster: Compile-Zeit-Vertragsverifizierung (ersetzt Bridge)
    - Node-Boot-Service: startet vor jeder Nutzersession, läuft die gesamte Node-Laufzeit
    - Health-Integration: deregistriert Dienste, die ihre Gesundheitsprüfungen nicht bestehen
    - Bus-API: alle Programme können die Registry nach verfügbaren Capabilities abfragen
    - Föderations-bewusst: weiß, welche Capabilities auf verbundenen Nodes verfügbar sind
