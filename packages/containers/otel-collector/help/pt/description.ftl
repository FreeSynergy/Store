otel-collector-description =
    O OpenTelemetry Collector é um componente de pipeline de telemetria
    independente de fornecedor para receber, processar e exportar logs,
    métricas e traces.

    Atua como um hub central que recebe dados de telemetria de aplicações
    (via OTLP, Jaeger, Zipkin, Prometheus, Fluent Bit e muitos outros
    protocolos) e os encaminha para um ou mais backends como OpenObserve,
    Prometheus, Jaeger ou Loki. O collector pode filtrar, transformar,
    amostrar e enriquecer dados antes da exportação.

otel-collector-features =
    - Suporta OTLP, Jaeger, Zipkin, Prometheus e mais de 40 formatos de entrada
    - Exportação para OpenObserve, Prometheus, Jaeger, Loki e outros
    - Filtragem, transformação, amostragem e enriquecimento de telemetria
    - Processamento em lote para exportação eficiente
    - TLS e autenticação para pipelines seguros
    - Escalabilidade horizontal com a distribuição OpenTelemetry Collector Contrib
