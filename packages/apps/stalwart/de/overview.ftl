# help/de/overview.ftl — Stalwart-Hilfetexte (Deutsch)

help-stalwart-title = Stalwart — All-in-One-Mailserver

help-stalwart-body =
    Stalwart ist ein moderner, vollständiger Mailserver in Rust. Er stellt die
    E-Mail-Infrastruktur der FreeSynergy-Plattform bereit und wird von Diensten
    genutzt, die transaktionale E-Mails benötigen (Forgejo, Outline, Vikunja, pretix).

    Unterstützte Protokolle:
    - SMTP (Port 25/587) — Senden und Empfangen von E-Mails
    - IMAP (Port 993) — Klassischer E-Mail-Client-Zugriff
    - JMAP — Modernes JSON-basiertes E-Mail-Protokoll (empfohlen)
    - CalDAV — Kalender-Synchronisation
    - CardDAV — Kontakt-Synchronisation
    - Sieve — Serverseitige E-Mail-Filterregeln
    - Anti-Spam (eingebaut): SpamAssassin-kompatibles Scoring

    Stalwart verwaltet seine Konfiguration über eine Web-Admin-UI und speichert
    Einstellungen in einer eigenen Datenbank — nicht in Umgebungsvariablen.
    Nur STALWART_HOSTNAME und STALWART_DOMAINS werden für das initiale Bootstrapping genutzt.

    Integration: Stalwart dient als Sub-Service für Forgejo, Outline, Vikunja und
    pretix zum Versenden von Benachrichtigungen. Es integriert sich außerdem mit
    Kanidm für SSO-Zugang zu Webmail und Admin-Interface.

help-stalwart-install-title = Stalwart installieren

help-stalwart-install-body =
    1. Voraussetzungen:
       - Gültige Mail-Domain (z. B. example.com)
       - DNS-Kontrolle für MX-, SPF-, DKIM- und DMARC-Einträge
       - Hostname für den Mailserver (z. B. mail.example.com)

    2. Setup-Assistenten ausführen:
       - STALWART_HOSTNAME: mail.example.com
       - STALWART_DOMAINS: example.com (kommagetrennt für mehrere Domains)
       - Admin-Passwort: automatisch generiert, im Vault gespeichert

    3. Nach dem ersten Start Web-Admin-UI aufrufen: https://mail.example.com/admin
       Mit "admin" und dem generierten Passwort anmelden.

    4. In der Admin-UI konfigurieren:
       - DKIM-Signierschlüssel für die Domain
       - OIDC-Authentifizierung (Einstellungen > Authentifizierung > OIDC)
       - Postfächer für Dienste, die eine Send-Only-Adresse benötigen

    5. DNS-Einträge hinzufügen (siehe DNS-Thema für Details).

    Hinweis: Stalwart verwendet eigenes TLS — der Zentinel-Proxy muss
    upstream_tls = true für die Stalwart-Route setzen.

help-stalwart-dns-title = Erforderliche DNS-Einträge

help-stalwart-dns-body =
    Für korrekte E-Mail-Zustellung diese DNS-Einträge für die Domain setzen:

    MX-Eintrag:
        example.com.  MX  10  mail.example.com.

    SPF-Eintrag (TXT):
        example.com.  TXT  "v=spf1 mx -all"
        (erlaubt nur dem MX-Host das Senden für diese Domain)

    DKIM-Eintrag (TXT):
        selector._domainkey.example.com.  TXT  "v=DKIM1; k=rsa; p=<public-key>"
        (Schlüssel in Stalwart Web-Admin unter Signierschlüssel generieren)

    DMARC-Eintrag (TXT):
        _dmarc.example.com.  TXT  "v=DMARC1; p=quarantine; rua=mailto:dmarc@example.com"

    SRV-Einträge (für Auto-Discovery):
        _submission._tcp.example.com.  SRV  0 1 587 mail.example.com.
        _imaps._tcp.example.com.       SRV  0 1 993 mail.example.com.

    Tipp: mail-tester.com nutzen, um die Konfiguration nach DNS-Propagation zu
    überprüfen. Ein Score von 10/10 bedeutet korrekte Konfiguration.

help-stalwart-oidc-title = OIDC-Integration mit Kanidm

help-stalwart-oidc-body =
    Stalwart unterstützt OIDC für die Authentifizierung am Webmail und Admin-Interface.
    Wird in der Web-Admin-UI konfiguriert — nicht über Umgebungsvariablen.

    Schritte:
    1. In Kanidm OAuth2-Client "stalwart" anlegen:
       - Redirect-URI: https://mail.example.com/auth/callback
       - Scopes: openid, email, profile
    2. Client-ID und Client-Secret notieren.
    3. In Stalwart Web-Admin: Einstellungen > Authentifizierung > OpenID Connect
       - Issuer-URL: https://auth.example.com/oauth2/openid/stalwart
       - Client-ID: stalwart
       - Client-Secret: (aus Kanidm)

    Nach OIDC-Konfiguration können sich Benutzer mit Kanidm-Credentials am
    Stalwart-Webmail anmelden. Das "admin"-Account nutzt weiterhin lokale Authentifizierung.
