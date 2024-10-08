# Common ENV variables
export EDITOR='nano'
export GIT_EDITOR='nano'
export SHELL='/bin/zsh'

# Fix Locale
export LC_ALL=de_DE.UTF-8
export LC_TIME=de_DE.UTF-8
export LANG=de_DE.UTF-8

# History
export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Remove superfluous blanks from each command line being added to the history
# list
setopt histreduceblanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt histignorespace
# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt histignorealldups
# Switching directories for lazy people
setopt autocd
# See: http://zsh.sourceforge.net/Intro/intro_6.html
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
# Don't kill background jobs when I logout
setopt nohup
# See: http://zsh.sourceforge.net/Intro/intro_2.html
setopt extendedglob
# Do not require a leading '.' in a filename to be matched explicitly
setopt globdots
# Use vi key bindings in ZSH
setopt vi
# Causes field splitting to be performed on unquoted parameter expansions
setopt shwordsplit
# Automatically use menu completion after the second consecutive request for
# completion
setopt automenu
# If the argument to a cd command (or an implied cd with the AUTO_CD option set)
# is not a directory, and does not begin with a slash, try to expand the
# expression as if it were preceded by a '~'
setopt cdablevars
# Try to make the completion list smaller (occupying less lines) by printing
# the matches in columns with different widths
setopt listpacked
# Don't show types in completion lists
setopt nolisttypes
# If a completion is performed with the cursor within a word, and a full
# completion is inserted, the cursor is moved to the end of the word
setopt alwaystoend
# Try to correct the spelling of commands
setopt correct
# https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt no_nomatch  
# Disable annoying confirm
setopt rmstarsilent

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# zstyle
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

# Functions Autoloading
fpath=(~/.zsh $fpath)

# Completion
autoload -U promptinit && promptinit
autoload -U compinit compdef && compinit

# Prompt
PROMPT="%B%F{015}%n%f@%F{001}%M%f::%F{006}%F{002}%d%f::"
RPROMPT="%B%F{012}%D{%d/%m/%Y}%f:%F{014}%*%f"


# Reverse search
bindkey -e

# Autosuggest
source ~/.zsh/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0162'

if [ `uname` = 'Linux' ]; then
    eval `dircolors ~/.dir_colors`
    export LS_OPTIONS='--color=auto'
else
    export LS_OPTIONS='-G'
fi

if [ -f ~/.zsh/zshalias ]; then
    source ~/.zsh/zshalias
else
    print "404: ~/.zsh/zshalias not found."
fi


### PATH
source ~/.zsh/zsh-autosuggestions

export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:/opt/wine-stable/bin:"
export AM_GRUMPHP_LOCAL=yay
export CACHE_AND_LOG_DIR=/tmp/automanager

#XDG/DBUS
export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"


#Docker rootless
export DOCKER_HOST="unix:///run/docker.sock"


# Added by ProtonUp-Qt on 31-10-2023 01:10:30
if [ -d "/home/thomas/stl/prefix" ]; then export PATH="$PATH:/home/thomas/stl/prefix"; fi
