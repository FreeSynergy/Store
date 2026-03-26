# i18n/en/overview.ftl — FreeSynergy Container Manager help texts (English)

help-container-app-title = FreeSynergy Container Manager

help-container-app-body =
    FreeSynergy Container Manager installs and manages containerized services
    on this FreeSynergy node. It uses Podman Quadlet — systemd-native container
    service management — instead of a Docker daemon or compose runtime.

    Services installed through the Container Manager are managed by systemd:
    they start at boot, restart on failure, and their logs are available in
    journalctl, just like any other systemd service.

help-container-app-install-title = Installing a Service

help-container-app-install-body =
    1. Find the container package in the Store and click Install.
    2. The Container Manager presents a form with all configurable variables
       for the service (ports, passwords, domain names, feature flags).
       Each variable has inline help explaining what it does.
    3. Fill in the required values. Secrets (passwords, tokens) are stored
       in a systemd credential file, not in the Quadlet unit file.
    4. Click Deploy. The Container Manager generates the Quadlet files,
       writes them to /etc/containers/systemd/, and enables the service.
    5. The service starts and its status appears in the service list.

help-container-app-multi-title = Multiple Instances

help-container-app-multi-body =
    Most container packages support running as multiple instances. For example,
    you can run two Forgejo instances (one for internal projects, one for public)
    on the same node with different ports and data directories.

    When installing a package that supports multiple instances, you are prompted
    for an instance name. The instance name is prefixed to all resource names
    (Quadlet file, data directory, systemd service name).

    Instance name rules:
    - Lowercase letters, digits, and hyphens only
    - 3–24 characters
    - Must be unique on this node for this package

help-container-app-logs-title = Service Logs

help-container-app-logs-body =
    Click any running service to open the log viewer. Logs are streamed in real
    time from journalctl. You can filter by time range, log level, or search
    for a specific text string.

    For services that write structured logs (JSON), the log viewer parses and
    displays them with field highlighting.
