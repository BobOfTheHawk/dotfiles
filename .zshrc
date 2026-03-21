# ── Silence p10k console warning ──────────────────────────
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Zinit bootstrap ────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ── History ────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# ── Options ────────────────────────────────────────────────
setopt CORRECT

# ── Editor ─────────────────────────────────────────────────
export VISUAL=nvim
export EDITOR=nvim

# ── Prompt: Powerlevel10k ──────────────────────────────────
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Completions ────────────────────────────────────────────
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

# ── Plugins ────────────────────────────────────────────────
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
zinit light hlissner/zsh-autopair

# ── Syntax highlighting (must be last plugin) ──────────────
zinit light zsh-users/zsh-syntax-highlighting

# ── Gruvbox syntax highlight colors ───────────────────────
ZSH_HIGHLIGHT_STYLES[command]='fg=#b8bb26,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#fabd2f'
ZSH_HIGHLIGHT_STYLES[function]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#8ec07c'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#fb4934,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ebdbb2,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#d3869b'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#d3869b'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#665c54,italic'
ZSH_HIGHLIGHT_STYLES[option]='fg=#fabd2f'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#8ec07c'

# ── Yazi ───────────────────────────────────────────────────
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ── Zoxide ─────────────────────────────────────────────────
eval "$(zoxide init zsh)"
alias zi='zoxide query -i'

# ── fzf ────────────────────────────────────────────────────
source <(fzf --zsh)

# ── Atuin ──────────────────────────────────────────────────
export ATUIN_KITTY_KEYBOARD_PROTOCOL=0
eval "$(atuin init zsh)"

# ── Vi mode ────────────────────────────────────────────────
bindkey -v
KEYTIMEOUT=1

# Fix backspace after returning from normal mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Open current command in Neovim with 'v' in normal mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Cursor shape: beam in insert, block in normal
function zle-keymap-select zle-line-init {
  case $KEYMAP in
    vicmd)      print -n '\e[1 q' ;;  # block
    viins|main) print -n '\e[5 q' ;;  # beam
  esac
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init

# ── Keybinds ───────────────────────────────────────────────
# Atuin in both insert and normal mode
bindkey -M viins '^K' _atuin_search_widget
bindkey -M viins '^J' _atuin_search_widget
bindkey -M viins '^[[A' _atuin_search_widget
bindkey -M viins '^[[B' _atuin_search_widget
bindkey -M vicmd '^K' _atuin_search_widget
bindkey -M vicmd '^J' _atuin_search_widget
bindkey -M vicmd '^[[A' _atuin_search_widget
bindkey -M vicmd '^[[B' _atuin_search_widget
bindkey -M viins '^F' autosuggest-accept

# ── Autosuggest style ──────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a89984"

# ── eza (better ls) ────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias l='eza --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --icons --level=2'
alias ll='eza -l --icons --git'

# ── bat (better cat + man pages) ───────────────────────────
alias cat='bat --theme=gruvbox-dark --style=numbers,changes,header'
export MANPAGER="sh -c 'col -bx | bat --theme=gruvbox-dark -l man -p'"

# ── delta (better git diff) ────────────────────────────────
export GIT_PAGER="delta"

# ── fzf file finder ────────────────────────────────────────
alias nf='vim $(fzf --preview "bat --theme=gruvbox-dark --color=always {}")'

# ── Aliases ────────────────────────────────────────────────
alias myip='curl ifconfig.me'
alias ping='ping -c 5'
alias h='history'
alias reload='source ~/.zshrc'
alias f='fastfetch'
alias v='vim'
alias nv='nvim'

# ── PATH ───────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
