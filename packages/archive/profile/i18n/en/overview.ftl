# i18n/en/overview.ftl — FreeSynergy Profile help texts (English)

help-profile-title = FreeSynergy Profile

help-profile-body =
    FreeSynergy Profile is where you manage your identity on this FreeSynergy node.
    Your profile is stored in the node's S3 storage and referenced by Kanidm —
    changes here propagate automatically to all connected services via SCIM.

    The Profile app has three sections:
    - Identity: display name, avatar, bio, contact info
    - Linked accounts: service accounts from connected services
    - Privacy: visibility settings per field and federation sharing

help-profile-privacy-title = Privacy and Visibility

help-profile-privacy-body =
    Each profile field has an independent visibility setting:

    Public (node): visible to all users on this FreeSynergy node
    Project members: visible only to users in shared projects
    Private: visible only to yourself and node administrators

    Federation sharing is a separate setting that controls whether your profile
    is included when this node shares data with federated nodes. Disable this
    to keep your profile local to this node only.

help-profile-linked-title = Linked Accounts

help-profile-linked-body =
    Linked accounts connect your FreeSynergy identity to your accounts in
    individual services. When a linked account is set:
    - Your profile avatar appears in Forgejo commits and Vikunja tasks
    - Your display name is used in chat alongside your chat handle
    - Other users can find your service profiles from your FreeSynergy profile

    Linking is optional. Each service account is linked separately.
    Removing a linked account does not delete the service account.
