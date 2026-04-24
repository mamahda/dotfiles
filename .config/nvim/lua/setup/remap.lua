vim.g.mapleader = " "

-- Dasar Navigasi & Editor
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })
vim.keymap.set("n", "dw", "diw", { desc = "Delete Word" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- Navigasi Window (Alt + hjkl)
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")

-- Memindah baris (Visual Mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- System Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Terminal Escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Fungsi khusus (Clean path/string)
vim.keymap.set("n", "<leader>dc", "f/v$di<CR><C-c>")

-- Untuk nvim-tree (leader pv tetap bisa dipakai sebagai alternatif C-b)
vim.keymap.set('n', '<leader>pv', ":NvimTreeToggle<CR>")

-- Git Keymap
vim.keymap.set('n', '<leader>GB', ':Git blame<CR>')
