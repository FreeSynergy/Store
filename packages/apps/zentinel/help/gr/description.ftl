zentinel-description =
    Το Zentinel είναι ο αντίστροφος διακομιστής μεσολάβησης και πύλη TLS
    για το FreeSynergy.

    Βρίσκεται μπροστά από όλες τις υπηρεσίες και χειρίζεται τον τερματισμό TLS,
    την ανανέωση πιστοποιητικών ACME (Let's Encrypt και ZeroSSL) και τη
    δρομολόγηση HTTP. Οι προκλήσεις DNS-01 υποστηρίζονται μέσω επεκτάσιμων
    παρόχων DNS (Cloudflare, Hetzner, IONOS και άλλοι).

    Το Zentinel συνήθως εγκαθίσταται ως μέρος του πακέτου zentinel μαζί με
    το Zentinel Control Plane, το οποίο παρέχει τον πίνακα διαμόρφωσης.

zentinel-features =
    - Τερματισμός TLS για όλες τις υπηρεσίες
    - Αυτόματη ανανέωση πιστοποιητικών (ACME / Let's Encrypt)
    - Δρομολόγηση HTTP/HTTPS με κανόνες βάσει διαδρομής
    - Υποστήριξη πρόκλησης DNS-01 (Cloudflare, Hetzner, IONOS, …)
    - Υποστήριξη πρόκλησης HTTP-01
    - Διαμόρφωση βάσει KDL
