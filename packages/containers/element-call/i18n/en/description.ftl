element-call-description =
    Element Call provides native WebRTC voice and video calling for the Matrix protocol.

    This package bundles Element Call (the calling web frontend) with coturn (the TURN/STUN relay
    server required for NAT traversal). Together they enable high-quality voice and video calls
    directly within Matrix clients such as Element. Requires a Tuwunel Matrix homeserver.

element-call-features =
    - WebRTC voice and video calls natively in Matrix
    - Group calls with full end-to-end encryption
    - coturn TURN/STUN server for reliable NAT traversal
    - TLS-secured TURN connections (TURNS on port 5349)
    - Works with all Element clients (web, desktop, mobile)
    - No external call infrastructure required
    - Low-latency peer-to-peer media paths where possible
