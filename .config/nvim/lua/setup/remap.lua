vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', function() vim.cmd('Ex') end)

vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- neovim tab
--vim.keymap.set("n", "<A-t>", ":tabnew<CR>")
--vim.keymap.set("n", "<A-w>", ":tabclose<CR>")
--vim.keymap.set("n", "<A-l>", ":tabnext<CR>")
--vim.keymap.set("n", "<A-h>", ":tabprev<CR>")

-- bufferline neovim
vim.keymap.set("n", "<A-t>", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-w>", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move other window mappings
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- nvim-tree mappings 
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeFindFileToggle)

-- undotree mappings
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- buffer mappings
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

-- LSP mappings 
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

-- select all mappings
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- delete word mappings
vim.keymap.set("n", "dw", "bved")

-- vim test mappings
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true })

-- gitsigns mappings
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- fugitive mappings
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
