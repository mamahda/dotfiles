return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  -- Load hanya saat LSP aktif, karena tanpa LSP, barbecue tidak bisa baca simbol
  event = "LspAttach", 
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Default-nya sudah cukup bagus
    create_autocmd = true, -- Biarkan plugin yang mengurus updatenya sendiri
    include_buftypes = { "" }, -- Hanya tampil di file normal (bukan terminal/NvimTree)
  },
}
