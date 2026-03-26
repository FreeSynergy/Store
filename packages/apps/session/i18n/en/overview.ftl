# i18n/en/overview.ftl — FreeSynergy Session help texts (English)

help-session-title = FreeSynergy Session

help-session-body =
    FreeSynergy Session is the user session manager for the FreeSynergy platform.
    It is a background service — you do not interact with it directly. The Desktop
    window manager uses it automatically.

    Every time you log in, a new session is created. The session stores:
    - Your user identity (user_id, display_name)
    - The login time and duration
    - A list of every program you have opened, with its current window state

    When you log out, the session is closed. On next login a fresh session starts.

help-session-minimize-title = The Minimize Problem

help-session-minimize-body =
    Without a session manager, every desktop environment faces the same problem:
    a user minimizes a program and then clicks its icon in the taskbar. The desktop
    has two choices: start a new instance (wrong — two windows, state lost) or
    somehow remember the old window (hard — requires a separate tracking mechanism).

    Session solves this cleanly. The Desktop always asks Session before launching:
    "Is fs-store already open for this user?"

    If Session says "yes, state = Minimized":
    → Desktop calls session.restore("fs-store") → window comes back to front
    → No new instance is started

    If Session says "no entry found":
    → Desktop launches fs-store → calls session.open("fs-store")
    → Session records the new entry

    The same mechanism works for "Focused" state (bring to front if already visible)
    and for crash recovery (Session knows the program was Open and can relaunch it).

help-session-bus-title = Bus API

help-session-bus-body =
    Programs interact with Session through the bus:

    session::user::current — get the active user's identity and login time
    session::programs::list — list all open programs and their states
    session::programs::open — record that a program was opened
    session::programs::minimize — mark a program as minimized
    session::programs::restore — mark a program as open/focused again
    session::programs::close — remove a program from the session

    The Desktop uses these automatically. Individual programs may query their
    own state to restore position, scroll offset, or last-used view.
