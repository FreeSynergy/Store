# i18n/de/overview.ftl — FreeSynergy Einstellungen Hilfetexte (Deutsch)

help-settings-title = FreeSynergy Einstellungen

help-settings-body =
    FreeSynergy Einstellungen ist die zentrale Konfigurations-App für die Plattform.
    Alle Konfigurationen sind in Abschnitte gegliedert, die über die Sidebar zugänglich sind.

    Einstellungen sind unterteilt in Node-weite Einstellungen (erfordern Administrator-Rolle)
    und benutzerspezifische Einstellungen (von jedem Nutzer für sein eigenes Konto bearbeitbar).
    Die Einstellungs-App zeigt nur die Abschnitte, die für die Berechtigungen des aktuellen
    Nutzers relevant sind.

help-settings-roles-title = Service-Rollen

help-settings-roles-body =
    Service-Rollen sind ein erweitertes MIME-Typ-System für Funktionen, nicht Dateien.
    Jede Rolle definiert, welche Fähigkeit ein Dienst der Plattform bereitstellt.

    Beispiele:
    - auth → der Identitätsanbieter (Standard: Kanidm)
    - mail → der Mail-Server (Standard: Stalwart)
    - git → der Git-Hosting-Dienst (Standard: Forgejo)
    - wiki → der Wiki-Dienst (z.B. Outline)
    - chat → der Chat-Dienst (z.B. Tuwunel)
    - map → der Karten-Dienst
    - tasks → der Aufgaben-Tracker-Dienst (z.B. Vikunja)

    Die Zuweisung eines Dienstes zu einer Rolle teilt allen anderen Programmen mit,
    wie sie diese Fähigkeit erreichen. Programme kodieren niemals Dienstnamen fest —
    sie schlagen die Rolle nach.

help-settings-network-title = Netzwerk-Einstellungen

help-settings-network-body =
    Netzwerk-Einstellungen konfigurieren, wie dieser Node sich identifiziert und
    mit anderen Nodes und Diensten kommuniziert.

    Node-URL: die öffentlich erreichbare URL dieses FreeSynergy-Nodes.
    Wird von föderieerten Nodes und Diensten genutzt, um diesen Node zu erreichen.

    Föderation: Aktivieren oder Deaktivieren der Föderation mit anderen FreeSynergy-Nodes.
    Wenn aktiviert, kann dieser Node Einladungen von anderen Nodes empfangen und senden,
    um einem gemeinsamen Projekt beizutreten.

    Proxy: einen ausgehenden HTTP/HTTPS-Proxy für den gesamten Plattform-Traffic konfigurieren.
    Nützlich in Unternehmensumgebungen mit obligatorischer Proxy-Infrastruktur.
