-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
-- Don't sync clipboard with system
opt.clipboard = ""

vim.g.lazyvim_picker = "telescope"

-- disable animations
vim.g.snacks_animate = false

-- no ai auto-complete.
vim.g.ai_cmp = false
