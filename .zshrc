clear
neofetch

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

if [[ $TERM = xterm-kitty ]]; then
  kitty + complete setup zsh | source /dev/stdin
fi

setopt auto_cd

# Vi Mode
bindkey -v
export KEYTIMEOUT=5
bindkey "^?" backward-delete-char
bindkey "^[[1~" beginning-of-line    # HOME key (putty)
bindkey "^[[H" beginning-of-line     # HOME key (st / termite)
bindkey "^[[4~" end-of-line          # END key (putty / st)
bindkey "^[[F" end-of-line           # END key (termite)
bindkey "^[[3~" delete-char          # DEL key (putty / termite)
bindkey "^[[P" delete-char           # DEL key (st)
bindkey "^[[5~" beginning-of-line    # PGUP key (putty / st / termite)
bindkey "^[[6~" end-of-line          # PGDN key (putty / st / termite)

# Adds a notification on the right hand side of the prompt when in Normal mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Edit line in vim buffer ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[[2~' edit-command-line    # INS key (putty / termite)
bindkey '^[[4h' edit-command-line    # INS key (st)

# Bindkey's
bindkey '^r' history-incremental-pattern-search-backward
bindkey -s '^h' 'history\n'
bindkey -s '^l' 'clear\n'

# Alias's
alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -algh --group-directories-first'
alias ll='ls -lgh --group-directories-first'
alias reload='. ~/.zshrc'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotss='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status'
alias gs='git status'
alias gl="git log --graph --decorate --all --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(auto)%d%C(reset): ''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
alias gsub='git pull && git submodule update --recursive --remote'

# Source configs
#for f in ~/.config/shellconfig/*; do source "$f"; done

# Load zsh-syntax-highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Syntax highlighting customization
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

#autoload bashcompinit && bashcompinit
#complete -C '/usr/local/bin/aws_completer' aws
source /usr/local/bin/aws_zsh_completer.sh 2>/dev/null

# Configure MY prompt
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_COLOR_SUCCESS=10
SPACESHIP_CHAR_COLOR_FAILURE=9
SPACESHIP_CHAR_COLOR_SECONDARY=11
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX="["
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR=2
SPACESHIP_USER_COLOR_ROOT=1
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_HOST_COLOR=12
SPACESHIP_HOST_COLOR_SSH=12
SPACESHIP_DIR_PREFIX=" "
SPACESHIP_DIR_SUFFIX="] "
SPACESHIP_DIR_TRUNC="0"
SPACESHIP_GIT_BRANCH_COLOR=13

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  exec_time     # Execution time
  line_sep      # Line break
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

