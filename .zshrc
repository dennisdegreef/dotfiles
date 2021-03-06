# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/vendor/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"

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
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

powerline_binding="/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"
if [ -f ${powerline_binding} ];
then
	source $powerline_binding;
fi;

if [ -x "$(command -v brew)" ];
then
	source "$(brew --prefix)/etc/profile.d/z.sh"
fi


# GPG configuration
# Check for the gpg-agent socket, and set SSH_AUTH_SOCK and GPG_TTY
# environment variables accordingly:
if ! pgrep gpg-agent >/dev/null; then
	gpg-agent \
		-v \
		--daemon \
		--enable-ssh-support \
		--log-file $HOME/.gnupg/gpg-agent.log \
		--write-env-file=$HOME/.gnupg/gpg-agent-info.env
fi

if [[ -S "${HOME}/.gnupg/S.gpg-agent.ssh" ]]; then
    export GPG_TTY=$(tty)
    export GPG_TTY
    if [[ ${SSH_AUTH_SOCK} != "${HOME}/.gnupg/S.gpg-agent.ssh" ]]; then
        export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
    fi
    if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
    fi
fi

#: ${GNUPGHOME=$HOME/.gnupg}
#GPG_AGENT_INFO=${GNUPGHOME}/S.gpg-agent:0:1;
#export GPG_AGENT_INFO;
#SSH_AUTH_SOCK=${GNUPGHOME}/S.gpg-agent.ssh

alias gpg=gpg2
