-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Note: Leader keys are set in init.lua BEFORE this file loads

-- Enable line wrapping
vim.opt.wrap = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Folding
vim.opt.foldmethod = "manual"

-- System clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard (Linux/Wayland)

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Scrolloff
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
