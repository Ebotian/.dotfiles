# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean"

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
zstyle ':omz:update' mode auto # update automatically without asking
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
ENABLE_CORRECTION="true"

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
    zsh-autosuggestions
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################## MY code below ##################

# Proxy auto start
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

# function open proxy
proxyon() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
    echo "HTTP/HTTPS Proxy on"
}
# function close proxy
proxyoff() {
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "HTTP/HTTPS Proxy off"
}

# set alias
#alias fd="fdfind"
alias edge="microsoft-edge-stable 2> /dev/null &"
alias rsed="sed -r"
alias doxyclean="rm -rf doxygen_output"
alias libreoffice="soffice"
alias matlab="/usr/local/MATLAB/R2023b/bin/matlab"

# set function
# function goodbye to shutdown Nicolette
function goodbye() {
    shutdown -h +1
    clear
    local _goodbye_message="Nicolette Always In Your Heart "
    while true; do
    	toilet -t -f mono9 -F crop ${_goodbye_message}|lolcat
	_goodbye_message=${_goodbye_message%?}
	sleep 2
    done
}
# cd and ll
function cdll() {
    cd $1
    ll
}

# office 
function office() {
    soffice $1 2> /dev/null &
}
# doxygen code-graph
doxycodegraph() {
    if [ ! -f Doxyfile_auto_generated ]; then
    # Generate a standard Doxyfile
    doxygen -g Doxyfile_auto_generated
    # Modify the generated Doxyfile to include the desired settings
    sed -i "s|OUTPUT_DIRECTORY *=.*|OUTPUT_DIRECTORY = doxygen_output|g" Doxyfile_auto_generated
    sed -i "s|GENERATE_LATEX *=.*|GENERATE_LATEX = NO|g" Doxyfile_auto_generated
    sed -i "s|EXTRACT_ALL *=.*|EXTRACT_ALL = YES|g" Doxyfile_auto_generated
    sed -i "s|CALLER_GRAPH *=.*|CALLER_GRAPH = YES|g" Doxyfile_auto_generated
    sed -i "s|CALL_GRAPH *=.*|CALL_GRAPH = YES|g" Doxyfile_auto_generated
    fi

    sed -i "s|INPUT *=.*|INPUT = $1|g" Doxyfile_auto_generated

    # Run doxygen using the modified Doxyfile
    doxygen Doxyfile_auto_generated

    # Open the generated HTML documentation in Microsoft Edge in the background and ignore any errors in stdout
    firefox -new-tab doxygen_output/html/index.html &
}


# set nvim
export VISUAL=nvim
export EDITOR=nvim
#export VIM=$HOME/.nvim

# enable vi-mode
# !!!!warning!!!!: this plugin not available now, reason unknown
#source $HOME/.dotfiles/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
#initial sync also not available
#another way to enable vimode
bindkey -v
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec () {
  echo -ne '\e[5 q'
}


# set system language
export LANG=en_US.UTF-8
export GDM_LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8

# set nodejs
VERSION=v18.17.0
DISTRO=linux-x64
export PATH="/usr/local/lib/node-$VERSION-$DISTRO/bin:$PATH"

# set clang+llvm
# export PATH="/usr/local/bin/clang+llvm/bin:$PATH"
export ASAN_OPTIONS=check_initialization_order=1
export UBSAN_OPTIONS=print_stacktrace=1
export LSAN_OPTIONS=verbosity=1:log_threads=1
#export ASAN_SYMBOLIZER_PATH="/usr/local/bin/clang+llvm/bin/llvm-symbolizer"

#neovim and clangd are using modern file config:XDG Base Directory Specification:usually $HOME/.config. look up there to find their config file.

# search through your command history based on the text you have already entered at the prompt
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

##test
pwd
# sync all settings
source "$HOME/.dotfiles/sync.sh"

# little fortune
# fortune|toilet -t -f term -F crop|lolcat -a -t -d 15 -F 0.0001

# path to libreoffice
#export PATH=/opt/libreoffice7.6/program:$PATH

# path to ysyx-workbench/subprojects
export NPC_HOME=/home/yibotian/ysyx-workbench/npc
export NVBOARD_HOME=/home/yibotian/ysyx-workbench/nvboard

#pip script path
export PATH=$PATH:/home/yibotian/.local/bin
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

#hyprland
export WLR_RENDERER_ALLOW_SOFTWARE=1

#texlive
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/local/bin/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/local/bin/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/usr/local/bin/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/local/bin/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
