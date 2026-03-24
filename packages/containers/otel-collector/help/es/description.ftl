otel-collector-description =
    El OpenTelemetry Collector es un componente de pipeline de telemetría agnóstico de
    proveedor para recibir, procesar y exportar logs, métricas y trazas.

    Actúa como un hub central que recibe datos de telemetría de aplicaciones (vía OTLP,
    Jaeger, Zipkin, Prometheus, Fluent Bit y muchos más protocolos) y los reenvía a uno
    o más backends como OpenObserve, Prometheus, Jaeger o Loki. El collector puede filtrar,
    transformar, muestrear y enriquecer datos antes de exportar.

otel-collector-features =
    - Soporta OTLP, Jaeger, Zipkin, Prometheus y más de 40 formatos de entrada
    - Exporta a OpenObserve, Prometheus, Jaeger, Loki y más
    - Filtra, transforma, muestrea y enriquece telemetría
    - Procesamiento por lotes para exportación eficiente
    - TLS y autenticación para pipelines seguros
    - Escalado horizontal con la distribución OpenTelemetry Collector Contrib
