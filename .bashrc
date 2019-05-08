# Aliases
alias vim="/Applications/MacVim.app/Contents/bin/mvim"
alias ll='ls -latr'

[[ -f "$HOME/.bash_prompt" ]] && . "$HOME/.bash_prompt"  # Load bash prompt style
[[ -f "$HOME/.git-completion.bash" ]] && . "$HOME/.git-completion.bash" # Load git autocomplete

# Initialize
cd ~/Developer
PROMPT_COMMAND="tab_title ; $PROMPT_COMMAND"
function tab_title {
  echo -n -e "\033]0;${PWD##*/}\007"
}

# Postgres.app
export PGSQL_HOME=/Applications/Postgres.app/Contents/Versions/11
export PATH=${PATH}:${PGSQL_HOME}/bin

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pyenv version manager
export PATH="/Users/tbolt/.pyenv:$PATH"
eval "$(pyenv init -)"

# Ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Go path
export GOPATH=$HOME/Developer/go

function cleards(){
  find . -name '.DS_Store' -type f -delete
}
export -f cleards