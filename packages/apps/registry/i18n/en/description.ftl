registry-description =
    FreeSynergy Registry is the live capability directory for a FreeSynergy node.

    Services register themselves at startup with the capabilities they provide:
    auth (Kanidm), mail (Stalwart), git (Forgejo), chat (Tuwunel), wiki (Outline),
    and so on. The message bus queries the Registry to find which service to route
    an event to. Programs never hardcode service addresses — they look up a role.

    The Registry is the evolution of the former Bridge system. Instead of a generic
    dynamic executor, services now register typed adapters. The compiler verifies
    that every adapter implements the correct trait — no runtime surprises.

registry-features =
    - Live service directory: which services are registered and what they provide
    - Role-based routing: Bus routes events to services by role, not by name
    - Typed adapter pattern: compile-time contract verification (replaces Bridge)
    - Node-boot service: starts before any user session, runs the entire node lifetime
    - Health integration: deregisters services that fail their health checks
    - Bus API: all programs can query the registry for available capabilities
    - Federation-aware: knows which capabilities are available on connected nodes
