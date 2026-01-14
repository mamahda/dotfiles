return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "go",
      "gomod",
      "gosum",
      "gowork",
      "c",
      "cpp",
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}

