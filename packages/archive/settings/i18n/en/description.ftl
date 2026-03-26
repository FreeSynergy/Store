settings-description =
    FreeSynergy Settings is the central configuration app for the FreeSynergy platform.

    It provides a single place to configure everything: appearance (theme, language,
    locale), service roles (which service handles auth, mail, git, etc.), network
    settings, security options, and per-user preferences.

    Settings delegates to the appropriate managers for resources like themes and
    language packs — it does not manage those directly. For each setting category
    it calls the responsible manager or Node API.

settings-features =
    - Appearance: theme selection, accent color, font, desktop layout
    - Language and locale: display language, date/time format, number format
    - Service roles: assign services to platform roles (auth, mail, git, wiki, etc.)
    - Network: node URL, federation settings, proxy configuration
    - Security: session timeout, MFA requirements, trusted devices
    - Notifications: per-service notification preferences
    - Advanced: feature flags, experimental settings
