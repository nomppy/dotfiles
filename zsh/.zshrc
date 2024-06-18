setopt appendhistory autocd extendedglob
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export XDG_CONFIG_HOME="${HOME}/.config/"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# dwadwa
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  #eval "$(oh-my-posh init zsh)"
#fi

alias g++='g++ -std=c++20'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#export NODE_OPTIONS=--openssl-legacy-provider

export EDITOR="$(which nvim)"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.emacs.d/bin/"
export PATH=/opt/homebrew/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME'/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
alias fucky='fuck -y'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ----------antigen plugin manager----------
if ! [[ -f ~/.antigen/antigen.zsh ]]; then
	echo "Installing antigen..."
	mkdir ~/.antigen
	curl -L git.io/antigen > ~/.antigen/antigen.zsh
fi

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen theme romkatv/powerlevel10k

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle osx
antigen bundle dotenv
antigen bundle brews
antigen bundle alias-finder
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle command-not-found

antigen bundle mfaerevaag/wd
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

bindkey '^]' autosuggest-accept
bindkey -v

export KEYTIMEOUT=1
cursor_mode() {
# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

#---------- AUTOLOAD ----------
export FPATH="$HOME/.config/zsh/autoload/:$FPATH"
autoload -U colors && colors
source ~/.config/zsh/completion.zsh

setopt promptsubst

#---------- ZSH SCRIPTS ----------
# for file in $HOME/.config/zsh/scripts/*.zsh; do
#   source "$file"
# done

#---------- ALIASES ----------
alias af="alias-finder"
alias afl="alias-finder -l"
alias afe="alias-finder -e"
alias v="nvim"
alias m="neomutt"
alias tm="tmux"
alias tma="tmux attach"
alias tmks="tmux kill-session"
alias tmls="tmux list-session"

alias -g @G='| grep'
alias -g @L='| less'
alias -g @Q='2>/dev/null'
alias -g @S='>/dev/null'
alias -g @H='| head'
alias -g @T='| tail'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

wd() {
  . $HOME/bin/wd/wd.sh
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)
eval "$(zoxide init zsh)"

# [[ -z $TMUX ]] || conda deactivate; conda activate
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
eval $(thefuck --alias)

source <(fzf --zsh)
