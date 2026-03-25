# help/de/overview.ftl — Dragonfly-Hilfetexte (Deutsch)

help-dragonfly-title = Dragonfly — Redis-kompatibler In-Memory-Cache

help-dragonfly-body =
    Dragonfly ist ein moderner, hochperformanter In-Memory-Datenspeicher mit
    vollständiger Redis-API-Kompatibilität. Er dient als gemeinsames Caching-
    und Queue-Backend für mehrere FreeSynergy-Dienste.

    Vorteile gegenüber Redis:
    - Multi-threaded-Architektur (nutzt alle CPU-Kerne effizient)
    - Deutlich geringerer Speicherbedarf für denselben Datensatz
    - Atomare Multi-Shard-Transaktionen
    - Kompatibel mit allen Redis-Clients und -Befehlen

    In FreeSynergy dient Dragonfly als Sub-Service für:
    - Forgejo — Caching, Sessions (DB 0, 1), Job-Queues (DB 2)
    - Outline — Caching und Sessions (Standard-DB)
    - Vikunja — Caching und Queues (DB 3)
    - uMap — Django-Cache und Celery-Queue (DB 0)
    - pretix — Sessions (DB 4), Celery-Broker (DB 5), Celery-Ergebnisse (DB 6)

    Dragonfly verwendet Datenbank-Indizes (0–15) für Service-Isolation —
    mehrere Dienste teilen eine Dragonfly-Instanz, jeder mit separaten DB-Nummern.

    Constraint: same_host — Dragonfly muss auf derselben Maschine wie alle
    nutzenden Dienste laufen.

help-dragonfly-sub-service-title = Dragonfly als Sub-Service

help-dragonfly-sub-service-body =
    Dragonfly wird selten eigenständig installiert. Dienste, die Caching benötigen,
    deklarieren es als Abhängigkeit: [load.modules.dragonfly].

    FreeSynergy deployt eine gemeinsame Dragonfly-Instanz pro Host. Wenn mehrere
    Dienste auf demselben Host Dragonfly verwenden, verbinden sie sich alle mit
    demselben Container, nutzen aber unterschiedliche Datenbank-Indizes.

    Standard-Datenbank-Index-Zuteilung:
    - DB 0: Forgejo-Cache, uMap/Celery
    - DB 1: Forgejo-Sessions
    - DB 2: Forgejo-Queues
    - DB 3: Vikunja
    - DB 4: pretix-Sessions
    - DB 5: pretix-Celery-Broker
    - DB 6: pretix-Celery-Ergebnisse
    - Outline: nutzt Standard (typischerweise DB 0)

help-dragonfly-databases-title = Datenbank-Index-Isolation

help-dragonfly-databases-body =
    Redis/Dragonfly unterstützt 16 logische Datenbanken (0–15). Jede Datenbank
    ist vollständig isoliert — ein FLUSHDB in DB 3 beeinflusst nicht DB 0.

    VIKUNJA_REDIS_DB ist standardmäßig 3 — bewusst gewählt, um die von Forgejo
    genutzten Indizes (0, 1, 2) zu vermeiden. Diese Konvention muss beim
    Hinzufügen neuer Dienste eingehalten werden.

    Alle Schlüssel in einer Datenbank auflisten:
        podman exec {instance_name} redis-cli -a <passwort> -n <db-index> KEYS '*'

    Cache eines einzelnen Dienstes leeren (z. B. Vikunja, DB 3):
        podman exec {instance_name} redis-cli -a <passwort> -n 3 FLUSHDB

    Niemals FLUSHALL verwenden — löscht ALLE Datenbanken und unterbricht alle
    Dienste, die die Dragonfly-Instanz teilen.

help-dragonfly-persistence-title = Persistenz und Snapshots

help-dragonfly-persistence-body =
    Standardmäßig läuft Dragonfly als reiner Cache (ohne Persistenz). Die Variablen
    DFLY_dbfilename und DFLY_dir sind leer — RDB-Snapshots deaktiviert.

    Das ist gewollt: Alle Daten in Dragonfly sind abgeleitete/gecachte Daten,
    die neu generiert werden können. Nach einem Neustart füllen Dienste den Cache
    automatisch wieder.

    Persistenz aktivieren:
    1. DFLY_dir auf einen Volume-Pfad setzen (z. B. /data)
    2. DFLY_dbfilename auf einen Dateinamen setzen (z. B. dump.rdb)
    3. Verzeichnis als Volume im Container einbinden

    Hinweis: Persistenz eliminiert kein Datenverlustrisiko — sie reduziert nur
    das Zeitfenster. Für wirklich persistente Daten PostgreSQL verwenden.
