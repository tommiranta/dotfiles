ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

autoload -Uz compinit && compinit

# Created by `pipx` on 2021-12-11 09:34:37
export PATH="$PATH:/Users/tranta/.local/bin"
autoload -U bashcompinit
bashcompinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/terraform@0.13/bin:$PATH"
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
export PATH="~/Library/Application Support/Coursier/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# aliases
alias gplm='git pull leadfeeder master'
alias curl='noglob curl'

# ruby
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.2
