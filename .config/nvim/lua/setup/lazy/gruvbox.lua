return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    --[[
    config = function()
      vim.o.background = "light"  -- "dark" or "light"
      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    end
    ]]
  }
}
