# help/de/overview.ftl — OTel-Collector-Hilfetexte (Deutsch)

help-otel-collector-title = OpenTelemetry Collector — Telemetrie-Pipeline

help-otel-collector-body =
    Der OpenTelemetry Collector ist die zentrale Telemetrie-Pipeline der
    FreeSynergy-Plattform. Er sammelt Logs, Metriken und Traces von allen
    laufenden Diensten und leitet sie an OpenObserve weiter.

    Was er sammelt:
    - Container-Logs aller Podman-Container (via journald-Receiver)
    - Container-Ressourcen-Metriken (CPU, Arbeitsspeicher, Netzwerk, Disk-I/O)
      über docker_stats-Receiver, mit dem Podman-Socket als Docker-kompatibler Socket
    - Host-Metriken (Disk, CPU, Arbeitsspeicher) via hostmetrics-Receiver
    - OTLP-Daten von Anwendungen mit nativer OpenTelemetry-Unterstützung

    Der Collector läuft als einzelner Container pro Host mit Lesezugriff auf:
    - /run/user/{uid}/podman/podman.sock (Podman-Socket)
    - /var/log/journal (systemd-Journal für Container-Log-Sammlung)
    - /run/log/journal (aktuelle Journal-Einträge)

    Abhängigkeiten: OpenObserve (Datenziel). Wird immer als Sub-Service
    neben OpenObserve deployted.

    Constraint: per_host = 1 — nur eine Collector-Instanz pro Host.

help-otel-collector-pipeline-title = Collector-Pipeline

help-otel-collector-body-pipeline =
    Der OTel Collector wird über otel-config.yaml konfiguriert (aus einem Template
    beim Deployment generiert). Die Pipeline besteht aus:

    Receivers (Datenquellen):
    - otlp: akzeptiert OTLP/HTTP (Port 4318) und OTLP/gRPC (Port 4317)
    - journald: liest Container-Logs aus dem systemd-Journal
    - docker_stats: liest Podman-Container-Metriken über den Docker-Socket
    - hostmetrics: sammelt Host-CPU, -Arbeitsspeicher, -Disk-Metriken

    Processors (Transformationen):
    - batch: gruppiert Daten in Batches für effizienten Export
    - resource: fügt Metadaten (Host, Service-Name) zu allen Telemetriedaten hinzu
    - memory_limiter: verhindert OOM bei Überlastung der Pipeline

    Exporters (Ziele):
    - otlphttp: sendet alles an OpenObserve via OTLP/HTTP

    Vollständige Pipeline: Receivers → Processors → Exporters
    Jeder Signaltyp (Logs, Metriken, Traces) hat eine eigene Pipeline.

help-otel-collector-podman-title = Podman-Socket-Integration

help-otel-collector-podman-body =
    Der OTel Collector mountet den Podman-Socket als /var/run/docker.sock im
    Container, damit er wie ein Docker-Socket aussieht. Der docker_stats-Receiver
    kann so Container-Metriken sammeln ohne Docker zu benötigen.

    Der Socket wird schreibgeschützt gemountet — der Collector kann nur Stats
    lesen, keine Container starten/stoppen.

    Socket-Pfad auf dem Host:
        /run/user/{user_uid}/podman/podman.sock

    Journal-Mounts:
        /var/log/journal — persistente Journal-Logs (zwischen Neustarts)
        /run/log/journal — flüchtige Journal-Logs (aktuelle Boot-Session)

    Beide werden benötigt, um alle Container-Log-Ausgaben zu erfassen.
    Journald sammelt Logs aller Quadlet-verwalteten Container automatisch.
