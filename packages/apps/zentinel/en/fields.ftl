# help/en/fields.ftl — Zentinel field help texts (English)

help-zentinel-field-config-title = KDL Configuration File (ZENTINEL_CONFIG)

help-zentinel-field-config-body =
    The path inside the container to the Zentinel KDL configuration file.
    Default: /config/zentinel.kdl

    This file is generated automatically by the Zentinel plugin (generate-config
    command) from all service contracts during `fsn deploy`. Do not edit it
    manually — any manual changes will be overwritten on the next deploy.

    To inspect the current configuration:
        podman exec {instance_name} cat /config/zentinel.kdl

    The KDL format (KDL Document Language) is a concise, human-readable
    configuration language. Each service entry looks approximately like:
        service "service-name" {
            domain "service.example.com"
            upstream "container-name:port"
        }

    If Zentinel is not routing a service correctly, inspect the KDL file
    to verify the generated configuration, then re-run `fsn deploy` to
    regenerate it from the current service contracts.

help-zentinel-field-acme-title = ACME Email

help-zentinel-field-acme-body =
    The ACME email is used for Let's Encrypt and ZeroSSL registration.
    It is NOT configured via environment variables — it is set in the
    host configuration file (host.toml) under:
        [proxy]
        acme_email = "admin@example.com"

    This email address:
    - Receives expiry warning emails (normally suppressed by auto-renewal)
    - Is required for Let's Encrypt account registration
    - Must be a real, monitored address

    The ACME email is set once per host, not per service. All certificates
    on the same host are registered under the same email.

    If you change the email after initial setup, you may need to delete the
    cached ACME account data in /data/acme/ and restart Zentinel.

help-zentinel-field-ports-title = Published Ports (80 / 443)

help-zentinel-field-ports-body =
    Zentinel is the ONLY module in FreeSynergy with published_ports.
    It publishes exactly two ports:
    - 80:80  — HTTP (redirected to HTTPS by Zentinel)
    - 443:443 — HTTPS (all service traffic)

    These are the only ports that need to be open in your host firewall
    for web services. Additionally:
    - 22 (SSH): for server administration
    - 2222 (or custom): for Forgejo Git-over-SSH (if used)

    Do not open ports for individual services (e.g. PostgreSQL port 5432,
    Dragonfly port 6379). Exposing these ports bypasses Zentinel and
    the platform's security model.

    If you need to expose a service on a non-standard port (e.g. Matrix
    federation on 8448), add it to Zentinel's published_ports via a
    project override.

help-zentinel-field-volumes-title = Volume Mounts

help-zentinel-field-volumes-body =
    Zentinel mounts four directories:

    /config (from {config_dir}/config):
    Zentinel's KDL configuration file and ACME email settings.
    Read-write — Zentinel writes certificate data here.

    /data (from {config_dir}/data):
    TLS certificates, ACME account keys, and other persistent state.
    Read-write — critical data, back this up!

    /srv/{project_name}/branding (from {project_root}/branding, read-only):
    Static files for the platform's landing page and error pages.
    Customize logos, favicon, and CSS here.

    /srv/{project_name}/sites (from {project_root}/sites, read-only):
    Static site files for domains that Zentinel serves directly (without
    an upstream container). Useful for landing pages and .well-known files.
