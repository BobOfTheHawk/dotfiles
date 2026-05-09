# dotfiles

My personal configuration files for Arch Linux.

## System

| Component       | Tool                                    |
|-----------------|-----------------------------------------|
| OS              | Arch Linux                              |
| WM              | Hyprland                                |
| Terminal        | Kitty                                   |
| Shell           | Zsh (Zinit + Powerlevel10k)             |
| Editor          | Neovim                                  |
| File Manager    | Yazi                                    |
| Font            | JetBrainsMono Nerd Font                 |
| Theme           | Gruvbox Dark                            |
| Notifications   | swaync                                  |
| Fetch           | fastfetch + pokemon-colorscripts        |

## Shell

Plugin manager: **Zinit**

| Plugin                          | Purpose                              |
|---------------------------------|--------------------------------------|
| zsh-autosuggestions             | Fish-style inline suggestions        |
| zsh-syntax-highlighting         | Command syntax coloring (Gruvbox)    |
| zsh-history-substring-search    | Search history by substring          |
| fzf-tab                         | fzf-powered tab completion           |
| zsh-you-should-use              | Reminds you to use your aliases      |
| zsh-autopair                    | Auto-close brackets and quotes       |

### Key aliases

```zsh
l    # eza with icons
la   # eza long + hidden + git status
lt   # eza tree (level 2) + git status
lta  # eza tree + hidden files, no clutter
ll   # eza long + git status
cat  # bat with gruvbox theme
v    # vim
nv   # nvim
nf   # fzf file picker → open in vim
f    # fastfetch
zi   # zoxide interactive
```

### fzf functions

| Function | Does                                    |
|----------|-----------------------------------------|
| `fcd`    | Fuzzy cd into any directory             |
| `ff`     | Fuzzy find file → open in nvim          |
| `fh`     | Fuzzy search shell history              |
| `fcat`   | Fuzzy find file → bat preview           |
| `fkill`  | Fuzzy kill process                      |
| `fgit`   | Fuzzy git branch checkout               |
| `fpurge` | Fuzzy pacman package remove             |
| `fins`   | Fuzzy pacman package install            |
| `fstop`  | Fuzzy systemctl service stop            |
| `fcopy`  | Fuzzy find file → copy to clipboard     |

## Neovim

Plugin manager: **Lazy.nvim**

| Plugin             | Purpose                            |
|--------------------|------------------------------------|
| gruvbox.nvim       | Colorscheme                        |
| telescope.nvim     | Fuzzy finder                       |
| harpoon            | File bookmarks                     |
| nvim-tree          | File explorer                      |
| oil.nvim           | File manager as buffer             |
| nvim-lspconfig     | LSP client                         |
| mason.nvim         | LSP/linter installer               |
| nvim-cmp           | Autocompletion                     |
| treesitter         | Syntax highlighting & parsing      |
| lualine.nvim       | Status line                        |
| noice.nvim         | UI overhaul (cmdline, messages)    |
| snacks.nvim        | Collection of QoL utilities        |
| trouble.nvim       | Diagnostics list                   |
| undotree           | Visual undo history                |
| todo-comments      | Highlight TODO/FIX/NOTE comments   |
| render-markdown    | Rendered markdown in buffer        |
| gitsigns + fugitive| Git integration                    |
| conform.nvim       | Auto formatting                    |
| nvim-lint          | Linting                            |
| auto-session       | Session management                 |
| surround.nvim      | Surround text objects              |
| nvim-ufo           | Code folding                       |
| emmet              | HTML/CSS expansion                 |

## CLI Tools

| Tool                 | Purpose                                      |
|----------------------|----------------------------------------------|
| eza                  | Modern `ls` with icons and git status        |
| bat                  | Modern `cat` with syntax highlighting        |
| fzf                  | Fuzzy finder                                 |
| zoxide               | Smarter `cd` with frecency                   |
| atuin                | Shell history with sync + search             |
| delta                | Better `git diff`                            |
| yazi                 | Terminal file manager                        |
| fastfetch            | System info fetch                            |
| pokemon-colorscripts | Pokémon sprites in terminal                  |
| btop                 | Resource monitor                             |

## Structure

```
dotfiles/
├── .config/
│   ├── fastfetch/     # fastfetch config + pokemon layout
│   ├── kitty/         # kitty terminal config + gruvbox theme
│   ├── nvim/          # neovim config (lazy.nvim)
│   ├── yazi/          # yazi file manager + gruvbox flavor
│   └── zed/           # zed editor settings
├── hypr/
│   ├── hyprlock.conf  # lock screen config
│   └── swaync/        # notification center config + icons
├── .zshrc             # zsh config
├── .p10k.zsh          # powerlevel10k prompt config
└── .vimrc             # vim config
```

## Installation

Clone the repo and symlink or copy configs to their respective locations:

```bash
git clone https://github.com/BobOfTheHawk/dotfiles.git
cd dotfiles

# example: symlink zshrc
ln -sf $(pwd)/.zshrc ~/.zshrc

# example: symlink nvim config
ln -sf $(pwd)/.config/nvim ~/.config/nvim
```

> Make sure required tools are installed before sourcing the shell config.
