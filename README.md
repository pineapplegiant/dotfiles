# My dotfiles

> This is the safekeeping of my terminal environment! 🛸

[sysinfo]: ./setup.png "A Neofetch screenshot of my mac system"

![Neofetch information][sysinfo]

* I started trying to use the [XDG_SPECIFICATION](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) for my code to attempt to clean up my home directory.
* Basically, if the program supports it, look for settings in my dotfiles directory which should be in `$HOME/dotfiles`, if not, then just put it in `$HOME/.config` or `$HOME/.local` etc:
    - `XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"`
    - `XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"`
    - `XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"`

## Directory Structure
```bash
.
├── .cache/
├── .config/
├── .local/
├── .profile -> ~/.profile (symlinked to $HOME)
├── .zprofile -> ~/.zprofile (symlinked to $HOME)
├── README.md
├── neofetch.png
└── setup/ -> Brew packages and mac setup 

4 directories, 4 files

```

## Programs I use:

- [Iterm2](https://www.iterm2.com "Iterm's homepage") - Terminal Replacement for MacOS 💁
- [Neovim](https://neovim.io "NeoVim's Homepage") - The better vim 👀🔥
- [Tmux](https://github.com/tmux/tmux/wiki "Tmux's Homepage") - Terminal multiplexer - She thicc 🍑
- [ZShell](http://zsh.sourceforge.net/ "The Z shell's Homepage") - Better than bash experience 🤓
  - [Spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) - Configurable, pretty, and works 🚀


## Notable others :

- [Vscode](https://code.visualstudio.com "VSCode's homepage") - Can't lie, I use this too... Pair programming my guy.

## Colors I F(x)k with:

- [My very own Spaceduck theme](https://github.com/pineapplegiant/spaceduck-theme "My Personal Color scheme :3") - We rep them colors 🦆👽

## Setup (WIP Not sure if it works yet 😳)

1. Run mac-setup (macos) to install brew, git, and additional brew packages and settings:
    -`curl https://raw.githubusercontent.com/pineapplegiant/dotfiles/supreme-overlord/.macos | bash`

##### Brew Packages I really like :')

cmatrix
exa
fzf
genact
git
groff
htop
lazygit
ncurses
neofetch
neovim
node
pandoc
pandoc-citeproc
ripgrep
tldr
tmux
tree
unzip
yarn
z
zsh
zsh-autosuggestions
zsh-completions
zsh-history-substring-search
zsh-syntax-highlighting

cask "font-firamono-nerd-font-mono"

### Fonts

- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
    - `brew cask install font-firamono-nerd-font-mono`

### Apple Config

Run this to make VSCODE Vim repeat better
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

#### Iterm2 Settings

* Right command key is control

#### Prompt

[Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt)
  - `npm install -g spaceship-prompt`


#### System Settings:

**Run these to make key repeat faster:**
- `defaults write -g KeyRepeat -int 4`
- `defaults write -g InitialKeyRepeat -int 15`

**Run this to show full paths:**
- `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder`
- Finder -> View > Show Status bar
- Change Caps lock to ESC
