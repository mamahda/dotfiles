return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    config = function()
      require("render-markdown").setup({})
      vim.keymap.set("n", "<leader>mr", function()
        require("render-markdown").toggle()
      end, { desc = "Toggle Markdown Render" })
    end,
  },
}

