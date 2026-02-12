return {
  "akinsho/bufferline.nvim",
  version = "*",
  -- Load setelah UI utama siap
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  keys = {
    { "<C-t>", ":enew<CR>", desc = "New Buffer" },
    { "<C-w>", ":Bdelete<CR>", desc = "Delete Buffer" },
    { "<C-l>", ":BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "<C-h>", ":BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
  },
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        separator_style = "none",
        show_buffer_icons = true,
        -- Tambahkan ini agar tidak tabrakan dengan Nvim-Tree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },

        name_formatter = function(buf)
          -- Gunakan logika kamu yang sudah bagus
          local filename = vim.fn.fnamemodify(buf.name, ":t")
          if buf.bufnr == vim.api.nvim_get_current_buf() then
            return " [" .. filename .. "]"
          end
          return filename
        end,
      },
    }
  end
}
