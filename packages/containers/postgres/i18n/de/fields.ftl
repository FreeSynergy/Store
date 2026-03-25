# help/de/fields.ftl — PostgreSQL Feld-Hilfetexte (Deutsch)

help-postgres-field-db-name-title = Datenbankname (POSTGRES_DB)

help-postgres-field-db-name-body =
    Der Name der Datenbank, die initdb beim ersten Start anlegt. Standardmäßig
    der Instanzname des Eltern-Dienstes (z. B. "forgejo").

    Die DATABASE_URL des Eltern-Dienstes wird automatisch aus diesem Wert abgeleitet.
    Nur ändern, wenn der Eltern-Dienst einen spezifischen Datenbanknamen erwartet,
    der vom Instanznamen abweicht.

    Dieser Wert kann nach der Datenbankerstellung nicht mehr geändert werden,
    ohne den Cluster neu zu erstellen.

help-postgres-field-db-user-title = Datenbankbenutzer (POSTGRES_USER)

help-postgres-field-db-user-body =
    Der Superuser-Account, der von initdb angelegt wird. Standardmäßig der
    Instanzname des Eltern-Dienstes. Der Eltern-Dienst verbindet sich mit
    PostgreSQL über diesen Benutzer.

    Dieser Benutzer hat volle Superuser-Rechte auf dem Cluster. Für
    FreeSynergy-Deployments ist die Standardkonfiguration sicher, da jeder
    Dienst seinen eigenen isolierten Container erhält.

help-postgres-field-db-password-title = Datenbankpasswort (POSTGRES_PASSWORD)

help-postgres-field-db-password-body =
    Passwort für den Datenbank-Superuser. Wird vom Setup-Assistenten automatisch
    generiert und im Vault gespeichert. Der Eltern-Dienst liest diesen Wert beim
    Deployment aus dem Vault und injiziert ihn in seine DATABASE_URL.

    Niemals ein statisches oder leeres Passwort in der Produktion verwenden.
    Das automatisch generierte Passwort ist eine 32-stellige Zufallszeichenkette.

help-postgres-field-auth-method-title = Authentifizierungsmethode (POSTGRES_HOST_AUTH_METHOD)

help-postgres-field-auth-method-body =
    Steuert die Authentifizierung für Client-Verbindungen. Der Standard
    "scram-sha-256" ist die aktuelle Best Practice — Passwörter werden über
    einen Challenge-Response-Mechanismus geprüft, ohne das Passwort im Klartext
    zu übertragen.

    Nicht auf "md5" (schwächere Hashfunktion) oder "trust" (kein Passwort)
    ändern. Beide reduzieren die Sicherheit erheblich.

help-postgres-field-locality-title = Lokalitäts-Constraint (same_host)

help-postgres-field-locality-body =
    PostgreSQL hat den Constraint "same_host" — FreeSynergy platziert es immer
    auf derselben physischen Maschine wie den abhängigen Dienst.

    Erforderlich für Performance und Einfachheit — die Datenbank verbindet sich
    über das interne Podman-Netzwerk (nicht über das Internet), Latenz muss minimal sein.

    Für einen Betrieb von PostgreSQL auf einem separaten Host muss in der
    Projektdatei eine externe DATABASE_URL konfiguriert und die Postgres-Sub-Modul-
    Abhängigkeit entfernt werden.
