-- Set leader keys BEFORE loading plugins (critical!)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw (using neo-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load options
require("config.options")

-- Load keymaps
require("config.keymaps")

-- Load autocmds
require("config.autocmds")

-- Bootstrap lazy.nvim and load plugins
require("config.lazy")
