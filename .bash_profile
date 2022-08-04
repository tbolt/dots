# Shh macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# Aliases
alias ll='ls -latr'
alias dockerbad='docker system prune -a --volumes'
alias cleards="find . -name '.DS_Store' -type f -delete"
 
 # Load bash prompt style
[[ -f "$HOME/.bash_prompt" ]] && . "$HOME/.bash_prompt"

# Load git autocomplete
[[ -f "$HOME/.git-completion.bash" ]] && . "$HOME/.git-completion.bash"

# Initialize
cd ~/Developer
PROMPT_COMMAND="tab_title ; $PROMPT_COMMAND"

# Set the terminal tab title to current directory
function tab_title {
	echo -n -e "\033]0;${PWD##*/}\007"
}

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"	# This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"	# This loads nvm bash_completion

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"