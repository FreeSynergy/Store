node-description =
    O FreeSynergy Node é o motor do lado servidor da plataforma FreeSynergy.

    Gerencia projetos, hosts e serviços federados. Fornece um servidor de
    armazenamento compatível com S3 para mídia, backups e perfis. Todos os
    outros programas FreeSynergy — Desktop, Container Manager, Store —
    comunicam-se com o Node através de sua API REST.

    O Node é executado como um serviço systemd e fornece uma CLI para
    scripts e automação. Cada comando CLI corresponde diretamente a um
    endpoint da API.

node-features =
    - Gerenciamento de projetos e hosts
    - Servidor de armazenamento compatível com S3 (perfis, backups, mídia)
    - Federação com outros nós FreeSynergy
    - API REST (todos os comandos CLI são endpoints da API)
    - Provedor de barramento de mensagens
