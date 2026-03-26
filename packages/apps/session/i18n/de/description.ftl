session-description =
    FreeSynergy Session verwaltet die aktive Benutzersession auf einem FreeSynergy-Node.

    Es verfolgt, wer eingeloggt ist und welche Programme gerade geöffnet, minimiert
    oder fokussiert sind. Das löst das Minimize-Problem: Ohne Session würde das
    Minimieren eines Programms und erneutes Klicken auf das Icon eine zweite Instanz
    starten und den vorherigen Zustand verlieren. Mit Session fragt der Desktop zuerst
    Session, findet den bestehenden minimierten Eintrag und stellt das Fenster wieder
    her — keine neue Instanz, kein verlorener Zustand.

    Session ist ein Hintergrunddienst, der beim Login automatisch gestartet wird.
    Er speichert seinen Zustand in einer lokalen SQLite-Datenbank (fs-session.db),
    die auf den aktuellen Nutzer beschränkt ist.

session-features =
    - Verfolgt den aktiven Nutzer (user_id, display_name, Login-Zeit)
    - Pro-Programm-Zustand: Open | Minimized | Focused mit Zeitstempeln
    - Löst das Minimize-Problem: Wiederherstellen statt Neustart
    - Session-bezogen: jeder Nutzer-Login erstellt eine neue Session, die beim Logout geschlossen wird
    - Desktop-Integration: der Window Manager fragt Session vor dem Starten
    - Bus-API: Programme können ihren eigenen Zustand abfragen und aktualisieren
    - Lokales SQLite: kein Netzwerkzugang erforderlich, überlebt temporäre Bus-Ausfälle
