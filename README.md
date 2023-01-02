## Requirements

Misc:

- `diffpdf`
- `nvim` along with the `AstroNvim` repository
- `syncthing`
- `xclip`


## Replication

1. Add `ParallelDownloads = 5` in your `/etc/pacman.conf`   

2. Inspect and install this list of packages

```sh
# applications, typically with GUI
sudo pacman -Syu alacritty bitwarden code firefox gimp mpv obsidian syncthing

# developer tools
sudo pacman -Syu helix neovim
sudo pacman -Syu bash-completion bat dust exa fd git git-delta github-cli just \
ripgrep rsync tealdeer tokei watchexec zoxide

# languages and language servers
sudo pacman -Syu ipython python python-{lsp-server,pre-commit,pytest,virtualenv}
sudo pacman -Syu julia rustup bacon
rustup install rust-analyzer

# misc stuff
sudo pacman -Syu lshw ntfs-3g xclip neofetch
 ```

- maybe you'll also need [`power-profiles-daemon`](https://www.reddit.com/r/archlinux/comments/s364zv/power_profiles_missing_from_gnome_settings_after/)

3. Install:

```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/k12ish/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm --recursive dotfiles-tmp
source .bash_aliases
config config status.showUntrackedFiles no
```

4. Get `git` credentials sorted, in order to push config changes:

```sh
gh auth login
```

5. You'll probably want to install `paru` as well

```sh
rustup default stable
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```


