## Requirements

Binaries generally assumed to be installed on target machine.

Install these through `cargo` or maybe AUR

- `alacritty`
- `bat`
- `du-dust`, aka `dust`
- `fd-find`, aka `fd`
- `git-delta`, aka `delta`
- `ripgrep_all`, aka `rga`
- `ripgrep`, aka `rg`
- `tealdeer`, aka `tldr`
- `tokei`
- `zoxide`, aka `z`

Misc:

- `diffpdf`
- `nvim` along with the `AstroNvim` repository
- `syncthing`
- `xclip`

Commands 
```
pip install dateparser
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/k12ish/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm --recursive dotfiles-tmp
config config status.showUntrackedFiles no
```
