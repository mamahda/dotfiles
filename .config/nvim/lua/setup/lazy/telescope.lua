return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- TAMBAHKAN INI: Sangat penting untuk kecepatan pencarian
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  keys = {
    -- Keymap kamu sudah sangat bagus, tetap pertahankan
    { "<leader>ss", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Symbols" },
    { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<C-g>", function() require("telescope.builtin").git_files() end, desc = "Git Files" },
    -- Live Grep di folder aktif
    {
      "<C-S>",
      function()
        require("telescope.builtin").live_grep({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Grep in Dir"
    },
    -- Tambahan: Resume pencarian terakhir (sangat berguna!)
    { "<leader>pr", function() require("telescope.builtin").resume() end, desc = "Resume Last Search" },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    -- Jangan lupa load fzf
    pcall(require("telescope").load_extension, "fzf")
    require("telescope").load_extension("ui-select")

    -- Estetika Transparan kamu
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  end,
}
