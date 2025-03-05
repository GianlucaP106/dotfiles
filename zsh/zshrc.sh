###############################
######### OHMYZSH #############
###############################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="cypher"
# ZSH_THEME="frontcube"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
###############################
######### OHMYZSH END #########
###############################

# set vi mode
set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

# git aliases
alias gp="git push"
alias gcm="git commit -m"
alias gaa="git add --all"
alias ga="git add"
alias gm="git merge"
alias gco="git checkout"
alias gb="git branch"
alias gst="git status"
alias gl="git pull"
alias grs="git restore"
alias grss="git restore --staged"
alias gfa="git fetch --all --prune"
alias glp="git log --graph --oneline --decorate"
alias gr="git reset"
alias grh="git reset --hard"
alias grso="git reset --soft"
alias gs="git stash"
alias grb="git rebase"
alias glpa="git log --graph --oneline --decorate --all"
alias gpus="git push --set-upstream origin"

alias lg="lazygit"
alias py="python"
alias nrd="npm run dev"
alias nr='npm run'
alias kc="kubectl"
alias mk="minikube"
alias dk="docker"
alias dkcu="docker compose up"
alias dkc="docker compose"
alias wbst="webstorm"
alias q="exit"
alias hollywood="dk run --rm -it bcbcarl/hollywood"
alias genstr="openssl rand -base64"
alias local-psql="psql -h localhost -p 5432 -U postgres -d"
alias l="ls -alh"
alias viewpath="echo $PATH | tr ':' '\n' | xargs -I{} find {} -type f -perm +111 2>/dev/null"
alias cl="clear"
alias v="nvim"
alias v.="v ."
alias m="mynav"
alias tm="tmux"
alias ports="lsof -nP -iTCP -sTCP:LISTEN"
alias uuid="echo $(uuidgen | tr '[:upper:]' '[:lower:]')"
alias dumptcp="ncat --keep-open --recv-only -l"

alias start-db="docker compose -p start-db -f <(echo '
services:
  db:
    image: postgres:alpine
    environment:
      POSTGRES_PASSWORD: admin
      POSTGRES_DB: db
    ports:
      - "5432:5432"
  adminer:
    image: adminer
    restart: always
    ports:
      - "8081:8080"
') up"
alias stop-db="docker compose -p start-db down"

# fzf
source <(fzf --zsh)

# gpt4all cli
alias lllm="python ~/mynav/personal/gpt4all-cli/gpt4all-cli.py --model ~/mynav/personal/gpt4all-cli/models/phi-4-fp16.gguf"
alias llm="python ~/mynav/personal/gpt4all-cli/gpt4all-cli.py --model ~/mynav/personal/gpt4all-cli/models/Nous-Hermes-2-Mistral-7B-DPO.Q4_0.gguf"

git_prompt_info2() {
    local s="" branch=""

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        [[ -n "$(git status -s 2>/dev/null)" ]] && s="*"
        branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        echo " ${branch}${s}"
    fi
}

# shell prompt
PROMPT=$'%{\e[1m%}%{%F{#7db6ff}%}%T %{%f%F{#c7c7c7}%}%3~ %{%f%F{#e6e6ff}%}$(git_prompt_info2)%{%f%}\n::: %{%F{#b3f971}%}%{%G»%}%{%f\e[0m%} '

# mypass
export PATH="$PATH:$HOME/.mypass"
# mynav
export PATH="$PATH:$HOME/.mynav"
# tmuxman
export PATH="$PATH:$HOME/.tmuxman"
# termcraft
export PATH="$PATH:$HOME/.termcraft/"
#mysql
export PATH="/opt/homebrew/opt/mysql/bin:$PATH"
