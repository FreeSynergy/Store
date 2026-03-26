# i18n/de/overview.ftl — FreeSynergy Bots Hilfetexte (Deutsch)

help-bots-title = FreeSynergy Bots

help-bots-body =
    FreeSynergy Bots verwaltet alle auf diesem FreeSynergy-Node installierten Bots.
    Bots sind ereignisgesteuerte Programme, die ausschließlich über den Message Bus
    kommunizieren — sie abonnieren Themen, empfangen Ereignisse und senden Antwort-Nachrichten.

    Bots können wiederkehrende Aufgaben automatisieren, Benachrichtigungen senden,
    Dienste verbinden oder konversationelle Schnittstellen in Chats bereitstellen.
    Da sie den Bus nutzen, braucht ein Bot keine Anmeldedaten für jeden Dienst,
    mit dem er interagiert.

help-bots-rules-title = Regelbasierte Bots

help-bots-rules-body =
    Der visuelle Regel-Editor ermöglicht das Erstellen einfacher Bots ohne Code.
    Eine Regel besteht aus drei Teilen:

    Trigger: welches Ereignis die Regel startet
    - Eine Nachricht kommt in einem Chat-Kanal an
    - Ein Git-Push passiert in Forgejo
    - Ein geplanter Zeitpunkt wird erreicht
    - Eine Dienst-Gesundheitsprüfung schlägt fehl

    Bedingung (optional): ein Filter auf die Trigger-Daten
    - Nur wenn die Nachricht ein bestimmtes Wort enthält
    - Nur für einen bestimmten Nutzer oder ein bestimmtes Projekt

    Aktion: was zu tun ist
    - Eine Chat-Nachricht an einen Kanal senden
    - Eine Aufgabe in Vikunja erstellen
    - Einen Kommentar zu einem Git-Issue posten
    - Eine Push-Benachrichtigung senden

help-bots-gatekeeper-title = Bot-Gatekeeper

help-bots-gatekeeper-body =
    Wenn der Gatekeeper für einen Bot aktiviert ist, wird jede Aktion, die der Bot
    ausführen möchte, in einer Warteschlange gehalten und einem Administrator zur
    Genehmigung angezeigt, bevor sie ausgeführt wird.

    Für Bots verwenden, die:
    - Nachrichten an externe Dienste senden (Telegram, Discord)
    - Einträge in Diensten erstellen oder ändern
    - Neu installiert sind und noch nicht vertrauenswürdig sind

    Der Gatekeeper kann nach der ersten Überprüfung auf "Alle von diesem Bot genehmigen"
    gesetzt werden.
