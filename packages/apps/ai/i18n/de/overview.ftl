# i18n/de/overview.ftl — FreeSynergy AI Hilfetexte (Deutsch)

help-ai-title = FreeSynergy AI

help-ai-body =
    FreeSynergy AI ist der integrierte KI-Assistent für die FreeSynergy-Plattform.
    Er verwendet ein lokales Sprachmodell (über fs-mistral), sodass alle Daten
    auf dem Node bleiben.

    Der Assistent hat über Werkzeuge Zugriff auf die Plattform: er kann im Wiki
    suchen, offene Aufgaben auflisten, aktuelle Git-Commits prüfen oder den
    Dienst-Status abfragen — und nutzt diesen Kontext für genaue, relevante Antworten.

    Um die KI zu verwenden, muss fs-mistral installiert sein und mindestens ein
    Modell heruntergeladen werden. Die AI-App verwaltet die Modell-Auswahl;
    das Herunterladen der Modelle erfolgt in der Mistral-App.

help-ai-tools-title = Plattform-Werkzeuge

help-ai-tools-body =
    Wenn AI_TOOLS_ENABLED aktiviert ist, kann die KI folgende Werkzeuge über den Bus nutzen:

    wiki.search — Volltextsuche über alle Wiki-Seiten
    tasks.list — offene Aufgaben auflisten, optional nach Projekt oder Nutzer gefiltert
    git.log — aktuelle Commits über registrierte Forgejo-Repositories
    services.status — aktueller Gesundheitsstatus aller registrierten Dienste
    store.search — den Store-Katalog nach Paketen durchsuchen

    Die KI ruft nur Werkzeuge für Dienste auf, auf die der aktuelle Nutzer Zugriff hat.
    Werkzeug-Aufrufe werden im Chat als einklappbare "Gedanken"-Blöcke angezeigt.

help-ai-models-title = Modell-Auswahl

help-ai-models-body =
    Das KI-Modell wird mit der AI_MODEL-Variable gesetzt. Verfügbare Modelle sind die
    in der fs-mistral-App heruntergeladenen. Standard ist mistral-7b-instruct,
    ein leistungsfähiges Anweisungs-Modell, das auf den meisten Hardware läuft.

    Größere Modelle (13B, 70B) geben bessere Antworten, benötigen aber mehr RAM und
    sind langsamer. Kleinere Modelle (3B) sind schneller, aber weniger leistungsfähig.

    Modell-Empfehlungen:
    - 8 GB RAM: mistral-7b-instruct (quantisiert)
    - 16 GB RAM: mistral-7b-instruct (vollständig) oder mixtral-8x7b (quantisiert)
    - 32 GB RAM: mixtral-8x7b (vollständig)
