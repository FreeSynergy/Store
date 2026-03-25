# help/de/overview.ftl — FreeSynergy Browser Hilfetexte (Deutsch)

help-browser-title = FreeSynergy Browser

help-browser-body =
    FreeSynergy Browser ist der integrierte Webbrowser für den FreeSynergy Desktop.
    Er ist speziell für die Plattform entwickelt — kein Allzweck-Browser — und
    zeigt Service-UIs, den Store und Admin-Panels mit nahtlosem Single Sign-On an.

    Hauptfunktionen:
    - Automatische IAM-Token-Injektion: Der Browser hält eine Kanidm-Session und
      injiziert Token in Anfragen an FreeSynergy-Dienste. Kein separater Login
      für jeden Dienst notwendig.
    - Tab-Unterstützung für mehrere Service-UIs gleichzeitig
    - S3-Download-Integration für Dateien im FreeSynergy-Speicher
    - TUI-Modus für Server- und Terminal-Umgebungen

    In grafischen Umgebungen öffnet der Browser als Desktop-Fenster.
    Auf Headless-Servern wechselt er automatisch in den TUI-Modus.

help-browser-tui-title = TUI-Modus

help-browser-tui-body =
    Der TUI-Modus rendert Service-Web-UIs im Terminal mit einem textbasierten Renderer.
    Nützlich für:
    - Verwaltung eines FreeSynergy-Nodes via SSH ohne grafische Sitzung
    - Zugriff auf Store und Service-Dashboards aus dem Terminal
    - Automatisiertes Scripting gegen Service-UIs

    TUI-Modus kann mit BROWSER_TUI_MODE = true erzwungen werden oder als Standard
    in den Paketvariablen gesetzt werden. Der Browser erkennt Headless-Umgebungen
    automatisch und aktiviert TUI-Modus ohne Konfiguration.

help-browser-sso-title = Single Sign-On (Token-Injektion)

help-browser-sso-body =
    Der Browser hält eine aktive Kanidm-Session des aktuellen Benutzers und hängt
    den OAuth2-Bearer-Token an ausgehende Anfragen für registrierte FreeSynergy-Dienste.

    Das bedeutet:
    - Forgejo, Outline, Vikunja, pretix und andere integrierte Dienste öffnen bereits
      authentifiziert — kein Login-Bildschirm.
    - Token-Refresh erfolgt automatisch und transparent.
    - Die Session ist an das FreeSynergy-Benutzerkonto gebunden, nicht an den Browser.

    Nicht in Kanidm registrierte Dienste (externe Websites) erhalten keinen Token
    und verhalten sich wie normale Browser-Anfragen.
