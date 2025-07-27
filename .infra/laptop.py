"""
This file is intended to be executed with `pyinfra`

sudo pyinfra @local laptop.py
"""

from pyinfra.context import host
from pyinfra.operations import pacman, server

pacman.packages(
    name="Install fundamental CLI tools",
    packages=[
        # bare essentials
        "git",
        "openssh",
        "rsync",
        "bash-completion",
        # CLI tools
        "bat",
        "dust",
        "fd",
        "git-delta",
        "github-cli",
        "helix",
        "tealdeer",
        "tokei",
        "watchexec",
        "zoxide",
        # rga dependents:
        "ripgrep-all",
        "ripgrep",
        "pandoc-cli",
        "poppler",
        # paccache dependents
        "pacman-contrib",
        # misc
        "ansible",
        "syncthing",
    ],
    update=True,
    upgrade=True,
)

pacman.packages(
    name="Install Basic GUIs",
    packages=[
        "baobab",  # view file trees graphically
        "eog",  # eye of gnome for Photos
        "firefox",
        "gnome-disk-utility",  # format / partition disks interactively
        "kdeconnect",
        "libreoffice-still-en-gb",
        "mpv",
        "mpv-mpris",  # Install MPV and MPRIS kdeconnect control addon
        "qrca",  # QR code scanner (easier Wifi connection!)
        "rhythmbox",
        # skanpage + ocr engine
        "skanpage",
        "tesseract-data-eng",
        "wl-clipboard",  # `wl-copy` and `wl-paste`
        "xdg-desktop-portal",
    ],
)

pacman.packages(
    name="Install Typst compiler and LSP server",
    packages=["typst", "tinymist"],
)


pacman.packages(
    name="Install Rust toolchain",
    packages=[
        "bacon",
        "rustup",
    ],
)


from pyinfra.facts.files import File

if host.get_fact(File, "/usr/lib/rustup/bin/rust-analyzer") is None:
    server.shell(
        name="Setup rust-analyzer",
        commands=[
            "rustup default stable",
            "rustup component add rust-analyzer",
        ],
    )

# --- Programming Languages & Tooling ---

pacman.packages(
    name="Install Python toolchain",
    packages=[
        "ipython",
        "pyright",
        "python",
        "python-black",
        "python-pytest",
        "python-uv",
        "python-virtualenv",
        "ruff",
        "ruff-lsp",
    ],
)

pacman.packages(
    name="Install Python Data Science toolchain",
    packages=[
        "jupyter-notebook",
        "python-ipywidgets",
        "python-matplotlib",
        "python-pandas",
    ],
)

pacman.packages(
    name="Install JSON/YAML tooling",
    packages=[
        "vscode-json-languageserver",
        "yaml-language-server",
    ],
)
