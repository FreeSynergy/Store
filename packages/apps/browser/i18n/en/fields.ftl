# help/en/fields.ftl — FreeSynergy Browser field help texts (English)

help-browser-field-default-url-title = Default URL

help-browser-field-default-url-body =
    The URL the browser opens on startup. If empty, the browser opens a blank page
    or the FreeSynergy dashboard (if configured in the Desktop settings).

    Recommended: set this to your FreeSynergy dashboard URL so the desktop overview
    is visible immediately on browser launch. For example:
        https://node.example.com/dashboard

    Leave empty to let the Desktop decide which URL to open based on context.

help-browser-field-tui-mode-title = Default to TUI Mode

help-browser-field-tui-mode-body =
    When enabled, the browser starts in TUI (terminal user interface) mode by default,
    even if a graphical display is available.

    Enable this on headless servers where the browser is used exclusively over SSH
    for administration. On desktop installations, leave this disabled — TUI mode
    is activated automatically when no graphical display is detected.

    Note: TUI mode does not support all browser features. Complex JavaScript-heavy
    UIs may render with reduced functionality in TUI mode.
