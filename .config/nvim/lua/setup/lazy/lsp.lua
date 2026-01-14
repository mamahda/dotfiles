return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("conform").setup({})

    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- "pyright",
        -- "html",
        -- "ts_ls",
        "clangd",
        "laravel_ls",
        "gopls"
      },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        -- Lua LS
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "bit", "it", "describe", "before_each", "after_each" },
                },
              }
            }
          }
        end,

        ["clangd"] = function()
          local clangd_capabilities = vim.tbl_deep_extend("force", capabilities, {
             offsetEncoding = { "utf-16" },
          })

          require("lspconfig").clangd.setup {
            capabilities = clangd_capabilities,
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
            },
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-y'] = cmp.mapping.complete(),
          ['<C-[>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-]>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-q>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
