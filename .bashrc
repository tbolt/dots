cd ~/Developer
ssh-add -K ~/.ssh/id_rsa &> /dev/null

alias vim="/Applications/MacVim.app/Contents/bin/mvim"
alias love="/Applications/love.app/Contents/MacOS/love"

[[ -f "$HOME/.git-completion.bash" ]] && . "$HOME/.git-completion.bash" # This loads git autocomplete
[[ -f "$HOME/.bash_prompt" ]] && . "$HOME/.bash_prompt"  # This loads bash prompt style

PROMPT_COMMAND="tab_title ; $PROMPT_COMMAND"
function tab_title {
  echo -n -e "\033]0;${PWD##*/}\007"
}

export RAILS_SERVE_STATIC_FILES=true

# Postgres
export PGSQL_HOME=/Applications/Postgres.app/Contents/Versions/9.6
export PATH=${PATH}:${PGSQL_HOME}/bin

# Node version manager
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
export NVM_DIR="/Users/Tbolt/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Custom helpers
function runtests(){
  echo "================RUNNING RSPEC TEST======================="
  rspec -fp
  echo "================RUNNING RUBOCOP TEST====================="
  rubocop -f s
  echo "============RUNNING TEASPOON-JASMINE TEST================"
  RAILS_ENV=test bundle exec teaspoon --coverage=default
  echo "==================RUNNING JSHINT========================="
  rake jshint
}
function checklist(){
  echo "Did you remember to..."
  echo "------------------------------------"
  echo "run all tests"
  echo "version increment"
  echo "update README"
  echo "update CHANGELOG"
  echo "merge develop"
}
function cleards(){
  find . -name '.DS_Store' -type f -delete
}
export -f runtests
export -f cleards
export -f checklist

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
