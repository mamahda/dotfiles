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
    require("fidget").setup({})
    require("mason").setup()

    -- Config server pakai API native (Neovim 0.11+).
    -- mason-lspconfig v2 tidak lagi memakai `handlers`, ia hanya memanggil
    -- vim.lsp.enable() untuk server yang terinstall. Keymap LSP ada di remap.lua.
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("clangd", {
      cmd = { "clangd", "--background-index", "--clang-tidy" },
      capabilities = { offsetEncoding = { "utf-16" } },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "clangd", "laravel_ls", "gopls", "pylsp", "intelephense",
      },
    })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      -- Mapping internal cmp (bukan vim.keymap), jadi tetap di sini
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- UI Diagnostic
    vim.diagnostic.config({
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end,
}
