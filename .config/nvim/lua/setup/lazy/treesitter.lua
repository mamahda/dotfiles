return {
  -- Branch `main`: tidak mendukung lazy-load & opsi `ensure_installed`.
  -- Highlight dinyalakan via autocmd FileType di autocmds.lua
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "go", "gomod", "gosum", "gowork",
      "c", "cpp", "lua", "python",
      "javascript", "typescript", "html", "css",
    })
  end,
}
