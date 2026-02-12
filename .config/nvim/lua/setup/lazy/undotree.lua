return {
  "mbbill/undotree",
  -- Lazy-load: load hanya saat tombol ditekan
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  },
  config = function()
    -- Tidak banyak yang perlu di-setup di sini karena plugin ini sangat simpel
  end
}
