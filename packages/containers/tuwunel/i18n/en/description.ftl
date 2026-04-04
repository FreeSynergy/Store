tuwunel-description =
    Tuwunel is a high-performance Matrix homeserver written in Rust, forked and pre-configured for FreeSynergy.

    It provides real-time encrypted messaging, rooms, spaces, and voice/video calls via the open Matrix protocol.
    Users authenticate via Kanidm OIDC — no separate Matrix accounts are needed.
    Media files are stored in S3-compatible storage. Supports federation with other Matrix homeservers.

tuwunel-features =
    - Matrix Client-Server API (CS-API r0/v3)
    - End-to-end encrypted messaging and file sharing
    - Rooms, spaces, and direct messages
    - Voice and video calls via Element Call (TURN/STUN)
    - Matrix federation with the wider Matrix network
    - OIDC single sign-on via Kanidm
    - SCIM user provisioning from Kanidm
    - S3-compatible media storage
    - Bot support via fs-bots (fs-channel-matrix adapter)
