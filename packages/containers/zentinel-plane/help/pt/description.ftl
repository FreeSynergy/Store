zentinel-plane-description =
    O Zentinel Control Plane gerencia a frota de proxies Zentinel com configuração centralizada de rotas e TLS.

    Fornece uma API REST e um painel para adicionar, atualizar e remover rotas de proxy em todas as
    instâncias Zentinel. O FreeSynergy o usa para gerenciamento centralizado de ingresso — quando um
    novo serviço é instalado, o fs-container-adapter registra suas rotas aqui automaticamente.

zentinel-plane-features =
    - Configuração centralizada de rotas para todos os proxies Zentinel
    - Provisionamento e renovação automática de certificados TLS
    - Monitoramento de saúde de todas as instâncias proxy
    - API REST para gerenciamento programático de rotas
    - Painel para rotas ativas e status de certificados
    - Registro automático de rotas via integração fs-registry
    - API de administração protegida por OAuth2 (Kanidm)
