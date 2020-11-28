# My dotfiles

> This is the safekeeping of my terminal environment

[sysinfo]: https://github.com/pineapplegiant/dotfiles/raw/master/neofetch.png "Neofetch of my mac system"

![Neofetch information][sysinfo]

## Programs I use:

- [Iterm2](https://www.iterm2.com "Iterm's homepage") - Terminal Replacement for MacOS 💁
- [Neovim](https://neovim.io "NeoVim's Homepage") - The better vim experience 👀🔥
- [Tmux](https://github.com/tmux/tmux/wiki "Tmux's Homepage") - Terminal multiplexer - She thicc 🍑
- [ZShell](http://zsh.sourceforge.net/ "The Z shell's Homepage") - Better than bash experience
  - [Spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) - Configurable, pretty, and works 👍

## ColorTheme I use:

- [My very own Spaceduck](https://github.com/pineapplegiant/spaceduck-theme "My Personal Color scheme :3") - Self plug for your boys own colors 🦆✌️

## Notable programs:

- [Vscode](https://code.visualstudio.com "VSCode's homepage") - Can't lie, I use this sometimes too...

## Setup (WIP)


##### Brew Packages I like

exa
fzf
htop
ncurses
node
neofetch
pandoc
pandoc-citeproc
ripgrep
tig
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

### Fonts

- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

### VSCode Settings

Run this to make VSCODE Vim repeat better
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

### Iterm2 Settings

* Right command key is control

## Prompt

[Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt)
  - `npm install -g spaceship-prompt`


### Mac system Settings:

Run these to make key repeat faster

- `defaults write -g KeyRepeat -int 4`
- `defaults write -g InitialKeyRepeat -int 15`

Run this to show full paths

- `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder`

Also: Finder -> View>Show Status bar
Change Caps lock to ESC
