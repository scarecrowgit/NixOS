# Modern Neovim Configuration

A modern Neovim configuration with yazi integration, custom Ghostty color theme, and mainstream plugins.

## Features

### Core
- **Lazy.nvim** - Modern plugin manager with lazy loading
- **Mason** - Manage LSP servers, linters, and formatters
- **Clean architecture** - Well-organized configuration structure

### File Management
- **Yazi** - Blazing fast terminal file manager integration
  - `<leader>e` - Open yazi at current file
  - `<leader>E` - Open yazi at current working directory
- **Neo-tree** - Modern file explorer
  - `<leader>fe` - Toggle file explorer

### UI Enhancements
- **Ghostty Theme** - Custom colorscheme matching your Ghostty terminal (One Dark Pro Monokai Darker)
  - Perfect color harmony between terminal and editor
  - See `lua/ghostty-theme/README.md` for details
- **Catppuccin/Tokyo Night** - Alternative beautiful colorschemes
- **Noice** - Better UI for messages, cmdline, and popups
- **Alpha** - Customizable dashboard
- **Bufferline** - Better buffer line with tabs
- **Lualine** - Fast and customizable statusline with custom Ghostty theme
- **Notify** - Notification manager
- **Indent-blankline** - Indentation guides
- **Which-key** - Keybinding helper

### Code Intelligence
- **LSP** - Language Server Protocol support
  - Lua, TypeScript, Python, Go, Rust pre-configured
- **Treesitter** - Better syntax highlighting and code understanding
- **nvim-cmp** - Auto-completion with multiple sources
- **LuaSnip** - Snippet engine

### Editing
- **Auto-pairs** - Automatic bracket/quote pairing
- **Mini.surround** - Surround text objects (sa/sd/sr)
- **Comment.nvim** - Smart commenting with context awareness
- **Better-escape** - Fast escape from insert mode with jj/jk
- **Flash** - Enhanced motion plugin for quick navigation

### Formatting & Linting
- **Conform** - Modern formatter with format-on-save
  - Supports: Lua, Python, JS/TS, JSON, YAML, Markdown, Go, Rust
  - `<leader>cf` - Format buffer

### Git Integration
- **Gitsigns** - Git signs and hunk management
  - `]h` / `[h` - Next/prev hunk
  - `<leader>gh*` - Git hunk operations

### Utilities
- **Telescope** - Fuzzy finder
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - Buffers
  - `<leader>fr` - Recent files
- **Todo-comments** - Highlight and search TODO comments
- **Trouble** - Better diagnostics list
- **Persistence** - Session management
- **Toggleterm** - Terminal integration
  - `<C-\>` - Toggle terminal
  - `<leader>tf/th/tv` - Float/Horizontal/Vertical terminal

## Key Bindings

### General
- `<Space>` - Leader key
- `jj` / `jk` - Exit insert mode
- `<C-s>` - Save file
- `<Esc>` - Clear search highlighting

### Window Navigation
- `<C-h/j/k/l>` - Move between windows
- `<C-Up/Down/Left/Right>` - Resize windows

### Buffer Management
- `[b` / `]b` - Previous/Next buffer
- `<leader>bd` - Delete buffer
- `<leader>bp` - Toggle pin buffer

### Code Navigation
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `[d` / `]d` - Previous/Next diagnostic

### Visual Mode
- `J` / `K` - Move selection down/up
- `<` / `>` - Indent left/right (stays in visual mode)

## Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Create symlink to this configuration:
   ```bash
   ln -s ~/terminal/nvim ~/.config/nvim
   ```

3. Install yazi (if not already installed):
   ```bash
   # macOS
   brew install yazi

   # Or check https://github.com/sxyazi/yazi for other platforms
   ```

4. Open Neovim and let plugins install:
   ```bash
   nvim
   ```

5. Wait for all plugins to install (Lazy.nvim will show progress)

6. Restart Neovim to complete setup

## Post-Installation

### Install Language Servers

Open Mason with `:Mason` and install LSP servers you need, or they'll be auto-installed on first use:
- `lua_ls` - Lua
- `tsserver` - TypeScript/JavaScript
- `pyright` - Python
- `gopls` - Go
- `rust_analyzer` - Rust

### Install Formatters

These will be auto-installed via Mason:
- `stylua` - Lua formatter
- `prettier` / `prettierd` - JS/TS/JSON/YAML/Markdown
- `black` / `isort` - Python
- `gofumpt` / `goimports` - Go
- `shfmt` - Shell scripts

## Customization

### Change Colorscheme

The default colorscheme is **ghostty**, which matches your terminal colors perfectly.

To switch to a different theme, edit `nvim/lua/plugins/colorscheme.lua` and change the config:
```lua
{
  "ghostty-theme",
  dir = vim.fn.stdpath("config") .. "/lua/ghostty-theme",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("ghostty") -- change to "catppuccin" or "tokyonight"
  end,
}
```

Or switch temporarily in Neovim:
- `:colorscheme ghostty` - Custom Ghostty theme
- `:colorscheme catppuccin` - Catppuccin Mocha
- `:colorscheme tokyonight` - Tokyo Night

### Add Your Own Plugins

Create a new file in `nvim/lua/plugins/` directory:
```lua
-- nvim/lua/plugins/myplugin.lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  },
}
```

### Modify Keybindings

Edit `nvim/lua/config/keymaps.lua` to add or change keybindings.

### Adjust Options

Edit `nvim/lua/config/options.lua` to modify Neovim settings.

## Directory Structure

```
nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Lazy.nvim setup
│   │   ├── options.lua        # Neovim options
│   │   ├── keymaps.lua        # Keybindings
│   │   └── autocmds.lua       # Auto commands
│   └── plugins/
│       ├── yazi.lua           # Yazi file manager
│       ├── colorscheme.lua    # Color schemes
│       ├── telescope.lua      # Fuzzy finder
│       ├── treesitter.lua     # Syntax highlighting
│       ├── lsp.lua            # LSP configuration
│       ├── completion.lua     # Auto-completion
│       ├── conform.lua        # Code formatting
│       ├── gitsigns.lua       # Git integration
│       ├── neotree.lua        # File explorer
│       ├── ui.lua             # UI enhancements
│       ├── mini.lua           # Mini.nvim modules
│       ├── whichkey.lua       # Keybinding help
│       ├── noice.lua          # Better UI
│       ├── persistence.lua    # Session management
│       ├── indent.lua         # Indent guides
│       ├── autopairs.lua      # Auto pairs
│       ├── comment.lua        # Smart comments
│       └── extras.lua         # Additional plugins
└── README.md                  # This file
```

## Troubleshooting

### Plugins not loading
Run `:Lazy sync` to update all plugins.

### LSP not working
1. Check if the LSP server is installed: `:LspInfo`
2. Install missing servers: `:Mason`

### Yazi not opening
Make sure yazi is installed: `yazi --version`

### Format on save not working
Check conform configuration and ensure formatters are installed via Mason.

## Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Yazi](https://github.com/sxyazi/yazi)
- [Neovim Documentation](https://neovim.io/doc/)

## Credits

Configuration inspired by:
- LazyVim starter template
- Example configuration from popular YouTuber
