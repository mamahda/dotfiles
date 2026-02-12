return {
  "echasnovski/mini.files",
  event = "VeryLazy",
  config = function(_, opts)
    require("mini.files").setup(opts)

    -- Membuat tampilan benar-benar clean (transparan)
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = "none", fg = "#545c7e" })
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "none" })

    -- Autocmd untuk keymap tambahan di dalam jendela mini.files
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Contoh: Map 'M-c' untuk copy path di dalam buffer mini.files
        vim.keymap.set("n", "<M-c>", function()
          local path = require("mini.files").get_fs_entry().path
          vim.fn.setreg("+", path)
          print("Path copied: " .. path)
        end, { buffer = buf_id, desc = "Copy path" })
      end,
    })
  end,

  -- Pakai 'opts' secara langsung agar lebih ringkas
  opts = {
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "<CR>",
      go_out = "H",
      go_out_plus = "h",
      synchronize = "s",
    },
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 80,
    },
    options = {
      use_as_default_explorer = true,
    },
  },

  keys = {
    {
      "<leader>e", -- Saya ganti ke 'm' agar tidak bentrok dengan nvim-tree
      function()
        if not require("mini.files").close() then
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end
      end,
      desc = "Open mini.files",
    },
    {
      "<leader>E",
      function()
        if not require("mini.files").close() then
          require("mini.files").open(vim.uv.cwd(), true)
        end
      end,
      desc = "Open mini.files (Root Directory)",
    },
  },
}
