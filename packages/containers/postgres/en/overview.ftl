# help/en/overview.ftl — PostgreSQL help texts (English)

help-postgres-title = PostgreSQL — Relational Database

help-postgres-body =
    PostgreSQL is the primary relational database for the FreeSynergy platform.
    It is deployed as a sub-service — you typically don't install it on its own,
    but as a dependency of another service (Forgejo, Outline, Vikunja, uMap, pretix).

    PostgreSQL stores structured application data: repositories, wiki pages, tasks,
    user records, event registrations and more. Each service gets its own dedicated
    database within the same PostgreSQL instance.

    Key properties:
    - Deployed with the Alpine image for minimal container size
    - Constrained to same_host — Postgres must run on the same machine as its parent
    - Authentication uses scram-sha-256 (modern, secure)
    - Password auto-generated and stored in the vault

    Note: For uMap, PostgreSQL must use the PostGIS image (postgis/postgis) to
    support geographic data. The uMap module documents this requirement.

help-postgres-install-title = PostgreSQL Initialization

help-postgres-install-body =
    PostgreSQL initializes its data directory on first start via initdb.
    The following happens automatically:
    1. initdb creates the cluster with the specified POSTGRES_DB, POSTGRES_USER
       and POSTGRES_PASSWORD values.
    2. The auth method is set to scram-sha-256 for all host connections.
    3. The health check (pg_isready) reports healthy once the cluster is ready.

    If you need to reinitialize (e.g. after a failed first start), delete the
    data directory at {config_dir}/data/ and restart the container.

    Warning: Deleting the data directory is irreversible. Always create a backup
    first if the database contains any data.

help-postgres-sub-service-title = PostgreSQL as a Sub-Service

help-postgres-sub-service-body =
    When a service (e.g. Forgejo) declares Postgres as a dependency via
    [load.modules.postgres], FreeSynergy automatically:
    1. Deploys a Postgres container alongside the parent service.
    2. Names the container "{parent_instance_name}-postgres".
    3. Creates a database named after the parent service (e.g. "forgejo").
    4. Injects the connection details into the parent service's environment.

    You do not configure Postgres directly — the parent service's setup wizard
    asks for any needed overrides (e.g. a custom database name).

    Multiple services can share one Postgres instance by pointing to the same
    container name, but the default setup creates a separate instance per service
    for isolation.

help-postgres-backup-title = Backing Up PostgreSQL

help-postgres-backup-body =
    Use pg_dump inside the container for logical backups:

        podman exec {instance_name} pg_dump -U {db_user} {db_name} > backup.sql

    For a full cluster dump (all databases):

        podman exec {instance_name} pg_dumpall -U {db_user} > cluster.sql

    Restore with:

        podman exec -i {instance_name} psql -U {db_user} {db_name} < backup.sql

    For point-in-time recovery, enable WAL archiving in a custom postgresql.conf.
    The data volume at {config_dir}/data/ contains the full cluster and can also
    be snapshotted at the filesystem level when the container is stopped.
