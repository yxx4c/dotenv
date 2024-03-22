# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
    echo zgen
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/adb
    zgen oh-my-zsh plugins/bun
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/emoji
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-commit
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/pm2
    zgen oh-my-zsh plugins/sdk
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/thefuck
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/ubuntu
    zgen oh-my-zsh plugins/vscode
    zgen oh-my-zsh plugins/yarn
    zgen oh-my-zsh plugins/zsh-interactive-cd

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-autosuggestions
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/nanotech

    # save all to init script
    zgen save
fi

# local/bin
export PATH="$HOME/.local/bin:$PATH"

# next
export NEXT_TELEMETRY_DISABLED=1

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"

# bun
export BUN_INSTALL="${HOME}/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="${HOME}/.nvm"

# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/.miniconda/etc/profile.d/conda.sh" ]; then
        . "${HOME}/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# tmux alias
alias trs='tmux rename'
alias trw='tmux rename-window'

# Android SDK
export ANDROID_SDK_ROOT="$HOME/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
