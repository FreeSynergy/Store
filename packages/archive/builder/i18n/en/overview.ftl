# i18n/en/overview.ftl — FreeSynergy Builder help texts (English)

help-builder-title = FreeSynergy Builder

help-builder-body =
    FreeSynergy Builder is the tool for creating FreeSynergy packages and publishing
    them to the Store catalog.

    It supports all package types: apps, containers, themes, widgets, tasks, icon sets,
    and language packs. The guided wizard walks through every required field and file
    and validates the package before publishing.

    For container packages, the Docker Compose importer is the fastest path: paste or
    upload a compose file and Builder generates the Quadlet service template, detects
    variables, infers their types, and creates stub help texts.

help-builder-compose-title = Docker Compose Import

help-builder-compose-body =
    Paste a docker-compose.yml file into the import dialog. Builder analyzes it and:
    - Maps each service to a Podman Quadlet service file template
    - Detects environment variables and infers their types (string, bool, int, port, url)
    - Assigns roles to recognized variables (e.g. POSTGRES_PASSWORD → role: db_password)
    - Generates a catalog.toml with all required fields pre-filled
    - Creates stub description.ftl and fields.ftl files for translation

    Review the result, fill in the description text, and the package is ready for
    validation and publishing.

help-builder-validate-title = Package Validation

help-builder-validate-body =
    Builder runs the same CI completeness rules as the Store catalog CI:
    - Required files present (catalog.toml, icon.svg, description.ftl)
    - overview.ftl required for app and container types
    - fields.ftl required when [[variables]] are defined
    - icon.svg is a valid SVG with a viewBox attribute
    - No binary files in the package directory

    Validation errors are shown inline with explanations of how to fix them.
    The Publish button is only enabled when all checks pass.
