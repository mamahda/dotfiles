return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic", -- Wajib: penyedia data simbol LSP
    "nvim-tree/nvim-web-devicons", -- Wajib: untuk ikon
  },
  config = function()
    require("barbecue").setup({
      create_autocmd = false, -- Supaya tidak bentrok saat update file
    })

    -- Trigger barbecue saat kursor bergerak
    vim.api.nvim_create_autocmd({
      "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })
  end,
}
