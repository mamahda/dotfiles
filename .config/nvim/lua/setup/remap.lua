vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', function() vim.cmd('Ex') end)
vim.keymap.set('n', '<leader>dc', "f/v$di<CR><C-c>")

-- init.lua
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- neovim tab
--vim.keymap.set("n", "<A-t>", ":tabnew<CR>")
--vim.keymap.set("n", "<A-w>", ":tabclose<CR>")
--vim.keymap.set("n", "<A-l>", ":tabnext<CR>")
--vim.keymap.set("n", "<A-h>", ":tabprev<CR>")

-- bufferline neovim
vim.keymap.set("n", "<C-t>", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move other window mappings
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")

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
vim.keymap.set("n", "<C-a>", "ggVG")

-- delete word mappings
vim.keymap.set("n", "dw", "diw")

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

-- COPILOT
vim.api.nvim_set_keymap(
  "n",
  "<leader>ce",
  ":Copilot enable<CR>",
  { noremap = true, silent = true, desc = "Enable Copilot" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>cd",
  ":Copilot disable<CR>",
  { noremap = true, silent = true, desc = "Disable Copilot" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>cs",
  ":Copilot status<CR>",
  { noremap = true, silent = true, desc = "Copilot status" }
)

-- lspsaga
-- Hover docs (K seperti VSCode)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Go to definition (gd)
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })

-- Finder: references, definitions (gh)
vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })

-- Code Action (leader + ca)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename (gr)
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Outline panel (leader + o)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Diagnostic jump
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- LSPSAGA
-- Finder in horizontal split (gs)
vim.keymap.set("n", "gs", function()
  -- Split window horizontal (bawah)
  vim.cmd("split")
  -- Fokus ke window baru lalu jalankan finder
  vim.cmd("wincmd j")
  vim.cmd("Lspsaga goto_definition")
end, { silent = true })

-- Hover docs (K seperti VSCode)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Go to definition (gd)
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })

-- Finder: references, definitions (gh)
vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })

-- Code Action (leader + ca)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename (gr)
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Outline panel (leader + o)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Diagnostic jump
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
