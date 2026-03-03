
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Lazy-load nvm (saves ~500ms on shell startup)
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { lazy_load_nvm && nvm "$@"; }
node() { lazy_load_nvm && node "$@"; }
npm() { lazy_load_nvm && npm "$@"; }
npx() { lazy_load_nvm && npx "$@"; }

export PATH=/Users/Shared/DBngin/postgresql/16.2/bin:$PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

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

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'
eval "$(atuin init zsh)"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

. "$HOME/.local/bin/env"

# jenv - Java version manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
