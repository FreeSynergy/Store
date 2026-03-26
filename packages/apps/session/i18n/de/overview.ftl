# i18n/de/overview.ftl — FreeSynergy Session Hilfetexte (Deutsch)

help-session-title = FreeSynergy Session

help-session-body =
    FreeSynergy Session ist der Benutzersession-Manager für die FreeSynergy-Plattform.
    Es ist ein Hintergrunddienst — direkte Interaktion ist nicht vorgesehen.
    Der Desktop-Window-Manager nutzt es automatisch.

    Bei jedem Login wird eine neue Session erstellt. Die Session speichert:
    - Die Benutzer-Identität (user_id, display_name)
    - Die Login-Zeit und -Dauer
    - Eine Liste jedes geöffneten Programms mit aktuellem Fenster-Zustand

    Beim Logout wird die Session geschlossen. Beim nächsten Login startet eine neue.

help-session-minimize-title = Das Minimize-Problem

help-session-minimize-body =
    Ohne Session-Manager steht jede Desktop-Umgebung vor demselben Problem:
    Ein Nutzer minimiert ein Programm und klickt dann auf sein Icon in der Taskbar.
    Der Desktop hat zwei Optionen: eine neue Instanz starten (falsch — zwei Fenster,
    Zustand verloren) oder irgendwie das alte Fenster erinnern (schwierig — erfordert
    einen separaten Tracking-Mechanismus).

    Session löst das sauber. Der Desktop fragt immer Session, bevor er startet:
    "Ist fs-store für diesen Nutzer bereits offen?"

    Wenn Session "ja, Zustand = Minimized" sagt:
    → Desktop ruft session.restore("fs-store") → Fenster kommt nach vorne
    → Keine neue Instanz wird gestartet

    Wenn Session "kein Eintrag gefunden" sagt:
    → Desktop startet fs-store → ruft session.open("fs-store") auf
    → Session erfasst den neuen Eintrag

    Derselbe Mechanismus funktioniert für den "Focused"-Zustand (nach vorne bringen,
    wenn bereits sichtbar) und für Crash-Recovery (Session weiß, dass das Programm
    Open war, und kann es neu starten).

help-session-bus-title = Bus-API

help-session-bus-body =
    Programme interagieren mit Session über den Bus:

    session::user::current — aktive Benutzer-Identität und Login-Zeit abrufen
    session::programs::list — alle geöffneten Programme und ihre Zustände auflisten
    session::programs::open — erfassen, dass ein Programm geöffnet wurde
    session::programs::minimize — ein Programm als minimiert markieren
    session::programs::restore — ein Programm als offen/fokussiert markieren
    session::programs::close — ein Programm aus der Session entfernen

    Der Desktop nutzt diese automatisch. Einzelne Programme können ihren eigenen
    Zustand abfragen, um Position, Scroll-Offset oder zuletzt verwendete Ansicht
    wiederherzustellen.
