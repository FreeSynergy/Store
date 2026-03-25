# help/de/fields.ftl — FreeSynergy Browser Feld-Hilfetexte (Deutsch)

help-browser-field-default-url-title = Standard-URL

help-browser-field-default-url-body =
    Die URL, die der Browser beim Start öffnet. Wenn leer, öffnet er eine leere Seite
    oder das FreeSynergy-Dashboard (falls in den Desktop-Einstellungen konfiguriert).

    Empfehlung: Diese auf die FreeSynergy-Dashboard-URL setzen, damit die Desktop-
    Übersicht sofort beim Browser-Start sichtbar ist. Beispiel:
        https://node.example.com/dashboard

    Leer lassen, damit der Desktop kontextabhängig entscheidet, welche URL geöffnet wird.

help-browser-field-tui-mode-title = Standardmäßig TUI-Modus

help-browser-field-tui-mode-body =
    Wenn aktiviert, startet der Browser standardmäßig im TUI-Modus (textbasierte
    Benutzeroberfläche), auch wenn eine grafische Anzeige verfügbar ist.

    Auf Headless-Servern aktivieren, wo der Browser ausschließlich per SSH für die
    Verwaltung genutzt wird. Auf Desktop-Installationen deaktiviert lassen — TUI-Modus
    wird automatisch aktiviert, wenn keine grafische Anzeige erkannt wird.

    Hinweis: Der TUI-Modus unterstützt nicht alle Browser-Funktionen. Komplexe
    JavaScript-lastige UIs können im TUI-Modus mit eingeschränkter Funktionalität
    gerendert werden.
