# Bash customisation file

#General configuration starts: stuff that you always want executed


# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x readlink ]]; then
  SCRIPT_PATH=$(readlink -n $CURRENT_SCRIPT)
  DOTFILES_DIR="${PWD}/$(dirname $(dirname $SCRIPT_PATH))"
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/.{functions,env,alias,bash_prompt}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done


# Clean up

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE 

# Export

export DOTFILES_DIR 

#General configuration ends

if [[ -n $PS1 ]]; then
    : # These are executed only for interactive shells
    echo "interactive"
    
else
    : # Only for NON-interactive shells
fi

if shopt -q login_shell ; then
    : # These are executed only when it is a login shell
    echo "login"
else
    : # Only when it is NOT a login shell
    echo "nonlogin"
fi

