# Dotfiles

## Prerequisites

```sh
brew install neovim git-delta zoxide atuin
```

```sh
npm i -g vscode-langservers-extracted typescript-language-server
```

## Install

```sh
git clone https://github.com/rdpascua/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

## What's included

| Config | Path |
|-|-|
| Neovim | `nvim/` |
| Zsh | `zsh/.zshrc` |
| Git | `git/.gitconfig` |
| IdeaVim | `ideavim/.ideavimrc` |
| Atuin | `atuin/` |
| iTerm2 | `iterm2/` |
| Fonts | `fonts/` |

## Fonts

Includes [Berkeley Mono](https://berkeleygraphics.com/typefaces/berkeley-mono/) patched with [Nerd Font](https://www.nerdfonts.com/) icons for full icon support in Neovim.

To install, copy the font files to your system:

```sh
cp fonts/*.ttf ~/Library/Fonts/
```

Then set **BerkeleyMono Nerd Font** as your terminal font (e.g. iTerm2 → Preferences → Profiles → Text → Font).

## Post-install

Open Neovim and run `:Lazy sync` to install plugins.

Restart your shell or `source ~/.zshrc` to load zsh changes.
