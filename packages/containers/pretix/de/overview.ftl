# help/de/overview.ftl — pretix Hilfetexte (Deutsch)

help-pretix-title = pretix — Ticketverkauf und Veranstaltungsanmeldung

help-pretix-body =
    pretix ist eine leistungsstarke, quelloffene Plattform für Ticketverkauf und
    Veranstaltungsanmeldungen. Sie eignet sich für kleine Community-Meetups ebenso
    wie für große Konferenzen mit Tausenden von Teilnehmenden.

    Funktionen:
    - Veranstaltungserstellung mit mehreren Ticketarten, Kontingenten und Preisstufen
    - Online-Ticketshop mit anpassbarem Checkout-Prozess
    - QR-Code-Tickets (PDF und Apple Wallet / Google Pay via Passbook-Plugin)
    - Mehrere Zahlungsmethoden (Überweisung, PayPal, Stripe und mehr via Plugins)
    - Check-in-App zum Scannen von Tickets vor Ort
    - Multi-Organizer-Unterstützung (mehrere Teams verwalten ihre eigenen Events)
    - Wartelisten und Gutscheincodes
    - Benutzerdefinierte Bestellfragen (Informationen von Teilnehmenden sammeln)
    - E-Mail-Bestätigungen mit angehängten PDF-Tickets
    - SSO via OIDC (pretix-oidc-Plugin)

    WICHTIG: pretix benötigt ein benutzerdefiniertes Docker-Image mit vorinstallierten Plugins.
    Das Standard-pretix-Image enthält nicht die OIDC-, Passbook- oder Pages-Plugins.
    Image vor der ersten Bereitstellung bauen:
        podman build -t fs-pretix node/containers/pretix/

    Abhängigkeiten: PostgreSQL (Event- und Bestelldaten), Dragonfly (Sessions DB 4,
    Celery-Broker DB 5, Ergebnisse DB 6), Kanidm (SSO via pretix-oidc), Stalwart
    (Bestellbestätigungs-E-Mails).

help-pretix-install-title = pretix installieren

help-pretix-install-body =
    1. Zuerst das benutzerdefinierte pretix-Image bauen (erforderlich):
         podman build -t fs-pretix /home/kal/Server/fs-store/node/containers/pretix/

    2. Vor der Installation einen OAuth2-Client in Kanidm erstellen:
       - Client-Name: „pretix"
       - Redirect-URI: https://tickets.example.com/oauth2/callback/kanidm
       - Scopes: openid, email, profile, groups

    3. Den Setup-Assistenten ausführen:
       - Service-Domain (z. B. tickets.example.com)
       - Währung (z. B. EUR)
       - Standard-Locale (z. B. de)
       - SMTP-Einstellungen für Bestellbestätigungen (optional)

    4. Nach dem ersten Start https://tickets.example.com/control aufrufen und als
       Admin anmelden (Zugangsdaten werden im Vault generiert).

    5. OIDC im Django-Admin konfigurieren (pretix-oidc-Plugin):
       - Systemeinstellungen > Authentifizierung > OIDC-Anbieter hinzufügen
       - Issuer: https://auth.example.com/oauth2/openid/pretix
       - Client-ID: pretix
       - Client-Secret: aus Kanidm

    6. Einen Organizer und das erste Event im pretix-Admin erstellen.

help-pretix-plugins-title = pretix-Plugins

help-pretix-plugins-body =
    Das FreeSynergy-pretix-Image enthält folgende Plugins:

    pretix-oidc: OpenID-Connect-/SSO-Authentifizierung für Organizer und Admins.
    Ermöglicht Mitarbeitenden, sich mit ihren Kanidm-Zugangsdaten im pretix-Control-Panel
    anzumelden.
    Hinweis: Teilnehmende (Ticketkäufer) nutzen kein OIDC — sie bezahlen als Gäste
    oder mit einem lokalen pretix-Konto.

    pretix-pages: Ergänzt den Eventshop um statische Seiten. Ideal für
    FAQs, Datenschutzrichtlinien und Veranstaltungsort-Informationen im Shop.

    pretix-fontpack-free: Kostenloser Schriftartensatz für Ticket-PDFs. Fügt
    Unicode-Schriftabdeckung hinzu, damit Tickets mit nicht-lateinischen Zeichen
    (Arabisch, Chinesisch usw.) korrekt dargestellt werden.

    pretix-passbook: Generiert Apple-Wallet-(.pkpass-) und Google-Wallet-Tickets.
    Teilnehmende können Tickets zur Wallet-App ihres Smartphones hinzufügen.

    Weitere Plugins hinzufügen: Dockerfile in node/containers/pretix/ anpassen und
    Image neu bauen. Viele pretix-Plugins sind auf PyPI verfügbar (pip install pretix-xxx).

help-pretix-events-title = Events erstellen

help-pretix-events-body =
    In pretix gilt folgende Hierarchie:
    Organizer → Event → Ticketarten (Items) → Kontingente → Bestellung

    1. Organizer: repräsentiert Ihre Organisation oder Ihr Team.
       Erstellen über: Control-Panel > Ihre Organizer > Organizer hinzufügen.

    2. Event: eine konkrete Veranstaltung (Konferenz, Konzert, Workshop).
       Jedes Event hat Datum, Ort und eine eigene Ticketshop-URL:
           https://tickets.example.com/{organizer-slug}/{event-slug}/

    3. Items: Ticketarten (z. B. „Standard", „Student", „VIP").
       Jede Ticketart hat Preis, Kontingent und Gültigkeitszeitraum.

    4. Kontingente: steuern die Anzahl verfügbarer Tickets. Ein Kontingent kann
       mehrere Items abdecken (z. B. „100 Tickets gesamt" aufgeteilt auf Standard und VIP).

    5. Zahlungsmethoden: konfigurieren unter Event > Einstellungen > Zahlung.
       Kostenlose Events: „Manuelle Zahlung" oder „Auf Anfrage als bezahlt markieren".
       Kostenpflichtige Events: Zahlungsanbieter verbinden (Stripe, PayPal, Überweisung).

    6. Check-in: pretix-Android-/iOS-App oder pretixSCAN zum Scannen von
       Tickets am Veranstaltungseingang verwenden.
