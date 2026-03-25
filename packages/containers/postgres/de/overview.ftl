# help/de/overview.ftl — PostgreSQL-Hilfetexte (Deutsch)

help-postgres-title = PostgreSQL — Relationale Datenbank

help-postgres-body =
    PostgreSQL ist die primäre relationale Datenbank der FreeSynergy-Plattform.
    Es wird als Sub-Service eingesetzt — normalerweise nicht eigenständig installiert,
    sondern als Abhängigkeit eines anderen Dienstes (Forgejo, Outline, Vikunja, uMap, pretix).

    PostgreSQL speichert strukturierte Anwendungsdaten: Repositories, Wiki-Seiten,
    Aufgaben, Benutzerkonten, Event-Registrierungen u. v. m. Jeder Dienst erhält
    eine eigene dedizierte Datenbank innerhalb derselben PostgreSQL-Instanz.

    Eigenschaften:
    - Alpine-Image für minimale Container-Größe
    - Constraint same_host — Postgres muss auf derselben Maschine wie der Eltern-Dienst laufen
    - Authentifizierung via scram-sha-256 (modern, sicher)
    - Passwort wird automatisch generiert und im Vault gespeichert

    Hinweis: Für uMap muss PostgreSQL das PostGIS-Image (postgis/postgis) verwenden,
    um geografische Daten zu unterstützen. Das uMap-Modul dokumentiert diese Anforderung.

help-postgres-install-title = PostgreSQL-Initialisierung

help-postgres-install-body =
    PostgreSQL initialisiert sein Datenverzeichnis beim ersten Start via initdb.
    Folgendes passiert automatisch:
    1. initdb erstellt den Cluster mit POSTGRES_DB, POSTGRES_USER und POSTGRES_PASSWORD.
    2. Die Auth-Methode wird für alle Host-Verbindungen auf scram-sha-256 gesetzt.
    3. Der Health-Check (pg_isready) meldet "healthy", sobald der Cluster bereit ist.

    Neuinitialisierung (z. B. nach fehlgeschlagenem ersten Start): Datenverzeichnis
    unter {config_dir}/data/ löschen und Container neu starten.

    Warnung: Das Löschen des Datenverzeichnisses ist unwiderruflich. Zuerst immer
    ein Backup erstellen, wenn die Datenbank Daten enthält.

help-postgres-sub-service-title = PostgreSQL als Sub-Service

help-postgres-sub-service-body =
    Wenn ein Dienst (z. B. Forgejo) Postgres via [load.modules.postgres] als
    Abhängigkeit deklariert, erledigt FreeSynergy automatisch:
    1. Einen Postgres-Container neben dem Eltern-Dienst deployen.
    2. Den Container "{parent_instance_name}-postgres" nennen.
    3. Eine Datenbank mit dem Namen des Eltern-Dienstes anlegen (z. B. "forgejo").
    4. Verbindungsdetails in die Umgebungsvariablen des Eltern-Dienstes injizieren.

    Postgres wird nicht direkt konfiguriert — der Setup-Assistent des Eltern-Dienstes
    fragt nach etwaigen Anpassungen (z. B. einem abweichenden Datenbanknamen).

help-postgres-backup-title = PostgreSQL sichern

help-postgres-backup-body =
    Logisches Backup mit pg_dump im Container:

        podman exec {instance_name} pg_dump -U {db_user} {db_name} > backup.sql

    Vollständiges Cluster-Dump (alle Datenbanken):

        podman exec {instance_name} pg_dumpall -U {db_user} > cluster.sql

    Wiederherstellen:

        podman exec -i {instance_name} psql -U {db_user} {db_name} < backup.sql

    Das Datenvolume unter {config_dir}/data/ enthält den vollständigen Cluster
    und kann auf Dateisystemebene gesichert werden, wenn der Container gestoppt ist.
