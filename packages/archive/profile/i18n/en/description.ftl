profile-description =
    FreeSynergy Profile manages the user's identity on the FreeSynergy platform.

    Set a display name, avatar, bio, and contact information. Link service accounts
    from connected services (Forgejo, Vikunja, chat). Control which profile fields
    are visible to other users on this node and which are shared across federated nodes.

    The profile is stored in the S3 storage of the Node and synchronized automatically.
    Profile data is referenced by Kanidm — changing the display name or avatar here
    updates it across all connected services that use OIDC/SCIM.

profile-features =
    - Display name and avatar (stored in Node S3)
    - Bio and contact information with visibility controls
    - Linked service accounts from connected services
    - Per-field privacy: visible to node members, project members, or nobody
    - Federation profile: opt-in sharing with other FreeSynergy nodes
    - Profile picture upload with automatic resizing
    - Account security overview (linked devices, active sessions)
