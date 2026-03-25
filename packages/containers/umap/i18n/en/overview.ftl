# help/en/overview.ftl — uMap help texts (English)

help-umap-title = uMap — Collaborative Maps with OpenStreetMap

help-umap-body =
    uMap is a self-hosted map creation and sharing platform built on top of
    OpenStreetMap tiles. It allows users to create custom, annotated maps with
    markers, polygons, lines, and embed them in websites.

    Features:
    - Create custom maps with markers, polygons, and lines
    - Import/export GeoJSON, KML, GPX, CSV
    - Real-time collaborative editing (multiple users edit the same map live)
    - Embed maps in websites with a responsive iframe
    - Public, protected (link-only) and private maps
    - Tile layers: OpenStreetMap, satellite, topographic and custom tiles
    - OIDC / SSO authentication

    Use cases:
    - Team project maps (office locations, event venues, infrastructure)
    - Community maps (neighborhood resources, walking routes)
    - Data visualization (sales territories, coverage areas)

    IMPORTANT: uMap requires PostGIS (PostgreSQL with the geographic extension).
    The Postgres sub-service must use the postgis/postgis Docker image, NOT the
    standard postgres image.

    Dependencies: PostgreSQL+PostGIS (map data), Dragonfly (sessions/cache),
    Kanidm (SSO/OIDC).

help-umap-install-title = Installing uMap

help-umap-install-body =
    IMPORTANT: Before deploying, override the postgres sub-module to use the
    PostGIS image. In your project file:

        [services.umap-postgres]
        image = "docker.io/postgis/postgis"
        image_tag = "17-3.5-alpine"

    1. Run the setup wizard:
       - Service domain (e.g. maps.example.com)
       - Site name (e.g. "Example Maps")
       - Secret key (auto-generated)

    2. On first start, uMap runs Django migrations including the PostGIS extension.
       Check logs to confirm: "Applied all migrations: map, sites, ..."

    3. Create an admin account:
         podman exec {instance_name} python manage.py createsuperuser

    4. The admin interface is at https://maps.example.com/admin

    5. Configure OIDC for Kanidm in Django admin:
       - Social Applications > Add application
       - Provider: "OpenID Connect"
       - Client ID and secret from Kanidm

help-umap-postgis-title = PostGIS Requirement

help-umap-postgis-body =
    uMap stores all map geometries (markers, polygons, lines) in PostgreSQL using
    the PostGIS extension. PostGIS adds spatial data types (GEOMETRY, GEOGRAPHY)
    and spatial functions (ST_Distance, ST_Contains, etc.) to PostgreSQL.

    Without PostGIS, uMap's Django migrations fail with:
        django.db.utils.ProgrammingError: type "geometry" does not exist

    To use PostGIS, the postgres sub-service must use the PostGIS Docker image:
        docker.io/postgis/postgis:17-3.5-alpine

    This is a drop-in replacement for the standard postgres image — it contains
    a standard PostgreSQL server with PostGIS pre-installed and initialized.

    All other PostgreSQL configuration (password, user, health check) works
    identically to the standard postgres module.

help-umap-realtime-title = Real-Time Collaborative Editing

help-umap-realtime-body =
    When REALTIME_ENABLED = "true", multiple users can edit the same map
    simultaneously and see each other's changes in real time via WebSocket.

    WebSocket requirements:
    - The Zentinel proxy route for uMap must support WebSocket upgrades
    - The "Upgrade" and "Connection" headers must be forwarded

    The uMap real-time server runs as part of the main uMap process —
    there's no separate WebSocket server to deploy.

    Disable real-time (REALTIME_ENABLED = "false") if:
    - Your proxy does not support WebSocket
    - You experience performance issues (WebSocket connections are persistent)
    - Your use case is single-user map creation only

    Note: Disabling real-time does not affect the ability to view shared maps.
    It only affects live collaborative editing.
