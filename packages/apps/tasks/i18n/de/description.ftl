tasks-description =
    FreeSynergy Tasks ist die organisatorische Workflow-Engine für die FreeSynergy-Plattform.

    Einzelne Aufgaben erstellen, mehrstufige Pipelines aufbauen und Automatisierungen
    einrichten, die mehrere Dienste umfassen — ein Git-Issue erstellen, eine Chat-Nachricht
    senden, eine Aufgabe in Vikunja zuweisen und eine Wiki-Seite aktualisieren, alles aus
    einer einzigen Pipeline-Definition.

    Tasks arbeitet über den Message Bus: jeder am Bus registrierte Dienst kann ein Schritt
    in einer Pipeline sein. Keine direkten API-Aufrufe, keine Anmeldedaten pro Dienst.

    Wo Lenses Daten anzeigt, handelt Tasks.

tasks-features =
    - Aufgabenerstellung und -verfolgung mit Fälligkeitsdaten, Labels und Zuweisung
    - Mehrstufiger Pipeline-Editor mit visuellem Graphen-View
    - Trigger: manuell, zeitgesteuert (Cron), ereignisbasiert (Bus-Nachrichten)
    - Bedingungen und Verzweigungen: if/else-Schritte basierend auf vorherigen Ergebnissen
    - Dienst-übergreifende Schritte: jeder am Bus registrierte Dienst kann ein Schritt sein
    - Pipeline-Templates aus dem Store (Community-Automatisierungen)
    - Ausführungshistorie mit schrittweisen Protokollen
