export ZDOTDIR=~/.zsh

# devbox
eval "$(devbox global shellenv --init-hook)"
export DEVBOX_NO_PROMPT=true

# exports
export PATH="/usr/bin:/usr/local/bin:$PATH"
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export EDITOR="nvim"
# export LESS="-RFX"

# zsh-defer
source $HOME/.config/zsh/zsh-defer/zsh-defer.plugin.zsh

# oh my zsh
export OH_MY_ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-autosuggestions
  zsh-shift-select
  you-should-use
  zsh-syntax-highlighting
  # zsh-vi-mode
)
source $OH_MY_ZSH/oh-my-zsh.sh
autoload -Uz compinit
compinit

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"
eval "$(starship init zsh)"

# zoxide
zsh-defer eval "$(zoxide init --cmd cd zsh)"

# # vim mode
# ZVM_CURSOR_STYLE_ENABLED=false
# ZVM_SYSTEM_CLIPBOARD_ENABLED=true
# ZVM_CLIPBOARD_COPY_CMD='clip.exe'
# ZVM_CLIPBOARD_PASTE_CMD='powershell.exe -NoProfile -Command Get-Clipboard'
# zvm_after_init_commands+=(
#   "bindkey '^H' backward-kill-word"
#   "bindkey '^[[3;5~' kill-word"
# )

# fzf
FZF_FD_OPTS="--hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="--layout=default"
export FZF_DEFAULT_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_CTRL_T_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_ALT_C_COMMAND="fd --type d ${FZF_FD_OPTS}"
_fzf_compgen_path() {
    fdfind ${FZF_FD_OPTS} . "${1}"
}
_fzf_compgen_dir() {
    fdfind --type d ${FZF_FD_OPTS} . "${1}"
}
source $HOME/.config/zsh/fzf/key-bindings.zsh
source $HOME/.config/zsh/fzf/completion.zsh

# direnv
export DIRENV_LOG_FORMAT=""
zsh-defer eval "$(direnv hook zsh)"

# unbind Ctrl + s
bindkey -r '^S'

# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export GALLIUM_DRIVER=d3d12
export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA

# utils
for file in $HOME/.config/zsh/utils/*.zsh; do
    source $file
done
