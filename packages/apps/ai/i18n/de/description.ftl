ai-description =
    FreeSynergy AI ist der integrierte KI-Assistent für die FreeSynergy-Plattform.

    Er führt ein lokales Sprachmodell über fs-mistral aus — alle Inferenz findet auf
    dem Node statt, keine Daten werden an externe Server gesendet. Der KI-Assistent
    hat über den Message Bus Zugriff auf den Plattform-Kontext: er kann im Wiki
    suchen, offene Aufgaben abfragen, Git-Historie lesen und den Dienst-Status
    prüfen, um kontextbezogene Antworten zu geben.

    Die KI unterstützt auch andere Plattform-Werkzeuge: Builder nutzt sie zur
    Generierung von Paketbeschreibungen, Tasks zur Vorschlag von Pipeline-Schritten
    und Bots können Entscheidungen an sie delegieren.

ai-features =
    - Lokale LLM-Inferenz — keine externe API, keine Daten verlassen den Node
    - Plattform-Werkzeuge über Message Bus: Wiki, Tasks, Git, Dienst-Status
    - Kontextbewusst: kennt den aktuellen Node, das Projekt und den Nutzer
    - Mehrteilige Gespräche mit Session-Gedächtnis
    - Unterstützt Builder (Paketbeschreibungen), Tasks (Pipelines), Bots (Entscheidungen)
    - Modell-Auswahl: aus verfügbaren fs-mistral-Modellen wählen
    - TUI-Modus für Terminal-Umgebungen
