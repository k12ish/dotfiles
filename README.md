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
$ sudo pacman -S alacritty bash-completion bat bitwarden code dust exa fd \
firefox gimp git git-delta github-cli helix ipython julia just lshw mpv \
neofetch neovim  ntfs-3g obsidian python ripgrep rsync rustup syncthing \
tealdeer tokei watchexec xclip zoxide
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


