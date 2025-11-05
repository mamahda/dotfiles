return {
  "github/copilot.vim",
  enabled = true,
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ce",
      ":Copilot enable<CR>",
      { noremap = true, silent = true, desc = "Enable Copilot" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>cd",
      ":Copilot disable<CR>",
      { noremap = true, silent = true, desc = "Disable Copilot" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>cs",
      ":Copilot status<CR>",
      { noremap = true, silent = true, desc = "Copilot status" }
    )
  end,
}

