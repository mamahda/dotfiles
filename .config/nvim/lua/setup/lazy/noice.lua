return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = "minimal",
      timeout = 3000, -- Notif hilang dalam 3 detik
    })

    require("noice").setup({
      lsp = {
        -- Mengalihkan pesan signature help/hover ke Noice
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = { enabled = false }, -- Pakai fidget saja
      },
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "100%", -- Pakai % supaya aman di semua ukuran layar
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded", -- Biar matching sama Lspsaga dan Diagnostic
          },
        },
      },
      messages = {
        enabled = true, -- Saya sarankan aktifkan, tapi pakai filter bawah ini
        view_search = false, -- Hilangkan notif "search hit BOTTOM" yang ganggu
      },
      popupmenu = {
        enabled = true,
      }
    })
    -- Shortcut untuk tutup semua notifikasi yang numpuk
    vim.keymap.set("n", "<leader>nd", function()
        require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss All Notifications" })
  end
}
