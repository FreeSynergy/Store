node-description =
    FreeSynergy Node es el motor de servidor de la plataforma FreeSynergy.

    Gestiona proyectos, hosts y servicios federados. Proporciona un servidor de
    almacenamiento compatible con S3 para medios, copias de seguridad y perfiles.
    Todos los demás programas de FreeSynergy — Desktop, Container Manager, Store —
    se comunican con Node a través de su API REST.

    Node se ejecuta como un servicio systemd y expone una CLI para scripting y
    automatización. Cada comando de CLI corresponde directamente a un endpoint de API.

node-features =
    - Gestión de proyectos y hosts
    - Servidor de almacenamiento compatible con S3 (perfiles, copias de seguridad, medios)
    - Federación con otros nodos FreeSynergy
    - API REST (todos los comandos de CLI son endpoints de API)
    - Proveedor de bus de mensajes
