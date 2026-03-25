init-description =
    FreeSynergy Init is the one-time bootstrap binary for FreeSynergy.

    Download the binary for your platform, make it executable, and run it.
    It clones the FreeSynergy Store repository onto your machine and starts
    the installation wizard — no package manager or pre-installed dependencies
    required.

    Once Init has run, it hands over to the Store, which installs Node,
    Desktop, and any services you choose.

    Init itself is not installed — it is only needed once, at first setup.

init-usage =
    # Linux / macOS
    chmod +x fs-init
    ./fs-init

    # Windows
    fs-init.exe
