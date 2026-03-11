ZVM_VI_SURROUND_BINDKEY=s-prefix
ZVM_VI_INSERT_ESCAPE_BINDKEY="jk"

# Antidote
_antidote_dir="${ZDOTDIR:-~}/.antidote"
if [[ ! -d "$_antidote_dir" ]]; then
  if command -v git &>/dev/null; then
    echo "Bootstrapping antidote plugin manager..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$_antidote_dir"
  else
    echo "warning: 'git' not found — cannot bootstrap antidote. See README."
  fi
fi

if [[ -f "$_antidote_dir/antidote.zsh" ]]; then
  source "$_antidote_dir/antidote.zsh"
  antidote load "${0:a:h}/.zsh_plugins.txt"
else
  echo "warning: antidote not found at '$_antidote_dir'. See README."
fi
unset _antidote_dir

# starship
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  echo "warning: 'starship' not found. See README for installation."
fi

# bat
if command -v bat &>/dev/null; then
  alias cat="bat -pp"
else
  echo "warning: 'bat' not found. See README for installation."
fi

# zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
else
  echo "warning: 'zoxide' not found. See README for installation."
fi

# eza
if command -v eza &>/dev/null; then
  alias ls="eza"
else
  echo "warning: 'eza' not found. See README for installation."
fi
