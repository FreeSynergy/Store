# i18n/de/overview.ftl — FreeSynergy Desktop Hilfetexte (Deutsch)

help-desktop-title = FreeSynergy Desktop

help-desktop-body =
    FreeSynergy Desktop ist die grafische Shell für die FreeSynergy-Plattform.
    Er ist die primäre Schnittstelle für Menschen — alle anderen FreeSynergy-Apps
    sind vom Desktop aus zugänglich.

    Der Desktop ist in vier Bereiche aufgeteilt:
    - Header (60px): FreeSynergy-Branding, Breadcrumb-Navigation, Benutzer-/Avatar-Menü
    - Sidebar (240px / 48px eingeklappt): App-Navigations-Tabs
    - Hauptbereich: die aktuell aktive App oder Widget-Ansicht
    - Taskbar (48px): App-Launcher-Schaltflächen, offene Fenster, System-Tray, Uhr

    Alle FreeSynergy-Apps (Store, Lenses, Browser, Einstellungen etc.) laufen als
    eingebettete Ansichten im Desktop. Sie können auch als eigenständige Fenster starten.

help-desktop-modes-title = Render-Modi

help-desktop-modes-body =
    Der Desktop unterstützt drei Render-Modi aus einer einzigen Codebasis:

    Desktop-Modus (Standard):
    Öffnet als natives Anwendungsfenster mit einem Webview. Dies ist der Standard-Modus
    für Workstations und Laptops mit grafischer Anzeige.

    Web-Modus (WASM):
    Läuft im Browser. Nützlich für Fernzugriff, ohne den Desktop lokal installieren
    zu müssen. Erfordert einen kompatiblen Browser mit WebAssembly-Unterstützung.

    TUI-Modus:
    Rendert im Terminal. Nützlich für die Server-Verwaltung über SSH, wenn keine
    grafische Anzeige verfügbar ist. Nicht alle Apps unterstützen den TUI-Modus.

help-desktop-taskbar-title = Taskbar

help-desktop-taskbar-body =
    Die Taskbar läuft am unteren Bildschirmrand und enthält:
    - App-Launcher-Schaltflächen für schnellen Zugriff auf installierte Apps
    - Indikatoren für offene Fenster von aktuell laufenden Apps
    - System-Tray mit Benachrichtigungen und Status-Indikatoren
    - Uhr mit Datum und Uhrzeit

    Apps können über das App-Kontextmenü an die Taskbar angeheftet werden.
