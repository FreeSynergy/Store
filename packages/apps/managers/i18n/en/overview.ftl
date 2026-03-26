# i18n/en/overview.ftl — FreeSynergy Managers help texts (English)

help-managers-title = FreeSynergy Managers

help-managers-body =
    FreeSynergy Managers is the central panel for administering platform-wide
    resources: language packs, icon sets, cursor themes, visual themes, and the
    container service registry.

    The Managers app is the layer between the Store and the rest of the platform.
    When you install a language pack or icon set from the Store, the Managers app
    makes it available to all other programs. Programs do not manage these resources
    directly — they call the manager APIs through the message bus.

help-managers-language-title = Language Manager

help-managers-language-body =
    The Language Manager controls the display language and locale for the platform.
    It installs language packs from the Store (i18n/ namespace), sets the active
    language for the node and for individual users, and manages fallback languages.

    The platform language affects all UI text, number formatting, date formatting,
    and sort order. Each user can have a different language preference; if their
    language is not installed, the node default is used.

help-managers-icons-title = Icon Manager

help-managers-icons-body =
    The Icon Manager installs icon sets from the Store (icons/ namespace) and
    sets the active icon set. Multiple icon sets can be installed simultaneously;
    the active set is used as the first source, with others as fallback.

    Icon sets use the Homarr icon naming convention for compatibility.
    If an icon is not found in the active set, the platform falls back to the
    FreeSynergy default icon set.

help-managers-registry-title = Container Service Registry

help-managers-registry-body =
    The Container Service Registry lists all services installed through the
    Container Manager and their current registration status with the Store.
    It shows which services are registered on the message bus, which bus
    namespaces they declare, and which other services they depend on.

    Use the Registry to:
    - Check if a service is properly registered after installation
    - See which bus namespaces are available on this node
    - Diagnose missing service dependencies
