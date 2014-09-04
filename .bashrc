export PATH=/usr/local/bin:/usr/local/share/python:$PATH
. /usr/local/bin/virtualenvwrapper.sh

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
