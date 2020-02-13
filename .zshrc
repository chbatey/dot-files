# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
# Syntax highlighting must be the last
plugins=(git docker tmux zsh-autosuggestions zsh-syntax-highlighting)

export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/.local/bin:$HOME/bin:$HOME/.local/bin:$HOME/bin"

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:~/apps/bin/

# Emacs
path+=('$HOME/.emacs.d/bin/')

# Python on Mac

path+=('$HOME/Library/Python/3.7/bin/')

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go/
export GO111MODULE=auto
export PATH=$PATH:$GOPATH/bin/

# Vim sttings
bindkey -v
export KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode

# Preserve shortcuts removed by using vim mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^A' beginning-of-line-hist
bindkey '^E' end-of-line-hist
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# NORMAL mode prompt for vim
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
alias info="info --vi-keys"

# Linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"

# Java
export PATH=$PATH:~/dev/os/perf/perf-map-agent/bin/:~/dev/os/perf/async-profiler:~/apps/visualvm/bin/
export FLAMEGRAPH_DIR=~/dev/os/perf/FlameGraph/
export SBT_OPTS="-Xms512M -Xmx2048M -Xss2M -XX:MaxMetaspaceSize=1024M -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCI -XX:+UseJVMCICompiler"
# May need built / version updated
alias jsk="java -jar $HOME/dev/os/perf/jvm-tools/sjk-plus/target/sjk-plus-0.11-SNAPSHOT.jar"

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh" && jabba use adopt@~1.11.0-6
export JDK_8_HOME="$HOME/.jabba/jdk/adopt@1.8.0-232/Contents/Home/"

alias xclip="xclip -selection c"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/protobuf@2.5/bin:$PATH"

# Gatling
PATH="/opt/gatling/bin/:$PATH"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# This is slow so disable
#if [ $HOME/apps/bin/kubectl ]; then source <(kubectl completion zsh); fi

# different locations for mac/linux
[ -f /usr/share/autojump/autojump.zsh ] && source /usr/share/autojump/autojump.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Erlang
PATH=$HOME/.cache/rebar3/bin:$PATH

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
[ -s "$HOME/.rbenv/" ] && eval "$(rbenv init -)"

[ -s "/Users/christopherbatey/.scm_breeze/scm_breeze.sh" ] && source "/Users/christopherbatey/.scm_breeze/scm_breeze.sh"
export JDK_8_HOME=/Users/christopherbatey/.jabba/jdk/adopt@1.8.0-232/Contents/Home/

# Alactritty themes
function dark() {
  alacritty-colorscheme -C ~/.eendroroy-alacritty-theme/themes  -t solarized_dark.yaml
}
function light() {
  alacritty-colorscheme -C ~/.eendroroy-alacritty-theme/themes  -t solarized_light.yaml
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "/Users/christopherbatey/.scm_breeze/scm_breeze.sh" ] && source "/Users/christopherbatey/.scm_breeze/scm_breeze.sh"

#FIXME make it work for linux
export JDK_8_HOME=/Users/christopherbatey/.jabba/jdk/adopt@1.8.0-232/Contents/Home/
