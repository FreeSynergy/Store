# i18n/en/overview.ftl — FreeSynergy Showcase help texts (English)

help-showcase-title = FreeSynergy Showcase

help-showcase-body =
    FreeSynergy Showcase is the component gallery and design system reference for
    the FreeSynergy platform. It shows every UI component used across the platform,
    rendered with the currently active theme.

    Use Showcase to:
    - Explore available components when building a new FreeSynergy app
    - Check how a component looks in a different theme before switching
    - Find the correct CSS variable name for a design property
    - Verify that a custom theme covers all component states correctly

help-showcase-tokens-title = Design Tokens

help-showcase-tokens-body =
    Design tokens are CSS custom properties (variables) that define the visual
    properties of the platform. All components use these variables — a theme
    works by overriding them.

    Key token categories:
    - --fs-color-*: background, surface, text, accent, status colors
    - --fs-font-*: family, size-base, size-sm, size-lg, weight, line-height
    - --fs-radius-*: border radius for buttons, cards, inputs, modals
    - --fs-spacing-*: padding and margin scale (xs, sm, md, lg, xl)
    - --fs-shadow-*: box shadow definitions for elevation levels
    - --fs-transition-*: animation duration and easing functions

    The Showcase token page shows all variables with their current values and
    which components use each variable.

help-showcase-icons-title = Icon Gallery

help-showcase-icons-body =
    The Icon Gallery section shows all icons available in the currently active
    icon set. Icons are displayed in a searchable grid with their names.

    Click any icon to copy:
    - The icon name (for use in templates and code)
    - The SVG source
    - The Dioxus RSX component call

    If an icon is missing from the active set, the gallery shows the fallback
    icon from the FreeSynergy default set with a warning indicator.
