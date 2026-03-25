# help/en/overview.ftl — pretix help texts (English)

help-pretix-title = pretix — Ticket Sales and Event Registration

help-pretix-body =
    pretix is a powerful, open-source event ticketing and registration platform.
    It handles everything from small community meetups to large conferences with
    thousands of attendees.

    Features:
    - Event creation with multiple ticket types, quotas and pricing tiers
    - Online ticket shop with a customizable checkout flow
    - QR code tickets (PDF and Apple Wallet / Google Pay via passbook plugin)
    - Multiple payment methods (bank transfer, PayPal, Stripe, and more via plugins)
    - Check-in app for scanning tickets at the venue
    - Multi-organizer support (multiple teams managing their own events)
    - Waiting lists and voucher codes
    - Custom order questions (collect information from attendees)
    - Email confirmations with attached PDF tickets
    - SSO via OIDC (pretix-oidc plugin)

    IMPORTANT: pretix requires a custom Docker image with plugins pre-installed.
    The standard pretix image does not include the OIDC, passbook or pages plugins.
    Build the image before first deployment:
        podman build -t fs-pretix node/containers/pretix/

    Dependencies: PostgreSQL (event and order data), Dragonfly (sessions DB 4,
    Celery broker DB 5, results DB 6), Kanidm (SSO via pretix-oidc), Stalwart
    (order confirmation emails).

help-pretix-install-title = Installing pretix

help-pretix-install-body =
    1. Build the custom pretix image first (required):
         podman build -t fs-pretix /home/kal/Server/fs-store/node/containers/pretix/

    2. Before installing, create an OAuth2 client in Kanidm:
       - Client name: "pretix"
       - Redirect URI: https://tickets.example.com/oauth2/callback/kanidm
       - Scopes: openid, email, profile, groups

    3. Run the setup wizard:
       - Service domain (e.g. tickets.example.com)
       - Currency (e.g. EUR)
       - Default locale (e.g. de)
       - SMTP settings for order confirmations (optional)

    4. After first start, visit https://tickets.example.com/control and log in
       as admin (credentials generated in vault).

    5. Configure OIDC in Django admin (pretix-oidc plugin):
       - System Settings > Authentication > Add OIDC provider
       - Issuer: https://auth.example.com/oauth2/openid/pretix
       - Client ID: pretix
       - Client Secret: from Kanidm

    6. Create an organizer and your first event in the pretix admin.

help-pretix-plugins-title = pretix Plugins

help-pretix-plugins-body =
    The FreeSynergy pretix image includes these plugins:

    pretix-oidc: OpenID Connect / SSO authentication for organizers and admins.
    Allows staff to log into the pretix control panel with their Kanidm credentials.
    Note: Attendees (ticket buyers) do not use OIDC — they check out as guests
    or with a local pretix account.

    pretix-pages: Adds static page support to the event shop. Use this for
    FAQs, privacy policies, and venue information displayed in the shop.

    pretix-fontpack-free: Free font pack for ticket PDFs. Adds proper Unicode
    font coverage so tickets with non-Latin characters (Arabic, Chinese, etc.)
    render correctly.

    pretix-passbook: Generates Apple Wallet (.pkpass) and Google Wallet tickets.
    Attendees can add tickets to their phone's wallet app for easy scanning.

    To add more plugins, modify the Dockerfile in node/containers/pretix/ and
    rebuild the image. Many pretix plugins are on PyPI (pip install pretix-xxx).

help-pretix-events-title = Creating Events

help-pretix-events-body =
    In pretix, the hierarchy is:
    Organizer → Event → Ticket Types (Items) → Quotas → Order

    1. Organizer: represents your organization or team.
       Create via: control panel > Your Organizers > Add Organizer.

    2. Event: a specific event (conference, concert, workshop).
       Each event has a date, location, and its own ticket shop URL:
           https://tickets.example.com/{organizer-slug}/{event-slug}/

    3. Items: ticket types (e.g. "Regular", "Student", "VIP").
       Each item has a price, quota (number available) and validity period.

    4. Quotas: control how many tickets are available. One quota can apply
       to multiple items (e.g. "100 total tickets" shared between Regular and VIP).

    5. Payment methods: configure in Event > Settings > Payment.
       Free events: enable "Manual payment" or "Mark paid on demand".
       Paid events: connect payment providers (Stripe, PayPal, bank transfer).

    6. Check-in: use the pretix Android/iOS app or pretixSCAN to scan
       tickets at the venue entrance.
