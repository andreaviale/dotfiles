export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/.local/bin:$PATH"


# path to  relevant folders
#export BIB=$HOME/onedrive/References/library.bib
#export PAPER=$HOME/onedrive/my_papers/attitude_control_comparison
#export CV=$HOME/googledrive/CV/latex_new

ZSH_THEME="agnoster"

 # Remove mode switching delay.
    KEYTIMEOUT=5

    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select

    # Use beam shape cursor on startup.
    echo -ne '\e[5 q'

    _fix_cursor() {
    echo -ne '\e[5 q'
    }

precmd_functions+=(_fix_cursor)

#znap source marlonrichert/zsh-autocomplete
#znap source zsh-users/zsh-syntax-highlighting
#znap source zsh-users/zsh-autosuggestions
#znap source jeffreytse/zsh-vi-mode

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode)

# Fix Matlab graphics issue
export MESA_LOADER_DRIVER_OVERRIDE=i965

source $ZSH/oh-my-zsh.sh
# ALIASES:
source $HOME/.zshrc_alias
