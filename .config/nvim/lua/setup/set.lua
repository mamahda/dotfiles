-- General Neovim settings
-- set leader key to space
vim.g.mapleader = " "
-- netrw is settings for file explorer
vim.g.loaded_netrw = 1
-- lua/setup/set.lua
vim.opt.timeoutlen = 300 -- Set ke 300ms agar respons jauh lebih instan
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
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- set word wrapping
vim.opt.wrap = true
-- set color support for terminal
vim.opt.termguicolors = true
-- set search settings
vim.opt.incsearch = true
-- set scroll offset to keep context
vim.opt.scrolloff = 5
-- set font for GUI versions of Neovim
vim.o.guifont = "FiraCode Nerd Font:h14"

vim.opt.mousescroll = "ver:3,hor:6"

-- Simpan riwayat undo ke file
vim.opt.undofile = true

-- Tentukan folder penyimpanannya (opsional, agar tidak mengotori folder project)
local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]]) -- Hapus semua spasi di akhir baris
    vim.fn.setpos(".", save_cursor)
  end,
})
