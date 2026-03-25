# help/de/fields.ftl — OTel-Collector Feld-Hilfetexte (Deutsch)

help-otel-collector-field-docker-host-title = Docker-Host-Socket (DOCKER_HOST)

help-otel-collector-field-docker-host-body =
    Der Pfad zum Podman-Socket im Container, konfiguriert als Docker-Socket,
    damit der docker_stats-Receiver ihn verwenden kann.

    Standard: unix:///var/run/docker.sock

    Der Socket wird schreibgeschützt vom Host gemountet:
        /run/user/{user_uid}/podman/podman.sock → /var/run/docker.sock

    Der docker_stats-Receiver nutzt ihn zum Sammeln von Container-Metriken:
    - CPU-Auslastung in Prozent
    - Arbeitsspeichernutzung und -limit
    - Netzwerk-I/O (gesendete/empfangene Bytes)
    - Block-I/O (Disk-Lesen/Schreiben)

    Wert nicht ändern, es sei denn, der Socket-Mount wurde im Container
    umkonfiguriert.

    Hinweis: "docker.sock" im Pfad ist gewollt — Podman bietet dieselbe API
    wie Docker an. Der docker_stats-Receiver erkennt den Unterschied nicht.

help-otel-collector-field-config-title = Collector-Konfigurationsdatei

help-otel-collector-field-config-body =
    Der Collector wird über /etc/otelcol-contrib/config.yaml im Container
    konfiguriert. Diese Datei wird aus einem Tera-Template beim Deployment
    generiert und schreibgeschützt gemountet.

    Die generierte Konfiguration enthält:
    - Receiver-Konfigurationen (Ports, Journal-Pfad, Socket-Pfad)
    - Processor-Einstellungen (Batch-Größe, Arbeitsspeicher-Limits)
    - Exporter-Ziel (OpenObserve-OTLP-Endpunkt mit Zugangsdaten)
    - Pipeline-Definitionen, die Receivers mit Exporters verbinden

    Aktuelle Konfiguration einsehen:
        podman exec {instance_name} cat /etc/otelcol-contrib/config.yaml

    Nach einer Konfigurationsänderung neu laden: Container neu starten.
        podman restart {instance_name}

    Erweitert: Für eigene Receivers oder Processors das Tera-Template im
    templates/-Verzeichnis des Moduls anpassen und `fsn deploy` ausführen.
