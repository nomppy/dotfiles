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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#export NODE_OPTIONS=--openssl-legacy-provider

export EDITOR="$(which nvim)"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.emacs.d/bin/"
export PATH=/opt/homebrew/bin:$PATH
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 
eval "$(rbenv init - zsh)"

# Path to your oh-my-zsh installation.
export ZSH="/Users/kenneth/.oh-my-zsh"

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

bindkey '^ ' autosuggest-accept

#---------- AUTOLOAD ---------- 
export FPATH="$HOME/.config/zsh/autoload/:$FPATH"
autoload -U colors && colors

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
alias q="exit"

alias -g @G='| grep'
alias -g @L='| less'
alias -g @Q='2>/dev/null'
alias -g @S='>/dev/null'
alias -g @H='| head'
alias -g @T='| tail'

alias lfc="~/code/lfc/; code ./; yarn dev"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
wd() {
  . /Users/kenneth/bin/wd/wd.sh
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kenneth/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kenneth/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kenneth/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kenneth/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
