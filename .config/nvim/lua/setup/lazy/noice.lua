return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Optional: if you don't want to use it, remove this line
    "j-hui/fidget.nvim",    -- fidget.nvim for LSP progress
  },
  config = function()
    -- Disable the default nvim-notify popups and set render minimal
    require("notify").setup({
      background_colour = "#000000", -- Optional: Adjust background color
      render = "minimal",            -- Use minimal rendering for notifications
    })

    -- Noice configuration
    require("noice").setup({
      cmdline = {
        view = "cmdline_popup", -- Floating command line
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "🔍 ", lang = "regex" },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 37, -- Move it 2 rows up
            col = "50%", -- Keep it centered
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      messages = {
        enabled = false, -- Disable default messages from noice
      },
      popupmenu = {
        enabled = true, -- Use a floating popup for command suggestions
      }
    })
  end
}
