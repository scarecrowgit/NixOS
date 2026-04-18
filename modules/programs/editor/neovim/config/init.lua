-- Set leader keys BEFORE loading plugins (critical!)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load options
require("config.options")

-- Load keymaps
require("config.keymaps")

-- Load autocmds
require("config.autocmds")

-- Bootstrap lazy.nvim and load plugins
require("config.lazy")
