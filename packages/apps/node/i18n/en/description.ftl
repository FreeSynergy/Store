node-description =
    FreeSynergy Node is the server-side engine of the FreeSynergy platform.

    It manages projects, hosts, and federated services. It provides an
    S3-compatible storage server for media, backups, and profiles. All other
    FreeSynergy programs — Desktop, Container Manager, Store — communicate
    with Node through its REST API.

    Node runs as a systemd service and exposes a CLI for scripting and
    automation. Every CLI command maps directly to an API endpoint.

node-features =
    - Project and host management
    - S3-compatible storage server (profiles, backups, media)
    - Federation with other FreeSynergy nodes
    - REST API (all CLI commands are API endpoints)
    - Message bus provider
