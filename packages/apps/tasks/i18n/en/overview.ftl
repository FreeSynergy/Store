# i18n/en/overview.ftl — FreeSynergy Tasks help texts (English)

help-tasks-title = FreeSynergy Tasks

help-tasks-body =
    FreeSynergy Tasks is the workflow and automation engine for the FreeSynergy platform.
    It combines personal task management with cross-service pipeline automation.

    Tasks can be simple to-do items or multi-step pipelines that coordinate actions
    across every connected service. All service communication goes through the message
    bus — Tasks never calls service APIs directly.

help-tasks-pipelines-title = Pipelines

help-tasks-pipelines-body =
    A pipeline is a sequence of steps, each of which sends a message to a service
    via the bus and optionally waits for a response. Steps can be conditional:
    a branch step runs different subsequent steps based on the result of a previous step.

    Pipelines can be triggered:
    - Manually: run from the Tasks UI or via CLI
    - On a schedule: cron expression (e.g. every Monday at 09:00)
    - By a bus event: e.g. "when a new git commit is pushed to main"

    Pipeline definitions can be packaged and shared in the Store as task packages.

help-tasks-community-title = Community Task Packages

help-tasks-community-body =
    The Store contains a tasks/ namespace with community-contributed pipeline templates.
    Installing a task package adds a ready-to-use pipeline to your Tasks app.

    Examples:
    - Weekly backup pipeline (Node S3 → Forgejo artifact)
    - New user onboarding (Kanidm → Vikunja project → chat welcome message)
    - Deployment pipeline (Forgejo webhook → container update → health check)

    Community tasks are read-only templates. After installing, create a copy to
    customize the pipeline for your environment.
