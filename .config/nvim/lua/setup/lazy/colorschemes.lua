-- Semua plugin tema. Tema aktif dipilih di lua/setup/colorscheme.lua
-- Semua lazy = true: lazy.nvim otomatis me-load (dan menjalankan setup)
-- tema yang dipanggil lewat `:colorscheme <nama>`.
return {
  {
    "datsfilipe/vesper.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true, -- use the terminal background
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        noice = true,
        copilot_vim = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = { background = true },
        },
        mini = { enabled = true, indentscope_color = "" },
      },
    },
  },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
    end,
  },

  {
    "sainnhe/sonokai",
    lazy = true,
    priority = 1000,
    init = function()
      vim.g.sonokai_style = "atlantis"
    end,
  },
}
