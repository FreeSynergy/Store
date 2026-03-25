# help/de/overview.ftl — Tuwunel-Hilfetexte (Deutsch)

help-tuwunel-title = Tuwunel — Matrix-Homeserver

help-tuwunel-body =
    Tuwunel ist ein hochperformanter Matrix-Homeserver, der spirituelle Nachfolger
    von conduwuit (selbst ein Fork von Conduit). Er stellt die Echtzeit-Messaging-
    Schicht der FreeSynergy-Plattform bereit.

    Das Matrix-Protokoll ist ein offener, föderierter Standard für Echtzeit-
    Kommunikation. Benutzer auf dem Tuwunel-Homeserver können:
    - In privaten 1:1-Räumen und Gruppen-Spaces chatten
    - Räumen auf anderen Matrix-Homeservern beitreten (Föderation)
    - Jeden Matrix-kompatiblen Client nutzen (Element, Cinny, FluffyChat usw.)
    - Via optionale Bridges zu anderen Plattformen verbinden (Signal, Telegram usw.)

    Matrix-IDs sehen so aus: @benutzername:example.com
    Der Domain-Teil (example.com) ist der server_name — einmalig gesetzt, nie änderbar.

    Tuwunel verwendet eine RocksDB-Datenbank für extremen Schreibdurchsatz und
    speichert alle Daten in einem einzelnen Volume unter /var/lib/tuwunel.

help-tuwunel-install-title = Tuwunel installieren

help-tuwunel-install-body =
    KRITISCH: Den server_name sorgfältig wählen. Er wird zum Domain-Teil jeder
    Matrix-ID (@benutzer:server_name). KANN NICHT mehr geändert werden nach dem
    ersten Start, ohne alle Daten und Benutzeridentitäten zu verlieren.

    1. TUWUNEL_SERVER_NAME auf die Haupt-Domain setzen (z. B. example.com),
       NICHT auf die Subdomain von Tuwunel (NICHT matrix.example.com).
       Benutzer erhalten IDs wie @alice:example.com.

    2. WELL_KNOWN_CLIENT und WELL_KNOWN_SERVER auf den tatsächlichen Server-Standort
       setzen (z. B. https://matrix.example.com und matrix.example.com:443).

    3. /.well-known/matrix/client und /.well-known/matrix/server JSON-Endpunkte
       auf der Haupt-Domain einrichten. Zentinel kann statische JSON-Dateien dafür
       ausliefern.

    4. Container starten. Keine Admin-Setup-UI — Matrix-Admin-API oder
       das Synapse-Admin-Tool (kompatibel mit Tuwunel) für die Verwaltung nutzen.

    5. Ersten Admin-Benutzer anlegen:
         podman exec {instance_name} tuwunel create-admin-user -u admin -p <passwort>

help-tuwunel-federation-title = Matrix-Föderation

help-tuwunel-federation-body =
    Wenn TUWUNEL_ALLOW_FEDERATION = "true", tritt der Homeserver dem globalen
    Matrix-Netzwerk bei. Benutzer können dann:
    - Öffentlichen Räumen auf matrix.org und anderen Servern beitreten
    - Mit Benutzern anderer Homeserver schreiben (z. B. @friend:matrix.org)
    - An föderierten Spaces teilnehmen

    Föderationsanforderungen:
    - Server muss auf Port 443 vom Internet erreichbar sein
    - /.well-known/matrix/server muss auf der server_name-Domain erreichbar sein
    - Zentinel-Proxy muss Matrix-Föderations-Traffic an den Container weiterleiten

    Für vollständig private Deployments ohne externe Kommunikation auf
    TUWUNEL_ALLOW_FEDERATION = "false" setzen.

    Hinweis: Föderation nach dem ersten Benutzen zu deaktivieren kann dazu führen,
    dass föderierte Räume nicht mehr zugänglich sind.

help-tuwunel-registration-title = Benutzerregistrierung

help-tuwunel-registration-body =
    Die Matrix-Registrierung ist getrennt von Kanidm-SSO. Benutzer registrieren
    sich direkt beim Matrix-Homeserver über den Matrix-Client-Registrierungs-API.

    Optionen:
    1. Offene Registrierung (ALLOW_REGISTRATION = "true", TOKEN_REQUIRED = "false"):
       Jeder kann einen Account anlegen. Nicht für private Server empfohlen.

    2. Token-basierte Registrierung (ALLOW_REGISTRATION = "true", TOKEN_REQUIRED = "true"):
       Benutzer benötigen einen Registrierungstoken. Tokens werden via Admin-API erstellt.

    3. Geschlossene Registrierung (ALLOW_REGISTRATION = "false"):
       Nur Admins können Accounts via Admin-API anlegen. Empfohlen für private Deployments.

    Benutzer per Admin-API anlegen:
        POST /_synapse/admin/v2/users/@benutzer:example.com
        (Tuwunel ist kompatibel mit der Synapse-Admin-API)
