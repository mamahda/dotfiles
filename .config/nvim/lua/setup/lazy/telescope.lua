return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },

    keys = {
      -- Document Symbols
      {
        "<leader>ss",
        function() require("telescope.builtin").lsp_document_symbols() end,
        desc = "Document Symbols",
      },

      -- Workspace Symbols filtered by current directory
      {
        "<C-S>",
        function()
          require("telescope.builtin").live_grep({
            prompt_title = "Find in Current Directory (Folder)",
            cwd = vim.fn.expand("%:p:h"), -- Membatasi pencarian hanya di folder file aktif
          })
        end,
        desc = "Live Grep in Current Directory",
      },

      -- Other telescope shortcuts
      {
        "<C-p>",
        function() require("telescope.builtin").find_files() end,
        desc = "Find Files",
      },
      {
        "<C-g>",
        function() require("telescope.builtin").git_files() end,
        desc = "Git Files",
      },
      {
        "<leader>pws",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Project Word Search",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.input("Grep > "),
          })
        end,
        desc = "Grep Input",
      },
      {
        "<leader>vh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Help Tags",
      },
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")

      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })

    end,
  },
}

