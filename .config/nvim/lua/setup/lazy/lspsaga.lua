return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
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

  end,
}

