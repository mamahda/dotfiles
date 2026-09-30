return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  -- Pindahkan keymap dari remap.lua ke sini agar lazy-load jalan
  keys = {
    { "<C-b>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle NvimTree" },
    { "<leader>ta", function() require("nvim-tree.api").tree.expand_all() end, desc = "Tree Expand All" },
    -- Tekan <leader>tc untuk tutup semua folder (collapse)
    { "<leader>tc", function() require("nvim-tree.api").tree.collapse_all() end, desc = "Tree Collapse All" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "extension",
      },
      view = {
        adaptive_size = true,
        width = {
          min = 20,
          max = 35,
        },
      },
      renderer = {
        group_empty = false,
        -- Tambahkan icon folder agar lebih intuitif
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false, -- Sesuai preferensi kamu: tampilkan file yang di-ignore git
      },
      -- Opsional: Tutup nvim-tree otomatis kalau dia tinggal satu-satunya window
      actions = {
        open_file = {
          quit_on_open = false, -- Tetap buka sidebar setelah pilih file
        },
      },
    })
  end,
}
