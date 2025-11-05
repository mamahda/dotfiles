return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false,  -- true = Ayu Mirage (soft), false = Ayu Dark (default)
        overrides = {},
      })
      -- vim.cmd("colorscheme ayu")
    end,
  },
}

