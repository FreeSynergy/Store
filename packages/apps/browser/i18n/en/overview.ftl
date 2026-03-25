# help/en/overview.ftl — FreeSynergy Browser help texts (English)

help-browser-title = FreeSynergy Browser

help-browser-body =
    FreeSynergy Browser is the integrated web browser for the FreeSynergy desktop.
    It is purpose-built for the platform — not a general web browser — and is
    designed to display service UIs, the Store, and admin panels with seamless
    single sign-on.

    Key capabilities:
    - Automatic IAM token injection: the browser holds a Kanidm session and
      injects tokens into requests to FreeSynergy services. You never log in
      separately to each service.
    - Tab support for working with multiple service UIs at once
    - S3 download integration for files stored in FreeSynergy storage
    - TUI mode for server-side and terminal-only environments

    In graphical environments the browser launches as a desktop window.
    On headless servers it falls back to TUI mode automatically.

help-browser-tui-title = TUI Mode

help-browser-tui-body =
    TUI mode renders service web UIs in the terminal using a text-based renderer.
    It is useful for:
    - Administering a FreeSynergy node over SSH without a graphical session
    - Accessing the Store and service dashboards from a terminal
    - Automated scripting against service UIs

    TUI mode can be forced with BROWSER_TUI_MODE = true, or set as the default
    in the package variables. The browser detects headless environments automatically
    and enables TUI mode without configuration.

help-browser-sso-title = Single Sign-On (Token Injection)

help-browser-sso-body =
    The browser holds an active Kanidm session for the current user and attaches
    the OAuth2 bearer token to outgoing requests for registered FreeSynergy services.

    This means:
    - Opening Forgejo, Outline, Vikunja, pretix, or any other integrated service
      opens the service already authenticated — no login screen.
    - Token refresh is automatic and transparent.
    - The session is scoped to the FreeSynergy user account, not the browser.

    Services that are not registered in Kanidm (external websites) receive no token
    and behave like a normal browser request.
