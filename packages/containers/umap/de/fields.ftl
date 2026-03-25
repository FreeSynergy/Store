# help/de/fields.ftl — uMap Feld-Hilfetexte (Deutsch)

help-umap-field-secret-key-title = Django Secret Key (SECRET_KEY)

help-umap-field-secret-key-body =
    Der kryptografische Schlüssel, den Django für folgendes verwendet:
    - Signieren von Cookies (CSRF-Tokens, Session-Cookies)
    - Hashing von Passwörtern in Passwort-Reset-Links
    - Interne Token-Generierung

    Automatisch generiert (50+ Zeichen) und im Vault gespeichert. Geheim halten.

    Key rotieren bewirkt:
    - Alle aktiven Benutzer-Sessions werden ungültig (Benutzer werden ausgeloggt)
    - Alle laufenden Passwort-Reset-Links werden ungültig
    - CSRF-Tokens offener Browser-Tabs werden ungültig

help-umap-field-site-title = Site-URL und -Name

help-umap-field-site-body =
    SITE_URL: Die vollständige HTTPS-URL dieser uMap-Instanz (z. B. https://maps.example.com).
    Verwendet in:
    - Einbettungs-Code für das Teilen von Karten auf externen Websites
    - OAuth2-Redirect-URIs für OIDC-Authentifizierung
    - E-Mail-Links (wenn E-Mail konfiguriert)

    SITE_NAME: Anzeigename im uMap-Header, Seitentiteln und Einbettungen.
    Standard: "{project_domain} Maps" (z. B. "example.com Maps")
    Auf den Organisationsnamen oder einen beschreibenden Namen ändern.

    Beide Werte können im Django-Admin unter
    https://maps.example.com/admin/sites/site/ aktualisiert werden.

help-umap-field-realtime-title = Echtzeit-Bearbeitung (REALTIME_ENABLED)

help-umap-field-realtime-body =
    "true" (Standard): WebSocket-basiertes Live-kollaboratives Bearbeiten.
    Mehrere Benutzer sehen sich gegenseitig Cursor und Änderungen in Echtzeit.

    "false": Echtzeit-Funktionen deaktiviert. Karten können nur von einer Person
    gleichzeitig bearbeitet werden. Andere Benutzer sehen Änderungen erst nach
    Seiten-Neuladen.

    Voraussetzungen wenn aktiviert:
    - Zentinel-Proxy muss WebSocket-Verbindungen weiterleiten (Upgrade-Header)
    - Stabile Netzwerkverbindung für Benutzer

    Performance-Hinweis: Jede aktive WebSocket-Verbindung ist eine dauerhafte
    Verbindung zum Server. Für die meisten Deployments kein Problem.

help-umap-field-anonymous-title = Anonyme Kartenerstellung (UMAP_ALLOW_ANONYMOUS)

help-umap-field-anonymous-body =
    "true" (Standard): Jeder Besucher, auch nicht authentifizierte, kann Karten
    erstellen und bearbeiten. Anonym erstellte Karten sind an ein lokales Cookie gebunden.

    "false": Nur authentifizierte Benutzer (via OIDC/Kanidm eingeloggt) können
    Karten erstellen. Besucher können öffentliche Karten weiterhin ansehen.

    Für eine öffentliche Community-Karten-Plattform: "true" für maximale Beteiligung.
    Für ein privates Team-Tool: "false", um Login für alle Kartenerstellung zu erfordern.

help-umap-field-database-title = PostGIS-Datenbank-URL (DATABASE_URL)

help-umap-field-database-body =
    Die Datenbankverbindungs-URL für den PostgreSQL+PostGIS-Sub-Service.
    Automatisch aus dem postgres-Sub-Modul abgeleitet.

    Format: postgis://benutzer:passwort@host:port/datenbank

    WICHTIG: Das Schema muss "postgis://" sein (NICHT "postgres://").
    uMap verwendet das Django-GIS-Framework, das dieses Schema benötigt, um
    das PostGIS-Backend zu aktivieren. Eine plain postgres://-URL schlägt fehl.

    Dieser Wert wird automatisch aus den Zugangsdaten des Postgres-Sub-Service
    konstruiert. Nicht manuell bearbeiten, außer bei Verbindung zu einer
    externen Datenbank.
