# ~/.oh-my-zsh/custom/secrets.zsh
_load_secrets() {
  export LINEAR_API_KEY="$(op read "op://Employee/Linear/api-key" 2>/dev/null)"
  # export NOTION_API_KEY="$(op read "op://Private/Notion API Key/credential" 2>/dev/null)"
}

# if op account list &>/dev/null 2>&1; then
#   _load_secrets
# fi

alias load-secrets='_load_secrets && echo "Secrets loaded ✓"'
