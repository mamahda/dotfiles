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
        -- Setup conform for formatting (if needed)
        require("conform").setup({
            formatters_by_ft = {
            }
        })

        -- Setup nvim-cmp for autocomplete
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",       -- Lua Language Server
                "pyright",      -- Python Language Server (pyright)
                "html",         -- HTML Language Server
                "ts_ls",        -- TypeScript/JavaScript Language Server
                "clangd",       -- C Language Server (clangd)
                "laravel_ls",   -- Laravel Language Server
            },
            handlers = {
                -- Default handler for all LSP servers
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- Lua LS (Lua language server configuration)
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "bit", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                -- clangd for C (C language server configuration)
                clangd = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup{
                        capabilities = capabilities,
                    }
                end,

                -- pyright for Python (Python language server configuration)
                pyright = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup{
                        capabilities = capabilities,
                    }
                end,

                -- html for HTML (HTML language server configuration)
                html = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.html.setup{
                        capabilities = capabilities,
                    }
                end,

                -- ts_ls for TypeScript/JavaScript (TypeScript/JavaScript language server configuration)
                ts_ls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup{
                        capabilities = capabilities,
                    }
                end,
            }
        })

        -- Setup nvim-cmp (completion)
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
        { name = 'luasnip' }, -- For luasnip users.
      }, {
          { name = 'buffer' },
            })
        })

        -- Setup diagnostics (for showing errors and warnings)
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

