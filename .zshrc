# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="ys"

ZSH_CUSTOM="$HOME/work/home-directory/zsh_custom"
ZSH_THEME="mariano"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(git brew node jsontools npm nvm macos docker)

source $ZSH/oh-my-zsh.sh

# User configuration`export PATH="/Users/mariano/.nvm/v0.10.28/bin:/usr/local/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin"
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




###-tns-completion-start-###
if [ -f /Users/mariano/.tnsrc ]; then 
    source /Users/mariano/.tnsrc 
fi
###-tns-completion-end-###

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/mariano/.nvm/v8.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mariano/.nvm/v8.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/mariano/.nvm/v8.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mariano/.nvm/v8.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# # tabtab source for slss package
# # uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /Users/mariano/.nvm/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/mariano/.nvm/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
export PATH="/usr/local/opt/node@14/bin:$PATH"
alias cx="compass"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/compass compass
export IGNORE_PYTHON_VERSION_REQUIREMENT="1"  ##compass5ea843
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python2.7"  ##compass5ea843

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrewi/bin:$PATH"

# ZSH profiles directory
export ZSH_DIR=~/zsh-profiles
# default to, well, "default"
export ZSH_PROFILE=${${ITERM_PROFILE:=default}:l}
[[ -f "${ZSH_DIR}/.zshrc-${ZSH_PROFILE}" ]] && source "${ZSH_DIR}/.zshrc-${ZSH_PROFILE}"
