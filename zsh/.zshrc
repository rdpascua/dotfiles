export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export PATH=/Users/Shared/DBngin/postgresql/12.2/bin:$PATH
#export PATH=/Users/ricardopascua/.nvm/versions/node/v18.19.0/bin:$PATH
export PATH=/Users/Shared/DBngin/postgresql/14.3/bin:$PATH
export PATH=/Users/Shared/DBngin/mysql/8.0.27/bin:$PATH
export PATH=/Users/ricardopascua/.composer/vendor/bin:$PATH
export PATH="$HOME/go/bin:$PATH"

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

alias pa="php artisan"

# pnpm
export PNPM_HOME="/Users/ricardopascua/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export NODE_PATH=$NODE_PATH:`npm root -g`
# pnpm end

#php
#export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
alias vim="nvim"

export EDITOR=nvim

# bun completions
[ -s "/Users/ricardopascua/.bun/_bun" ] && source "/Users/ricardopascua/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

art() {
    if [ -f "artisan" ]; then
        php artisan "$@"
    else
        echo "artisan not found in the current directory"
    fi
}

# alias for git
alias gitardee="git fetch origin && git branch -D ardee || true && git checkout -b ardee origin/ardee/dev && git rebase main && git checkout main && git merge ardee"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'
eval "$(atuin init zsh)"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
