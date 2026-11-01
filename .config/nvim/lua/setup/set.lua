-- General Neovim settings
-- Leader harus diset sebelum lazy.nvim & keymap dimuat
vim.g.mapleader = " "

-- Matikan netrw (pakai nvim-tree / mini.files)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.timeoutlen = 300 -- Set ke 300ms agar respons jauh lebih instan
-- Enable mouse support in all modes
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:3,hor:6"
-- Set command line height to 0 for a cleaner look
vim.opt.cmdheight = 0
-- Always show the status line
vim.opt.laststatus = 3
-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- Highlight the current line
vim.opt.cursorline = true
-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Word wrapping
vim.opt.wrap = true
-- Color support for terminal
vim.opt.termguicolors = true
-- Search settings
vim.opt.incsearch = true
-- Scroll offset to keep context
vim.opt.scrolloff = 5
-- Font for GUI versions of Neovim
vim.o.guifont = "FiraCode Nerd Font:h14"

-- Tanpa swap file (sudah ada undofile + git)
vim.opt.swapfile = false

-- Simpan riwayat undo ke file
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
