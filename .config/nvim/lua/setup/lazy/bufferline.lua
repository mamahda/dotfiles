return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- untuk ikon file
  config = function()

    require("bufferline").setup {
      options = {
        mode = "buffers",                 -- tampilkan buffer, bukan tab
        diagnostics = "nvim_lsp",         -- tampilkan error/warning dari LSP
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        separator_style = "none",         -- hapus separator (biar clean/kotak)
        show_buffer_icons = true,
        name_formatter = function(buf)
          local filename = vim.fn.fnamemodify(buf.name, ":t")
          if buf.bufnr == vim.api.nvim_get_current_buf() then
            return " [" .. filename .. "]"
          else
            return filename
          end
        end,
      },
    }
  end
}

