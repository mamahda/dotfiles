return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      -- cwd & root tree selalu sinkron dua arah
      sync_root_with_cwd = true,
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
        change_dir = {
          enable = true,
          global = true, -- <C-]> / - di tree pakai :cd (bukan :lcd)
        },
        open_file = {
          quit_on_open = false, -- Tetap buka sidebar setelah pilih file
        },
      },
    })
  end,
}
