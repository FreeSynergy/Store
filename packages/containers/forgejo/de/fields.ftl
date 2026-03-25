# help/de/fields.ftl — Forgejo Feld-Hilfetexte (Deutsch)

help-forgejo-field-domain-title = Service-Domain

help-forgejo-field-domain-body =
    Die öffentliche Domain dieser Forgejo-Instanz (z. B. git.example.com).
    Wird für Clone-URLs, E-Mail-Links und die OAuth2-Redirect-URI verwendet.

    FORGEJO__server__DOMAIN ist die reine Domain (ohne Schema).
    FORGEJO__server__ROOT_URL ist die vollständige URL: https://{domain}

    Beide werden aus der im Setup-Assistenten angegebenen service_domain abgeleitet.
    Die Domain muss exakt mit der Zentinel-Proxy-Route übereinstimmen.

help-forgejo-field-secret-key-title = Secret Key

help-forgejo-field-secret-key-body =
    Der FORGEJO__security__SECRET_KEY ist ein kryptografischer Schlüssel zum
    Signieren von Cookies und internen Tokens. Wird automatisch generiert
    (64 Hex-Zeichen) und im Vault gespeichert.

    Wichtig: Das Rotieren dieses Schlüssels macht alle aktiven Benutzer-Sessions
    ungültig — alle Benutzer werden ausgeloggt. Nur rotieren, wenn der Schlüssel
    kompromittiert wurde.

    Niemals diesen Schlüssel teilen oder in die Versionskontrolle einchecken.

help-forgejo-field-registration-title = Benutzerregistrierung

help-forgejo-field-registration-body =
    FORGEJO__service__DISABLE_REGISTRATION = "true" (Standard) verhindert, dass
    neue Benutzer eigenständig Accounts anlegen können.

    In einem FreeSynergy-Deployment erfolgt die Benutzererstellung über Kanidm.
    Wenn sich ein Kanidm-Benutzer zum ersten Mal via OIDC anmeldet, legt Forgejo
    automatisch seinen Account an (FORGEJO__openid__ENABLE_OPENID_SIGNUP = "true").

    Nur auf "false" setzen, wenn explizit lokale Passwort-Registrierung zusätzlich
    zu OIDC erlaubt werden soll. Für private Instanzen nicht empfohlen.

help-forgejo-field-ssh-port-title = SSH-Port-Konfiguration

help-forgejo-field-ssh-port-body =
    Zwei SSH-Port-Variablen steuern die Git-over-SSH-Verbindung:

    SSH_PORT: Der Port in Clone-URLs — muss vom Internet erreichbar sein
    (z. B. 22 oder 2222).

    SSH_LISTEN_PORT: Der Port im Container. Standard 2222 vermeidet Konflikte
    mit dem sshd des Hosts auf Port 22.

    Beispiel: Host-Port 2222 → Container-Port 2222, SSH_PORT = 2222 setzen.
    Oder: Firewall leitet 22 → host:2222 → container:2222 weiter, SSH_PORT = 22.

help-forgejo-field-lfs-title = Git LFS

help-forgejo-field-lfs-body =
    FORGEJO__server__LFS_START_SERVER = "true" aktiviert den eingebauten Git-LFS-
    Endpunkt (Large File Storage). LFS ermöglicht das Speichern großer Binärdateien
    außerhalb der Git-History.

    LFS-Objekte werden im Daten-Volume von Forgejo gespeichert. Bei intensiver
    LFS-Nutzung ausreichend Speicherplatz einplanen.

    LFS erfordert HTTPS und einen installierten git-lfs-Client beim Benutzer.

help-forgejo-field-oidc-title = OIDC-Auto-Registrierung

help-forgejo-field-oidc-body =
    FORGEJO__openid__ENABLE_OPENID_SIGNUP = "true" (Standard) erstellt beim
    ersten OIDC-Login automatisch einen Forgejo-Account.

    Der Benutzername kommt aus dem OIDC-Claim "preferred_username" (Kanidm-Username).
    E-Mail und Anzeigename werden ebenfalls aus OIDC-Claims synchronisiert.

    Das bedeutet: Sobald Benutzer in Kanidm existieren und Zugriff auf den
    Forgejo-OAuth2-Client haben, können sie sich sofort anmelden — ohne manuelle
    Account-Erstellung.

    Auf "false" setzen, wenn ein Admin Accounts manuell anlegen soll, bevor sich
    Benutzer erstmals anmelden können.
