# i18n/de/overview.ftl — FreeSynergy Lenses Hilfetexte (Deutsch)

help-lenses-title = FreeSynergy Lenses

help-lenses-body =
    FreeSynergy Lenses aggregiert Daten von allen mit dem FreeSynergy-Node
    verbundenen Diensten und zeigt die Ergebnisse in einheitlichen Ansichten.

    Bei einer Suche in Lenses werden alle registrierten Dienste gleichzeitig
    über den Message Bus abgefragt und die Ergebnisse gruppiert zurückgegeben.
    Jeder Ergebnisbereich zeigt eine Zusammenfassungskarte von einem Dienst-Typ:
    Wiki-Artikel, Chat-Nachrichten, offene Aufgaben, Git-Commits, Kartenpunkte
    oder Kalender-Ereignisse.

    Ein Klick auf ein Ergebnis öffnet den ursprünglichen Eintrag im Ursprungs-Dienst —
    Lenses verändert niemals Daten. Für Automatisierung und Datenänderungen Tasks verwenden.

help-lenses-personal-title = Persönliche Lenses

help-lenses-personal-body =
    Eine "Lens" ist eine gespeicherte Ansicht: eine bestimmte Abfrage mit Filtern,
    Dienst-Auswahl und Layout-Präferenzen, zu der man jederzeit zurückkehren kann.

    Beispiele:
    - "Projekt Alpha" — Wiki + Tasks + Git für ein bestimmtes Projekt-Tag
    - "Heute" — heute fällige Tasks + Kalender-Ereignisse des aktuellen Tages
    - "Erwähnungen" — Chat-Nachrichten, in denen man erwähnt wird

    Persönliche Lenses erscheinen in der Sidebar für schnellen Zugriff.
    Organisationsweite Lenses (für alle Nutzer geteilt) werden in Node verwaltet.

help-lenses-bus-title = Message-Bus-Integration

help-lenses-bus-body =
    Lenses kommuniziert mit Diensten ausschließlich über den Message Bus.
    Direkte Service-API-Aufrufe werden nie gemacht. Das bedeutet:
    - Lenses funktioniert mit jedem Dienst, der sich am Bus registriert
    - Ein neuer Dienst (z.B. ein zweites Wiki) wird automatisch durchsuchbar
    - Lenses respektiert die Zugriffsrechte, die jeder Dienst durchsetzt
    - Ergebnisse werden nur für Dienste angezeigt, auf die der aktuelle Nutzer Zugriff hat
