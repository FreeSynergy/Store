zentinel-description =
    Zentinel é um proxy reverso e API gateway nativo em Rust — a camada de ingresso para todos os serviços FreeSynergy.

    Lida com terminação TLS, HTTP/2, roteamento dinâmico e limitação de taxa. Cada serviço container é
    exposto através do Zentinel, que roteia o tráfego automaticamente com base em capabilities registradas no fs-registry.
    Certificados TLS são provisionados automaticamente via ACME (Let's Encrypt).

zentinel-features =
    - TLS automático via ACME (Let's Encrypt / CA personalizada)
    - Roteamento dinâmico — rotas se atualizam sem reiniciar
    - Ingresso HTTP e HTTPS (portas 80 e 443)
    - Suporte HTTP/2 e WebSocket
    - Limitação de taxa e throttling de requisições
    - Gerenciado via Zentinel Control Plane
    - Roteamento automático a partir de capabilities do fs-registry
    - Validação de token OAuth2 para rotas protegidas
