ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

autoload -Uz compinit && compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

# pipx
export PATH="$PATH:/Users/tranta/.local/bin"
autoload -U bashcompinit
bashcompinit

# aliases
alias curl='noglob curl'
alias python=python3

# ruby
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# tenv
export TENV_AUTO_INSTALL=true
export TF_PLUGIN_CACHE_DIR=~/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=true

# 1Password completion
eval "$(op completion zsh)"; compdef _op op

# Fix resolving the main branch
function git_main_branch() {
  def=`git remote show origin | sed -n '/HEAD branch/s/.*: //p'`
  echo $def
}
#
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tranta/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
