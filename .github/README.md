# Krish's Dotfiles

This repository contains most of my home directory setup, documented for my own ease of replication.
I may occasionally rewrite history of this repository and force push.

## How it's used


I manage my dotfiles with `git` through the [bare repository and alias](https://wiki.archlinux.org/title/Dotfiles#:~:text=bare%20repository%20and%20alias%20method) method:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

This method avoids symlinks and confusions that arise with git directories that reside inside the `$HOME` directory.



## Replication

1. Add `ParallelDownloads = 5` in your `/etc/pacman.conf`   

2. Inspect and install this list of packages

```sh
# applications, typically with GUI
sudo pacman -Syu alacritty bitwarden code firefox gimp mpv obsidian syncthing

# developer tools
sudo pacman -Syu helix neovim
sudo pacman -Syu bash-completion bat dust exa fd git git-delta github-cli just \
openssh ripgrep ripgrep-all rsync tealdeer tokei watchexec zoxide

# languages and language servers
sudo pacman -Syu ipython python python-{black,pre-commit,pytest,virtualenv} pyright
sudo pacman -Syu jupyter-notebook python-{ipywidgets,matplotlib,pandas}
sudo pacman -Syu julia rustup bacon
rustup install rust-analyzer

# misc, hardware/setup specific stuff
sudo pacman -Syu lshw neofetch ntfs-3g pacman-contrib power-profiles-daemon reflector xclip xf86-input-wacom
 ```
- Consider [`wslu`-tilities](https://wslutiliti.es/wslu/install.html)

3. Install dotfiles:

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

6. AUR Packages of interest

```sh
paru -S anki as-tree bash-complete-alias edir mathpix-snipping-tool mpv_inhibit_gnome pika-backup video-downloader
```

7. Pacman Hooks

Run `sudo mkdir -p /etc/pacman.d/hooks/`, and create the file `/etc/pacman.d/hooks/clean_cache.hook`:

```ini
[Trigger]
Operation = Remove
Operation = Install
Operation = Upgrade
Type = Package
Target = *

[Action]
Description = Keep the last cache and the currently installed; clear cache for unused packages
When = PostTransaction
Exec = /usr/bin/paccache -rvuk0 && /usr/bin/paccache -rvk2
```

8. Misc

### Automatic daylight saving time (GUI instructions for GNOME):

1. Settings -> Location Services ON
2. Settings -> Date & Time -> Automatic Time Zone ON
