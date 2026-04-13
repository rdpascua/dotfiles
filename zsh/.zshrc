
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=/Users/Shared/DBngin/postgresql/17.0/bin:$PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

if command -v gpgconf &> /dev/null; then
  export GPG_TTY=$(tty)
  gpgconf --launch gpg-agent
fi

alias pa="php artisan"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias vim="nvim"
export EDITOR=nvim

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Common aliases
alias ll="ls -la"
alias la="ls -A"

art() {
    if [ -f "artisan" ]; then
        php artisan "$@"
    else
        echo "artisan not found in the current directory"
    fi
}

# alias for git
alias gamain="git fetch origin && git branch -D ardee || true && git checkout -b ardee origin/ardee/dev && git rebase main && git checkout main && git merge ardee"
alias gadev="git fetch origin && git branch -D ardee || true && git checkout -b ardee origin/ardee/dev && git rebase develop && git checkout develop && git merge ardee"
alias gastag="git fetch origin && git branch -D ardee || true && git checkout -b ardee origin/ardee/dev && git rebase staging && git checkout staging && git merge ardee"
alias gsb="git checkout develop && git checkout staging && git merge develop && git checkout main && git merge develop && git push origin staging main"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'
eval "$(atuin init zsh)"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# iTerm2 profile switching on SSH
iterm2_profile() {
  echo -ne "\033]1337;SetProfile=$1\007"
}

ssh() {
  case "$*" in
    *100.113.13.86*) iterm2_profile "SSH - Tailscale" ;;
    *)               iterm2_profile "SSH - Prod" ;;
  esac
  command ssh "$@"
  iterm2_profile "Default"
}
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

# jenv - Java version manager
if command -v jenv &> /dev/null; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
