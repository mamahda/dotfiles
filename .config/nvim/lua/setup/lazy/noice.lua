return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Optional
    "j-hui/fidget.nvim",    -- fidget.nvim for LSP progress
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = "minimal",
    })

    require("noice").setup({
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "🔍 ", lang = "regex" },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 38,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = true,
      }
    })
  end
}

