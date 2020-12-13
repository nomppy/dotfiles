# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="${PATH}:${HOME}/.local/bin/"

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
source ~/.antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle osx
antigen bundle dotenv
antigen bundle brews
antigen bundle alias-finder
antigen bundle colorize
antigen bundle colored-man-pages

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

#---------- AUTOLOAD ---------- 
export FPATH="$HOME/.config/zsh/autoload/:$FPATH"
autoload -Uz lnd; lnd
autoload -U colors && colors

setopt promptsubst

# command not found handler for osx
HB_CNF_HANDLER="$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

#---------- ZSH SCRIPTS ----------
# for file in $HOME/.config/zsh/scripts/*.zsh; do
#   source "$file"
# done

#---------- ALIASES ----------
alias af="alias-finder"
alias afl="alias-finder -l"
alias afe="alias-finder -e"
alias v="vim"
alias q="exit"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
