# i18n/en/overview.ftl — FreeSynergy Desktop help texts (English)

help-desktop-title = FreeSynergy Desktop

help-desktop-body =
    FreeSynergy Desktop is the graphical shell for the FreeSynergy platform.
    It is the primary interface for humans — all other FreeSynergy apps are
    accessible from within the Desktop.

    The Desktop is organized into four areas:
    - Header (60px): FreeSynergy branding, breadcrumb navigation, user/avatar menu
    - Sidebar (240px / 48px collapsed): app navigation tabs
    - Main area: the currently active app or widget view
    - Taskbar (48px): app launcher buttons, open windows, system tray, clock

    All FreeSynergy apps (Store, Lenses, Browser, Settings, etc.) run inside
    the Desktop as embedded views. They can also launch as standalone windows.

help-desktop-modes-title = Rendering Modes

help-desktop-modes-body =
    The Desktop supports three rendering modes built from a single codebase:

    Desktop mode (default):
    Opens as a native application window using a webview. This is the standard
    mode for workstations and laptops with a graphical display.

    Web mode (WASM):
    Runs in a browser. Useful for remote access without installing the Desktop
    locally. Requires a compatible browser with WebAssembly support.

    TUI mode:
    Renders in the terminal. Useful for server administration over SSH when no
    graphical display is available. Not all apps support TUI mode.

help-desktop-taskbar-title = Taskbar

help-desktop-taskbar-body =
    The taskbar runs at the bottom of the screen and contains:
    - App launcher buttons for quick access to installed apps
    - Open window indicators for apps currently running
    - System tray with notifications and status indicators
    - Clock with date and time

    Apps can be pinned to the taskbar from the app context menu.
