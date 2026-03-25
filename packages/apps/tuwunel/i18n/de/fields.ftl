# help/de/fields.ftl — Tuwunel Feld-Hilfetexte (Deutsch)

help-tuwunel-field-server-name-title = Matrix-Server-Name (TUWUNEL_SERVER_NAME)

help-tuwunel-field-server-name-body =
    Der Matrix-Server-Name — die Domain, die in allen Matrix-IDs erscheint:
        @benutzername:server_name

    Typischerweise die Haupt-Domain (z. B. example.com), NICHT die Subdomain
    von Tuwunel (z. B. NICHT matrix.example.com).

    KRITISCH: Dieser Wert wird beim ersten Start in die RocksDB-Datenbank
    geschrieben und KANN NICHT geändert werden ohne vollständige Datenmigration
    oder Neuinstallation. Ein falscher server_name bedeutet dauerhaft falsche Matrix-IDs.

    Wenn server_name = "example.com" gesetzt, aber Tuwunel unter "matrix.example.com"
    läuft, müssen /.well-known/matrix/*-Endpunkte von example.com ausgeliefert werden.

help-tuwunel-field-registration-title = Registrierungseinstellungen

help-tuwunel-field-registration-body =
    TUWUNEL_ALLOW_REGISTRATION: Ob Benutzer sich via Matrix-Clients registrieren können.
    "false" (Standard) — nur Admins können Accounts anlegen.

    TUWUNEL_REGISTRATION_TOKEN_REQUIRED: Wenn Registrierung aktiv ist, ob ein Token
    erforderlich ist. "true" (Standard) — Benutzer brauchen einen Token.

    Registrierungstoken erstellen (wenn Registrierung aktiviert):
        POST /_matrix/client/v3/admin/registration_tokens/new
        Authorization: Bearer <admin_token>
        Body: {"expiry_time": null, "uses_allowed": 1}

    Tipp: Für einladungsbasierte Registrierung pro eingeladenem Benutzer einen
    Token erstellen und uses_allowed = 1 setzen — jeder Token nur einmal nutzbar.

help-tuwunel-field-federation-title = Föderationseinstellung (TUWUNEL_ALLOW_FEDERATION)

help-tuwunel-field-federation-body =
    "true" (Standard) verbindet den Server mit dem globalen Matrix-Netzwerk.
    "false" erstellt einen isolierten privaten Server — Benutzer können nur
    mit anderen auf demselben Homeserver kommunizieren.

    Mit aktiver Föderation tauscht der Server Nachrichten mit anderen Matrix-Servern
    aus. Voraussetzungen:
    - Port 443 vom öffentlichen Internet erreichbar
    - Gültiges TLS-Zertifikat (von Zentinel übernommen)
    - /.well-known/matrix/server auf der server_name-Domain
    - Korrekte DNS-Einträge (kein SRV nötig bei .well-known-Nutzung)

help-tuwunel-field-well-known-title = Well-Known-URLs

help-tuwunel-field-well-known-body =
    Diese zwei Variablen definieren, was Matrix-Clients und -Server über den
    Homeserver erfahren:

    TUWUNEL_WELL_KNOWN_CLIENT:
    Wird in /.well-known/matrix/client zurückgegeben als:
        { "m.homeserver": { "base_url": "<wert>" } }
    Matrix-Clients (Element usw.) nutzen dies zur API-Erkennung.
    Wert: https://matrix.example.com (tatsächliche Server-URL)

    TUWUNEL_WELL_KNOWN_SERVER:
    Wird in /.well-known/matrix/server zurückgegeben als:
        { "m.server": "<wert>" }
    Andere Matrix-Homeserver nutzen dies für die Föderations-Discovery.
    Wert: matrix.example.com:443 (hostname:port, kein Schema)

    Beide /.well-known/matrix/*-Endpunkte müssen von der server_name-Domain
    (z. B. example.com) ausgeliefert werden, nicht von der Subdomain, auf der
    Tuwunel läuft. Statische JSON-Dateien oder Proxy-Regeln auf example.com konfigurieren.
