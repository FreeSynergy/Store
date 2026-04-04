zentinel-description =
    Το Zentinel είναι ένας Rust-native reverse proxy και API gateway — το επίπεδο εισόδου για όλες τις υπηρεσίες FreeSynergy.

    Διαχειρίζεται TLS termination, HTTP/2, δυναμική δρομολόγηση και rate limiting. Κάθε υπηρεσία container
    εκτίθεται μέσω Zentinel, που δρομολογεί αυτόματα την κίνηση βάσει capabilities στο fs-registry.
    Τα TLS πιστοποιητικά παρέχονται αυτόματα μέσω ACME (Let's Encrypt).

zentinel-features =
    - Αυτόματο TLS μέσω ACME (Let's Encrypt / προσαρμοσμένη CA)
    - Δυναμική δρομολόγηση — οι διαδρομές ενημερώνονται χωρίς επανεκκίνηση
    - Είσοδος HTTP και HTTPS (θύρες 80 και 443)
    - Υποστήριξη HTTP/2 και WebSocket
    - Rate limiting και throttling αιτημάτων
    - Διαχείριση μέσω Zentinel Control Plane
    - Αυτόματη δρομολόγηση από capabilities του fs-registry
    - Επικύρωση token OAuth2 για προστατευμένες διαδρομές
