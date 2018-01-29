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
export PATH="$HOME/Library/Python/2.7/bin:/usr/local/bin:$PATH"

###################################################################################
###################################################################################
# RUBY ENV
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

####################################################################################
####################################################################################
# Terminal & shell
{source /etc/profile.d/vte.sh && __vte_osc7} 2>/dev/null
#source /etc/zsh_command_not_found
#export TERM=xterm
export EDITOR=vim
setopt extendedglob nonomatch
unsetopt sharehistory
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
bindkey "^K" history-substring-search-up
bindkey "^J" history-substring-search-down
alias cls='printf \\033c'
tabs 4 >/dev/null

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
ida32() {"/Applications/IDA Pro 7.0/ida64.app/Contents/MacOS/ida" $@ >/dev/null 2>&1 &; disown }
ida64() {"/Applications/IDA Pro 7.0/ida64.app/Contents/MacOS/ida64" $@ >/dev/null 2>&1 &; disown }

xo() { local arg; for arg in "$@"; do xdg-open $arg; done }
pylab() { ipython qtconsole --pylab=inline }
bindiff() { [[ -r $1 && -r $2  ]] && vimdiff <(hd $1) <(hd $2) }
binmeld() { [[ -r $1 && -r $2  ]] && meld <(hd $1) <(hd $2) }
hd() { hexdump -C $@ }
hdl() { [[ -r $1 ]] && hexdump -C $1 | less }
gtag() { local repo_base=$(git rev-parse --show-toplevel 2>/dev/null) && [[ -d $repo_base ]] && touch "${repo_base}/.git/tags" }
chex() { python -c "import re, sys; s = re.sub('\\s+','', ''.join(sys.argv[1:])) ; sys.stdout.write(''.join('\\\x' + s[i:i+2].upper() for i in range(0, len(s), 2)))" $* }
alias clrz="colorize"
alias diff="colordiff -u"
alias df="df -h"
alias tree="tree -C --du -h"
alias agg="ag -fuig"
alias rlf="readlink -f"
alias hexfiend="'/Applications/Hex Fiend.app/Contents/MacOS/Hex Fiend'"
keynote_hl() { highlight --font-size 36 --font "Monaco" --style xoria256 --syntax $1 -O rtf | pbcopy }

####################################################################################
####################################################################################
# Program environment
export GCC_COLORS=1
export LESS="-Ri"

####################################################################################
####################################################################################
# iOS stuff
alias csident="security find-identity -p codesigning -v"
alias pluto="plistutil -i"
function udid() { for udid in $(idevice_id -l); do echo -e "\n$udid"; ideviceinfo -u $udid | ag --nocolor "Version|ProductType"; done }
function thin64() { lipo -thin arm64 $1 -o $2 }
function symbolicatecrash() { DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer /Applications/Xcode-beta.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/Current/Resources/symbolicatecrash  $1 }
