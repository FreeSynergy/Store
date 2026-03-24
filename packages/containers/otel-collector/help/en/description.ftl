otel-collector-description =
    The OpenTelemetry Collector is a vendor-agnostic telemetry pipeline component for
    receiving, processing, and exporting logs, metrics, and traces.

    It acts as a central hub that receives telemetry data from applications (via OTLP,
    Jaeger, Zipkin, Prometheus, Fluent Bit, and many more protocols) and forwards it
    to one or more backends such as OpenObserve, Prometheus, Jaeger, or Loki. The collector
    can filter, transform, sample, and enrich data before export.

otel-collector-features =
    - Supports OTLP, Jaeger, Zipkin, Prometheus, and 40+ input formats
    - Export to OpenObserve, Prometheus, Jaeger, Loki, and more
    - Filter, transform, sample, and enrich telemetry
    - Batch processing for efficient export
    - TLS and authentication for secure pipelines
    - Horizontal scaling with the OpenTelemetry Collector Contrib distribution
