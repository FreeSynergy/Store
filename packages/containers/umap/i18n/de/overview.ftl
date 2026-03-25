# help/de/overview.ftl — uMap-Hilfetexte (Deutsch)

help-umap-title = uMap — Kollaborative Karten mit OpenStreetMap

help-umap-body =
    uMap ist eine selbst gehostete Karten-Erstellungs- und Teilungsplattform,
    aufgebaut auf OpenStreetMap-Kacheln. Benutzer können benutzerdefinierte,
    annotierte Karten mit Markern, Polygonen und Linien erstellen und einbetten.

    Funktionen:
    - Benutzerdefinierte Karten mit Markern, Polygonen und Linien
    - Import/Export: GeoJSON, KML, GPX, CSV
    - Echtzeit-kollaboratives Bearbeiten (mehrere Benutzer gleichzeitig)
    - Karten in Websites einbetten (responsive iframe)
    - Öffentliche, geschützte (nur Link) und private Karten
    - Kachel-Layer: OpenStreetMap, Satellit, topografisch und eigene Kacheln
    - OIDC/SSO-Authentifizierung

    Anwendungsfälle:
    - Team-Projektkarten (Bürostandorte, Veranstaltungsorte, Infrastruktur)
    - Community-Karten (Nachbarschaftsressourcen, Wanderwege)
    - Datenvisualisierung (Vertriebsgebiete, Abdeckungsbereiche)

    WICHTIG: uMap benötigt PostGIS (PostgreSQL mit geografischer Erweiterung).
    Der Postgres-Sub-Service muss das postgis/postgis-Docker-Image verwenden,
    NICHT das Standard-postgres-Image.

    Abhängigkeiten: PostgreSQL+PostGIS (Kartendaten), Dragonfly (Sessions/Cache),
    Kanidm (SSO/OIDC).

help-umap-install-title = uMap installieren

help-umap-install-body =
    WICHTIG: Vor dem Deployment den Postgres-Sub-Modul auf das PostGIS-Image
    überschreiben. In der Projektdatei:

        [services.umap-postgres]
        image = "docker.io/postgis/postgis"
        image_tag = "17-3.5-alpine"

    1. Setup-Assistenten ausführen:
       - Service-Domain (z. B. maps.example.com)
       - Site-Name (z. B. "Beispiel-Karten")
       - Secret Key (automatisch generiert)

    2. Beim ersten Start führt uMap Django-Migrationen inklusive der PostGIS-Erweiterung aus.
       Logs prüfen: "Applied all migrations: map, sites, ..."

    3. Admin-Account anlegen:
         podman exec {instance_name} python manage.py createsuperuser

    4. Admin-Interface unter https://maps.example.com/admin

    5. OIDC für Kanidm im Django-Admin konfigurieren:
       - Social Applications > Anwendung hinzufügen
       - Provider: "OpenID Connect"
       - Client-ID und -Secret aus Kanidm

help-umap-postgis-title = PostGIS-Anforderung

help-umap-postgis-body =
    uMap speichert alle Kartengeometrien (Marker, Polygone, Linien) in PostgreSQL
    mit der PostGIS-Erweiterung. PostGIS fügt PostgreSQL räumliche Datentypen
    (GEOMETRY, GEOGRAPHY) und räumliche Funktionen (ST_Distance, ST_Contains usw.) hinzu.

    Ohne PostGIS schlagen uMaps Django-Migrationen fehl mit:
        django.db.utils.ProgrammingError: type "geometry" does not exist

    Für PostGIS muss der Postgres-Sub-Service das PostGIS-Docker-Image verwenden:
        docker.io/postgis/postgis:17-3.5-alpine

    Dieses ist ein Drop-in-Ersatz für das Standard-postgres-Image — ein normaler
    PostgreSQL-Server mit vorinstalliertem und initialisiertem PostGIS.

help-umap-realtime-title = Echtzeit-Kollaboratives Bearbeiten

help-umap-realtime-body =
    Wenn REALTIME_ENABLED = "true", können mehrere Benutzer gleichzeitig dieselbe
    Karte bearbeiten und Änderungen der anderen in Echtzeit via WebSocket sehen.

    WebSocket-Anforderungen:
    - Die Zentinel-Proxy-Route für uMap muss WebSocket-Upgrades unterstützen
    - Die "Upgrade"- und "Connection"-Header müssen weitergeleitet werden

    Der uMap-Echtzeit-Server läuft als Teil des Haupt-uMap-Prozesses —
    kein separater WebSocket-Server nötig.

    Echtzeit deaktivieren (REALTIME_ENABLED = "false") wenn:
    - Der Proxy kein WebSocket unterstützt
    - Performance-Probleme auftreten
    - Nur Einzelnutzer-Kartenerstellung benötigt wird

    Hinweis: Deaktivierung beeinflusst nicht das Betrachten geteilter Karten.
