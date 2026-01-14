-- General Neovim settings
-- netrw is settings for file explorer
vim.g.loaded_netrw = 1
-- netrwPlugin is settings for file explorer plugins
vim.g.loaded_netrwPlugin = 1
-- Enable mouse support in all modes
vim.opt.mouse = "a"
-- Set command line height to 0 for a cleaner look
vim.opt.cmdheight = 0
-- Always show the status line
vim.opt.laststatus = 3
-- Enable line numbers
vim.opt.nu = true
-- Enable relative line numbers
vim.opt.relativenumber = true
-- Highlight the current line
vim.opt.cursorline = true
-- set tabs and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- set word wrapping
vim.opt.wrap = true
-- set color support for terminal
vim.opt.termguicolors = true
-- set search settings
vim.opt.incsearch = true
-- set scroll offset to keep context
vim.opt.scrolloff = 8
-- set leader key to space
vim.g.mapleader = " "
-- set font for GUI versions of Neovim
vim.o.guifont = "FiraCode Nerd Font:h14"
