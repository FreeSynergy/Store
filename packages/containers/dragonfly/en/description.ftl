dragonfly-description =
    DragonflyDB is a modern, high-performance in-memory data store fully compatible
    with the Redis and Memcached APIs.

    It is designed as a drop-in replacement for Redis, using significantly less memory
    (up to 25x in some workloads) while achieving higher throughput on multi-core CPUs.
    Existing Redis clients work without any code changes. DragonflyDB is a great choice
    for caching, session storage, and pub/sub in FreeSynergy deployments.

dragonfly-features =
    - Redis and Memcached API compatible
    - Drop-in Redis replacement — no code changes
    - Up to 25x lower memory usage compared to Redis
    - Multi-threaded for modern multi-core CPUs
    - Built-in TLS support
    - Lua scripting and Redis modules support
    - Suitable for caching, sessions, and pub/sub
