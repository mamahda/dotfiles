return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy", -- Performa startup lebih kencang
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        -- Coba set true jika ingin melihat ikon Git/Diagnostics
        icons_enabled = false, 
        theme = 'auto',
        -- Style clean kotak-kotak tanpa gap
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true, -- Statusline tunggal di bawah
        refresh = {
          statusline = 1000, -- Naikkan ke 1000ms agar CPU lebih santai
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { { 'mode', upper = true } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } }, -- path = 1 tampilkan nama folder atasnya
        lualine_x = {
          -- Kamu bisa tambah status Copilot di sini jika pakai copilot.lua
          'encoding',
          'fileformat',
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }
  end
}
