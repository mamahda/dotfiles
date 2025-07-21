return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-web-devicons").setup()

    require("nvim-tree").setup ({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        adaptive_size = true,
        width = {
          min = 20,
          max = 30,
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,  -- Show ignored files
      },
    })
  end,
}
