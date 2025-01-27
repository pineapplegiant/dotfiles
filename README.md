# My dotfiles 🛸

> This is the safekeeping of my terminal environment! 👽

[sysinfo]: ./neofetch.png "A Neofetch screenshot of my mac system"

![Neofetch information][sysinfo]

- I use the [XDG_SPECIFICATION](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) for my code to attempt to clean up my home directory
  - `XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"`
  - `XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"`
  - `XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"`

## Directory Structure

```bash
.
├── .cache/
├── .config/ -> ~/.config (symlinked to $HOME)
├── .local/
├── .profile -> ~/.profile (symlinked to $HOME)
├── .zprofile -> ~/.zprofile (symlinked to $HOME)
├── README.md
├── neofetch.png
└── install/ -> Brew packages & MacOSX setup

4 directories, 4 files

```

## Essential Programs I use daily:

- [Ghostty](https://github.com/ghostty-org/ghostty "Ghostty! The New Zig-based terminal") - It's nice
- [Neovim](https://neovim.io "NeoVim's Homepage") - I love Neovim 🔥
- [ZShell](http://zsh.sourceforge.net/ "The Z shell's Homepage") - Better than Bash 🤓
  - [Spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt "Spaceship prompt Github") - Configurable, pretty, and works 🚀
- [Karabiner](https://karabiner-elements.pqrs.org/ "Karabiner Elements home page") - I like to remap the right command on MacOSX to Ctrl ⌨
- [Rectangle](https://rectangleapp.com/ "Rectangle Home Page") - A better window managing experience on Mac 👓
- [Zed](https://code.visualstudio.com "Zed's homepage") - It's a pretty fast text editor too, if I need some more UI

## Colors:

- [My very own Spaceduck theme](https://github.com/pineapplegiant/spaceduck-theme "My Personal Color scheme :3") - We rep them colors 🦆👽

## Setup (_doesn't really work tbh_ 😳)

1. Run ./install/mac-os-setup to install brew, git, and additional brew packages and settings:

```bash
  curl "https://raw.githubusercontent.com/pineapplegiant/dotfiles/supreme-overlord/install/mac-os-setup" | bash
```

##### Other Brew Packages I really like

* [exa](https://github.com/ogham/exa) - Better LS
* [zoxide](https://github.com/ajeetdsouza/zoxide) - Better CD
* [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Better search
* [htop](https://htop.dev/) - See terminal processes
* [lazygit](https://github.com/jesseduffield/lazygit) - Better Git UI
* [tldr](https://github.com/tldr-pages/tldr) - Explain commands things better
* [tree](https://oldmanprogrammer.net/source.php?dir=projects/tree) - Nice directory tree maker
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [genact](https://github.com/svenstaro/genact) - Need the nonsense
* [cmatrix](https://github.com/abishekvashok/cmatrix) - We live in the matrix


### Fonts

- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
  - `brew install --cask font-firamono-nerd-font-mono`
  - `brew install --cask font-sauce-code-pro-nerd-font`

### Apple Settings Config

#### Prompt

[Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt)

- `brew install -g spaceship-prompt`

#### System Settings:

**Run these to make key repeat faster:**

- `defaults write -g KeyRepeat -int 4`
- `defaults write -g InitialKeyRepeat -int 15`

**Run this to show full paths in finder:**

- `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder`
- Finder -> View > Show Status bar
- Change Caps lock to ESC -> Taken care of in the Karabiner

Run this to make "Emulated Vim" repeat better
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
