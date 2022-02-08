# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=99999999
SAVEHIST=99999999

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize web-search urltools macports history-substring-search colored-man-pages dircycle sudo encode64 pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

###################################################################################
###################################################################################
# MAC ENV
export PATH="$HOME/bin:$PATH"

###################################################################################
###################################################################################
# PYTHON ENV
export PATH="$HOME/Library/Python/3.8/bin:$HOME/Library/Python/2.7/bin:$PATH"

###################################################################################
###################################################################################
# RUBY ENV
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

####################################################################################
####################################################################################
# Terminal & shell
export EDITOR=vim
setopt extendedglob nonomatch
unsetopt sharehistory
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
autoload -U zmv
bindkey "^K" history-substring-search-up
bindkey "^J" history-substring-search-down
alias cls='printf \\033c'
tabs 4 >/dev/null
[ -f ~/.fzf.zsh ] && { source ~/.fzf.zsh ; export FZF_COMPLETION_TRIGGER='``' ; bindkey "^F" fzf-cd-widget }

####################################################################################
####################################################################################
# Configuration aliases
alias zshconfig="vi ~/.zshrc"
alias zshreload="exec zsh"
alias bspconfig="vi ~/.config/bspwm/bspwmrc"
alias bspreload="~/.config/bspwm/bspwmrc"
alias bspkeys="vi ~/.config/sxhkd/sxhkdrc"
alias viconfig="vi ~/.vimrc.local"

####################################################################################
####################################################################################
# Misc functions & aliases
help() { run-help $1 }
mcd() { mkdir -p $1 && cd $1 }

xo() { local arg; for arg in "$@"; do xdg-open $arg; done }
hd() { hexdump -C $@ }
hdl() { [[ -r $1 ]] && hexdump -C $1 | less }
# gtag() { local repo_base=$(git rev-parse --show-toplevel 2>/dev/null) && [[ -d $repo_base ]] && touch "${repo_base}/.git/tags" }
chex() { python -c "import re, sys; s = re.sub('\\s+','', ''.join(sys.argv[1:])) if len(sys.argv) >= 2 else sys.stdin.read().encode('hex'); sys.stdout.write(''.join('\\\x' + s[i:i+2].upper() for i in range(0, len(s), 2)))" $* }
dis() { [[ -r $1 ]] && { objdump --macho --x86-asm-syntax intel -d $1 | less; }}
asm() { as -arch arm64e -o /dev/stdout <<< "$(echo -e $*)" | objdump -d --macho /dev/stdin }
ida64() { "/Applications/IDA Pro 7.6/ida64.app/Contents/MacOS/ida64" $@ </dev/null &>/dev/null &! }

alias lld="ls -ld"
alias llr="ls -lrt"
alias cat="bat --paging=never -p"
alias diff="colordiff -u"
alias df="df -h"
alias rsync="rsync -Pha"
alias tree="tree -C -h"
alias agg="ag -fuig"
alias rlf="readlink -f"
alias nst="netstat -rn | less"
alias sha="shasum -a256"
keynote_hl() { highlight --font-size 36 --font "Monaco" --style xoria256 --syntax $1 -O rtf | pbcopy }

####################################################################################
####################################################################################
# Program environment
export GCC_COLORS=1
export LESS="-Ri"

####################################################################################
####################################################################################
# Task management
alias t="task"
alias ta="task add"
alias tap="task add pri:H"
alias tal="task add pri:L"
alias tm="task modify"
alias td="task done"
alias tu="task undo"
alias tn="task newest"
alias tj="task annotate"
alias tjd="task denotate"


####################################################################################
####################################################################################
# Work-specific stuff
source ~/.zshrc.work
