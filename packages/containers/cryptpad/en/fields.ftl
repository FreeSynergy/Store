# help/en/fields.ftl — CryptPad field help texts (English)

help-cryptpad-field-main-domain-title = Main Domain (CPAD_MAIN_DOMAIN)

help-cryptpad-field-main-domain-body =
    The full HTTPS URL of the main CryptPad domain (including scheme).
    Example: https://pad.example.com

    This is the URL users navigate to when opening CryptPad. It must match:
    - The Zentinel proxy route for the main route
    - The domain in the TLS certificate
    - What users type in their browser

    CryptPad uses this for Content Security Policy headers and for constructing
    sharing links in documents.

    Must NOT end with a trailing slash.

help-cryptpad-field-sandbox-domain-title = Sandbox Domain (CPAD_SANDBOX_DOMAIN)

help-cryptpad-field-sandbox-domain-body =
    The full HTTPS URL of the CryptPad sandbox domain (including scheme).
    Example: https://sandbox.pad.example.com

    This must be a completely different origin from the main domain. A different
    subdomain is sufficient (e.g. sandbox.pad.example.com is separate from
    pad.example.com because the subdomain differs).

    CryptPad loads all document editors in an <iframe> from this domain to
    prevent cross-origin attacks. Without a correctly configured sandbox domain,
    document editing will not work.

    A second Zentinel proxy route must point this domain to the same container
    as the main domain. Both routes point to the same container port (3000).

help-cryptpad-field-trusted-proxy-title = Trusted Proxy CIDR (CPAD_TRUSTED_PROXY)

help-cryptpad-field-trusted-proxy-body =
    The IP range of trusted reverse proxies. CryptPad accepts the real client IP
    from X-Forwarded-For headers only when the connection comes from this range.

    Default "10.0.0.0/8" covers all Podman internal networks (Podman uses 10.x.x.x
    for container-to-container networking). This is correct for standard deployments
    where Zentinel is the only proxy.

    Change this only if:
    - You have additional upstream proxies (CDN, load balancer) with different IPs
    - Your Podman network uses a different CIDR range

    Setting this too broadly (e.g. 0.0.0.0/0) allows IP spoofing.

help-cryptpad-field-admin-email-title = Admin Email Address

help-cryptpad-field-admin-email-body =
    The email address shown in the CryptPad footer as the administrator contact.
    Users can click this address to reach out for support or account issues.

    This does not configure email sending — CryptPad does not send transactional
    emails in its default configuration. It is purely a display value.

    After first start, this can also be set in the CryptPad admin panel at
    https://pad.example.com/admin under "General" > "Contact email".
