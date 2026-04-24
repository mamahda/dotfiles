return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        code_action = "[?]",
        -- code_action = "💡",
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      outline = {
        layout = "right",
        win_width = 40,
      },
    })

    -- ========= Keymaps =========
    local keymap = vim.keymap.set

    -- LSP Finder
    keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true, desc = "LSP Finder" })

    -- Code Action
    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Code Action" })

    -- Rename
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename" })

    -- Peek/Go to Definition
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, desc = "Go to Definition" })

    -- Show line diagnostics
    keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, desc = "Line Diagnostics" })

    -- Diagnostic jump
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

    -- Outline
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true, desc = "Toggle Outline" })

    -- Hover Doc (K standar VSCode/LSP)
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

    -- Keymap Kustom: GS (Go Split)
    -- Membuka definisi di split horizontal bagian bawah
    keymap("n", "gs", function()
      vim.cmd("split")
      vim.cmd("wincmd j")
      vim.cmd("Lspsaga goto_definition")
    end, { silent = true, desc = "Go to definition in horizontal split" })
  end,
}

