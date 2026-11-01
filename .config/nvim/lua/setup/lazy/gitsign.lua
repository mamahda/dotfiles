return {
  "lewis6991/gitsigns.nvim",
  -- Plugin baru aktif kalau kamu buka file yang ada di folder Git
  event = { "BufReadPre", "BufNewFile" },
  cmd = "Gitsigns", -- keymap di remap.lua
  config = function ()
    require('gitsigns').setup({
      -- Tanda di pinggir kiri
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      -- Fitur Blame yang muncul di ujung baris
      current_line_blame = false, -- Set true kalau mau otomatis muncul
      current_line_blame_opts = {
        delay = 500,
      },
    })
  end
}
