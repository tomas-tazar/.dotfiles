neofetch

autoload -U colors && colors

PS1='%F{white}%@ %F{gray}%n %F{green}%m%f %F{blue}%~%f %# '

function check_sudo {
  if [[ -n "$SUDO_USER" ]] || (( EUID == 0 )); then
    PS1='%F{bright-red}%B%@ %F{bright-yellow}%n@%m%f %F{bright-magenta}%~%f %# %b'
  else
    PS1='%F{white}%@ %F{gray}%n %F{green}%m%f %F{blue}%~%f %# '
  fi
}

precmd() {
  check_sudo
}

PROMPT_COMMAND='check_sudo'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias cls="clear"
alias top="htop"

alias gemma="ollama run gemma2:27b"
alias gemmastop="ollama stop gemma2:27b"

alias py="python3"
alias pip="python3 -m pip"

alias zshrc="code ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias zshupdate="curl https://raw.githubusercontent.com/Taztom/dotfiles/master/.zshrc > ~/.zshrc && source ~/.zshrc"
alias zprofile="code ~/.zprofile"

alias activate="pyenv activate"

alias initaichat="docker run -p 3000:8080 --name open_webui -d sha256:b2f994d9861c1cc5d25cc97a06da6579e0910d0f6136497ad4cbe94e0eaf6301 && open http://localhost:3000"
alias aichat="docker start open_webui && open http://localhost:3000"
alias stopaichat="docker stop open_webui"
alias deleteaichat="docker rm open_webui"
alias open="open -a 'Firefox'"

alias gpu="sudo asitop"