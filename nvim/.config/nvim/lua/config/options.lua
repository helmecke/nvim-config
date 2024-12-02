-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬"
opt.laststatus = 2
opt.pumblend = 0
opt.showbreak = "> "
opt.wrap = true
opt.foldcolumn = "1"
opt.cursorline = true
