return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 300,
    -- Label grup prefix; keymap-nya sendiri ada di remap.lua (dibaca dari `desc`)
    spec = {
      { "<leader>c", group = "Code / Copilot" },
      { "<leader>g", group = "Git" },
      { "<leader>G", group = "Git" },
      { "<leader>n", group = "Notifications" },
      { "<leader>p", group = "Project / Telescope" },
      { "<leader>s", group = "Symbols / Diagnostics" },
      { "<leader>t", group = "Tree" },
      { "gr", group = "LSP (native)" },
    },
  },
}
