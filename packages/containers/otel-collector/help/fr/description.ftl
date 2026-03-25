otel-collector-description =
    L'OpenTelemetry Collector est un composant de pipeline de télémétrie agnostique
    aux fournisseurs pour recevoir, traiter et exporter des logs, métriques et traces.

    Il agit comme un hub central qui reçoit des données de télémétrie des applications (via OTLP,
    Jaeger, Zipkin, Prometheus, Fluent Bit et de nombreux autres protocoles) et les transmet à un
    ou plusieurs backends comme OpenObserve, Prometheus, Jaeger ou Loki. Le collector peut filtrer,
    transformer, échantillonner et enrichir les données avant l'export.

otel-collector-features =
    - Supporte OTLP, Jaeger, Zipkin, Prometheus et plus de 40 formats d'entrée
    - Export vers OpenObserve, Prometheus, Jaeger, Loki et plus
    - Filtrer, transformer, échantillonner et enrichir la télémétrie
    - Traitement par lots pour un export efficace
    - TLS et authentification pour des pipelines sécurisés
    - Mise à l'échelle horizontale avec la distribution OpenTelemetry Collector Contrib
