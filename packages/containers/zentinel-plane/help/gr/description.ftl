zentinel-plane-description =
    Το Zentinel Control Plane διαχειρίζεται τον στόλο των Zentinel proxy με κεντρική ρύθμιση διαδρομών και TLS.

    Παρέχει REST API και dashboard για προσθήκη, ενημέρωση και αφαίρεση διαδρομών proxy σε όλες
    τις instances Zentinel. Το FreeSynergy το χρησιμοποιεί για κεντρική διαχείριση ingress — όταν
    εγκαθίσταται νέα υπηρεσία, ο fs-container-adapter καταχωρεί τις διαδρομές του εδώ αυτόματα.

zentinel-plane-features =
    - Κεντρική ρύθμιση διαδρομών για όλα τα Zentinel proxies
    - Αυτόματη παροχή και ανανέωση TLS πιστοποιητικών
    - Παρακολούθηση υγείας όλων των instances proxy
    - REST API για προγραμματική διαχείριση διαδρομών
    - Dashboard για ενεργές διαδρομές και κατάσταση πιστοποιητικών
    - Αυτόματη καταχώρηση διαδρομών μέσω ενσωμάτωσης fs-registry
    - API διαχείρισης προστατευμένο με OAuth2 (Kanidm)
