return {
  "tpope/vim-fugitive",
  cmd = "Git",

  keys = {
    { "<leader>g", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gv", "<cmd>Gdiffsplit<cr>", desc = "Git Changes Split"}
  },
}
