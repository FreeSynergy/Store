# help/en/overview.ftl — Dragonfly help texts (English)

help-dragonfly-title = Dragonfly — Redis-Compatible In-Memory Cache

help-dragonfly-body =
    Dragonfly is a modern, high-performance in-memory data store fully compatible
    with the Redis API. It is used as a shared caching and queue backend for
    multiple FreeSynergy services.

    Dragonfly advantages over Redis:
    - Multi-threaded architecture (uses all CPU cores efficiently)
    - Significantly lower memory usage for the same dataset
    - Atomic multi-shard transactions
    - Compatible with all Redis clients and commands

    In FreeSynergy, Dragonfly serves as a sub-service for:
    - Forgejo — caching, sessions (db 0, 1), job queues (db 2)
    - Outline — caching and sessions (default db)
    - Vikunja — caching and queues (db 3)
    - uMap — Django cache and Celery queue (db 0)
    - pretix — sessions (db 4), Celery broker (db 5), Celery results (db 6)

    Dragonfly uses database indices (0–15) for service isolation — multiple
    services share one Dragonfly instance, each using separate database numbers.

    Constraints: same_host — Dragonfly must run on the same machine as all
    services using it.

help-dragonfly-sub-service-title = Dragonfly as a Sub-Service

help-dragonfly-sub-service-body =
    Dragonfly is rarely installed standalone. Services that need caching declare
    it as a dependency: [load.modules.dragonfly].

    FreeSynergy deploys one shared Dragonfly instance per host. When multiple
    services on the same host use Dragonfly, they all connect to the same container
    but use different database indices to avoid collisions.

    Database index allocation (default):
    - db 0: Forgejo cache, uMap/Celery
    - db 1: Forgejo sessions
    - db 2: Forgejo queues
    - db 3: Vikunja
    - db 4: pretix sessions
    - db 5: pretix Celery broker
    - db 6: pretix Celery results
    - Outline: uses default (typically db 0)

    Tip: Keep a record of which service uses which database index to avoid
    accidental overlaps when adding new services.

help-dragonfly-databases-title = Database Index Isolation

help-dragonfly-databases-body =
    Redis/Dragonfly supports 16 logical databases (numbered 0–15). Each database
    is completely isolated — a FLUSHDB in db 3 does not affect db 0.

    The VIKUNJA_REDIS_DB variable defaults to 3 — specifically chosen to avoid
    the indices used by Forgejo (0, 1, 2). This convention must be respected when
    configuring new services.

    To list all keys in a specific database:
        podman exec {instance_name} redis-cli -a <password> -n <db-index> KEYS '*'

    To flush a single service's cache (e.g. Vikunja, db 3):
        podman exec {instance_name} redis-cli -a <password> -n 3 FLUSHDB

    Never use FLUSHALL — it clears ALL databases and will disrupt all services
    sharing the Dragonfly instance.

help-dragonfly-persistence-title = Persistence and Snapshots

help-dragonfly-persistence-body =
    By default, Dragonfly runs as a pure cache (no persistence). The DFLY_dbfilename
    and DFLY_dir variables are empty, which disables RDB snapshots.

    This is intentional: all data in Dragonfly is derived/cached data that can be
    regenerated. If Dragonfly restarts, services re-populate the cache automatically.

    If you want persistence (e.g. to preserve session data across restarts):
    1. Set DFLY_dir to a volume path (e.g. /data)
    2. Set DFLY_dbfilename to a filename (e.g. dump.rdb)
    3. Mount the directory as a volume in the container

    Warning: With persistence enabled, make sure the volume has sufficient space.
    Dragonfly creates periodic RDB snapshots based on the save configuration.
