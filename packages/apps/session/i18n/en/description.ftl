session-description =
    FreeSynergy Session manages the active user session on a FreeSynergy node.

    It tracks who is logged in and which programs are currently open, minimized,
    or focused. This solves the minimize problem: without Session, minimizing a
    program and clicking its icon again would start a second instance and lose the
    previous state. With Session, the Desktop queries Session first, finds the
    existing minimized entry, and restores the window — no new instance, no lost state.

    Session is a background service started automatically at login. It stores its
    state in a local SQLite database (fs-session.db) scoped to the current user.

session-features =
    - Tracks the active user (user_id, display_name, login time)
    - Per-program state: Open | Minimized | Focused with timestamps
    - Solves the minimize problem: restore instead of relaunch
    - Session-scoped: each user login creates a new session, closed at logout
    - Desktop integration: the window manager queries Session before launching
    - Bus API: programs can query and update their own state
    - Local SQLite: no network access required, survives temporary bus outages
