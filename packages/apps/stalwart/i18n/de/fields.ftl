# help/de/fields.ftl — Stalwart Feld-Hilfetexte (Deutsch)

help-stalwart-field-hostname-title = Server-Hostname (STALWART_HOSTNAME)

help-stalwart-field-hostname-body =
    Der vollqualifizierte Domainname (FQDN) dieses Mailservers.
    Wird nur beim ersten Start für folgendes verwendet:
    - EHLO/HELO-Greeting an andere Mailserver
    - TLS-Zertifikats-Domain (Stalwart bezieht es automatisch via ACME)
    - Standard-Absenderdomain für systeminterne Nachrichten

    Beispiel: mail.example.com

    Muss ein Subdomain der Hauptdomain mit gültigem A-Record auf die Server-IP sein.
    Andere Mailserver führen einen Reverse-DNS-Lookup durch — der PTR-Eintrag
    sollte diesem Hostnamen entsprechen.

    Nach dem ersten Start kann dieser Wert in der Web-Admin-UI geändert werden.

help-stalwart-field-domains-title = E-Mail-Domains (STALWART_DOMAINS)

help-stalwart-field-domains-body =
    Kommagetrennte Liste von E-Mail-Domains, für die dieser Server E-Mails annimmt.
    Wird nur beim ersten Start zur Initialisierung genutzt.

    Beispiel: example.com,example.org

    Nach der Initialisierung können weitere Domains in der Web-Admin-UI unter
    Einstellungen > Domains hinzugefügt werden. Jede Domain benötigt eigene
    MX-, SPF- und DKIM-DNS-Einträge.

    Transaktionale Dienste (Forgejo, Vikunja usw.) senden typischerweise von
    Adressen wie noreply@example.com — diese Domains müssen hier registriert sein.

help-stalwart-field-admin-password-title = Admin-Passwort

help-stalwart-field-admin-password-body =
    Passwort für den eingebauten "admin"-Account in der Stalwart-Web-Admin-UI.
    Wird automatisch generiert und im Vault gespeichert.

    Web-Admin-UI erreichbar unter: https://{service_domain}/admin

    Diesen Account verwenden für:
    - DKIM-Signierschlüssel konfigurieren
    - OIDC-Authentifizierung einrichten
    - Postfächer anlegen und verwalten
    - Mail-Queues und Spam-Scores überwachen
    - Zustellprotokolle einsehen

    Tipp: Nach OIDC-Einrichtung einen zweiten Admin-Account mit Kanidm-Identität
    anlegen. Den lokalen "admin"-Account als Recovery-Option behalten.
