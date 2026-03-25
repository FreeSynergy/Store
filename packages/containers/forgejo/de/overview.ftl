# help/de/overview.ftl — Forgejo-Hilfetexte (Deutsch)

help-forgejo-title = Forgejo — Selbst gehostete Git-Forge

help-forgejo-body =
    Forgejo ist ein community-getriebener Fork von Gitea — eine schlanke,
    vollwertige Git-Hosting-Plattform. Es stellt die Code-Kollaborationsschicht
    der FreeSynergy-Plattform bereit.

    Funktionen:
    - Git-Repository-Hosting mit Web-UI
    - Issues, Pull Requests, Meilensteine und Projektboards
    - Forgejo Actions (CI/CD, kompatibel mit GitHub-Actions-Syntax)
    - Git LFS für große Dateien
    - OAuth2-Provider + OIDC-Consumer (SSO via Kanidm)
    - Webhook-Unterstützung für Integrationen
    - Paketregistry (npm, PyPI, Container-Images u. a.)
    - Föderationsunterstützung (ForgeFed-Protokoll)

    Abhängigkeiten: PostgreSQL (Datenbank), Dragonfly (Cache/Sessions/Queues),
    Kanidm (SSO), optional Stalwart (E-Mail-Benachrichtigungen).

help-forgejo-install-title = Forgejo installieren

help-forgejo-install-body =
    1. Vor der Installation einen OAuth2-Client in Kanidm anlegen:
       - Client-Name: "forgejo"
       - Redirect-URI: https://<forgejo-domain>/user/oauth2/kanidm/callback
       - Client-Secret notieren.

    2. Setup-Assistenten ausführen. Pflichtfelder:
       - Service-Domain (z. B. git.example.com)
       - OIDC-Client-Secret aus Kanidm
       - Secret Key (wird automatisch generiert)

    3. Nach dem ersten Start ist Forgejo sofort via OIDC verfügbar.
       Registrierung ist standardmäßig deaktiviert — Benutzer melden sich
       über Kanidm an. Admin-Accounts müssen über das Forgejo-Admin-Panel
       oder die CLI angelegt werden.

    4. Admin-Rechte vergeben: Als erster OIDC-Benutzer einloggen, dann
       im Admin-Panel unter /admin/users die Rolle setzen.

help-forgejo-ssh-title = SSH-Zugriff für Git

help-forgejo-ssh-body =
    Forgejo betreibt einen Git-over-SSH-Server im Container auf Port 2222
    (SSH_LISTEN_PORT). Dieser Port muss am Host erreichbar sein. Die Variable
    SSH_PORT gibt den Port an, den Benutzer in Clone-URLs verwenden.

    Beispiel-Clone-URL: git@git.example.com:22/user/repo.git
    (wenn SSH_PORT = 22 und der Host host:22 → container:2222 weiterleitet)

    Wenn der Host Port 22 bereits für seinen eigenen SSH-Daemon verwendet,
    einen anderen externen Port nutzen (z. B. 2222) und SSH_PORT = 2222 setzen.

    Benutzer müssen ihre SSH-Public-Keys in den Forgejo-Benutzereinstellungen
    hochladen, bevor Git-over-SSH genutzt werden kann.

    Hinweis: Zentinel behandelt kein SSH-Traffic (es ist ein Reverse Proxy für HTTP/S).
    SSH muss auf Firewall-Ebene des Hosts weitergeleitet werden.

help-forgejo-mail-title = E-Mail-Benachrichtigungen

help-forgejo-mail-body =
    Forgejo kann E-Mails für Issue-Zuteilungen, Pull-Request-Reviews und
    Erwähnungen versenden. Mailer-Einstellungen konfigurieren:

    - FORGEJO__mailer__ENABLED = "true"
    - FORGEJO__mailer__SMTP_ADDR: Hostname des Mailservers
      (z. B. Stalwart-Container-Name wenn Stalwart als Sub-Service)
    - FORGEJO__mailer__SMTP_PORT: 465 für smtps, 587 für STARTTLS
    - FORGEJO__mailer__FROM: Absenderadresse (z. B. git@example.com)
    - FORGEJO__mailer__PASSWD: SMTP-Passwort (im Vault gespeichert)

    Mit Stalwart: SMTP_ADDR auf den Stalwart-Container-Namen setzen, PORT auf 587,
    PROTOCOL auf "smtp+starttls". Postfach in Stalwart für die Absenderadresse anlegen.

    Ohne Mailserver: FORGEJO__mailer__ENABLED = "false" lassen. Benutzer erhalten
    weiterhin In-App-Benachrichtigungen, aber keine E-Mails.
