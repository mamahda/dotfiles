-- Semua keymap ada di file ini.
-- Keymap plugin tetap lazy-load karena:
--   * `require("plugin")` otomatis me-load plugin lewat lazy.nvim
--   * `<cmd>Command<cr>` me-load plugin yang punya `cmd = ...` di spec-nya
local map = vim.keymap.set

-- ============================================================
-- Dasar Navigasi & Editor
-- ============================================================
map("n", "<C-a>", "ggVG", { desc = "Select All" })
map("n", "dw", "diw", { desc = "Delete Word" })
map("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Clear Search Highlight" })

-- Navigasi Window (Alt + hjkl)
map("n", "<A-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<A-l>", "<C-w>l", { desc = "Window Right" })
map("n", "<A-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<A-k>", "<C-w>k", { desc = "Window Up" })

-- Memindah baris (Visual Mode)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up" })

-- System Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank Line to Clipboard" })

-- Terminal Escape
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Fungsi khusus (Clean path/string)
map("n", "<leader>dc", "f/v$di<CR><C-c>", { desc = "Clean Path" })

-- ============================================================
-- Buffer (bufferline + bufdelete)
-- ============================================================
map("n", "<C-t>", "<cmd>enew<CR>", { desc = "New Buffer" })
map("n", "<C-x>", "<cmd>Bdelete<CR>", { desc = "Delete Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })

-- ============================================================
-- File Explorer (nvim-tree & mini.files)
-- ============================================================
map("n", "<C-b>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>ta", function() require("nvim-tree.api").tree.expand_all() end, { desc = "Tree Expand All" })
map("n", "<leader>tc", function() require("nvim-tree.api").tree.collapse_all() end, { desc = "Tree Collapse All" })

-- Keymap di dalam nvim-tree: `+` = jadikan folder sebagai root (ganti <C-]>)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(args)
    local api = require("nvim-tree.api")
    vim.schedule(function() -- tunggu mapping default nvim-tree terpasang
      pcall(vim.keymap.del, "n", "<C-]>", { buffer = args.buf })
      map("n", "+", api.tree.change_root_to_node, { buffer = args.buf, nowait = true, desc = "nvim-tree: CD" })
    end)
  end,
})

-- Pindah cwd (base folder) ke folder file yang sedang dibuka
map("n", "<leader>pc", function()
  local dir = vim.fn.expand("%:p:h")
  vim.fn.chdir(dir)
  vim.notify("cwd: " .. dir)
end, { desc = "Set cwd to File Dir" })

map("n", "<leader>e", function()
  local mf = require("mini.files")
  if not mf.close() then
    mf.open(vim.api.nvim_buf_get_name(0), true)
  end
end, { desc = "Open mini.files" })

map("n", "<leader>E", function()
  local mf = require("mini.files")
  if not mf.close() then
    mf.open(vim.uv.cwd(), true)
  end
end, { desc = "Open mini.files (Root Directory)" })

-- Keymap tambahan di dalam jendela mini.files
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local mf = require("mini.files")
    local buf = args.data.buf_id

    map("n", "<M-c>", function()
      local path = mf.get_fs_entry().path
      vim.fn.setreg("+", path)
      print("Path copied: " .. path)
    end, { buffer = buf, desc = "Copy path" })

    -- Set cwd ke folder yang disorot (kalau file: folder induknya)
    map("n", "g.", function()
      local entry = mf.get_fs_entry()
      if not entry then return vim.notify("Cursor is not on valid entry") end
      local dir = entry.fs_type == "directory" and entry.path or vim.fs.dirname(entry.path)
      vim.fn.chdir(dir)
      vim.notify("cwd: " .. dir)
    end, { buffer = buf, desc = "Set cwd" })

    -- Esc & arrow (selain q / h / l bawaan di minifiles.lua)
    map("n", "<Esc>", mf.close, { buffer = buf, desc = "Close" })
    map("n", "<Right>", mf.go_in, { buffer = buf, desc = "Go in" })
    map("n", "<Left>", function() mf.go_out() mf.trim_right() end, { buffer = buf, desc = "Go out plus" })
  end,
})

-- ============================================================
-- Telescope
-- ============================================================
map("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Find Files" })
map("n", "<C-g>", function() require("telescope.builtin").git_files() end, { desc = "Git Files" })
map("n", "<C-S>", function()
  require("telescope.builtin").live_grep({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Grep in Dir" })
map("n", "<leader>ss", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Symbols" })
map("n", "<leader>pr", function() require("telescope.builtin").resume() end, { desc = "Resume Last Search" })

-- ============================================================
-- Git (fugitive & gitsigns)
-- ============================================================
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git Status (Fugitive)" })
map("n", "<leader>gv", "<cmd>Gdiffsplit<CR>", { desc = "Git Changes Split" })
map("n", "<leader>GB", "<cmd>Git blame<CR>", { desc = "Git Blame" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })

-- ============================================================
-- Copilot
-- ============================================================
map("n", "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Enable Copilot" })
map("n", "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Disable Copilot" })
map("n", "<leader>cs", "<cmd>Copilot status<CR>", { desc = "Status Copilot" })

-- ============================================================
-- Misc (undotree, notify)
-- ============================================================
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>nd", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss All Notifications" })

-- ============================================================
-- LSP (Lspsaga) — hanya aktif di buffer yang punya LSP
-- Rename pakai default Neovim: `grn` (juga gra/grr/gri/grt dari Neovim 0.11+)
-- ============================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(args)
    local function bmap(mode, lhs, rhs, desc)
      map(mode, lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
    end

    bmap("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Doc")
    bmap("n", "<leader>k", vim.lsp.buf.hover, "Hover (native)")
    bmap("n", "gh", "<cmd>Lspsaga finder<CR>", "LSP Finder")
    bmap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Action")
    bmap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Go to Definition")
    bmap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics")
    bmap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")
    bmap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")
    bmap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", "Toggle Outline")

    -- GS (Go Split): buka definisi di split horizontal bagian bawah
    bmap("n", "gs", function()
      vim.cmd("split")
      vim.cmd("wincmd j")
      vim.cmd("Lspsaga goto_definition")
    end, "Go to Definition in Split")
  end,
})
