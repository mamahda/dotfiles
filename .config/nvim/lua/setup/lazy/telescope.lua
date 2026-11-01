return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- TAMBAHKAN INI: Sangat penting untuk kecepatan pencarian
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = "Telescope", -- keymap di remap.lua (require() otomatis me-load plugin)

  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    -- Jangan lupa load fzf
    pcall(require("telescope").load_extension, "fzf")
    require("telescope").load_extension("ui-select")
  end,
}
