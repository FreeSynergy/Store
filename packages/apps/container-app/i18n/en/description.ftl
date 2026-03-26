container-app-description =
    FreeSynergy Container Manager is the graphical interface for managing
    containerized services on a FreeSynergy node.

    It reads container packages from the Store, generates Podman Quadlet service
    files from templates, manages configuration variables, and controls running
    services through systemctl — without requiring a Docker socket or daemon.

    The 6-step installation process: parse the package template, validate it,
    resolve variables (with type-aware prompts), generate Quadlet files,
    integrate with the Store registry, and write to the filesystem.

container-app-features =
    - Install container packages from the Store with variable prompts
    - Podman Quadlet service generation (no Docker daemon required)
    - Service control: start, stop, restart, enable, disable
    - Live log viewer per service (journalctl integration)
    - Health status dashboard for all running services
    - Multi-instance support: run the same service multiple times with different names
    - Update services in-place with automatic config migration
