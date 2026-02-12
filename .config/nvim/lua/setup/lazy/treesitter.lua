return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    local configs = require("nvim-treesitter.config")

    configs.setup({
      ensure_installed = { 
        "go", "gomod", "gosum", "gowork", 
        "c", "cpp", "lua", "python", 
        "javascript", "typescript", "html", "css" 
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })

    -- SOLUSI PAMUNGKAS:
    -- Jalankan start() otomatis SETIAP KALI ada file yang parsernya tersedia.
    -- Ini jauh lebih ringan daripada syntax on/off manual.
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang then
          pcall(vim.treesitter.start, bufnr, lang)
        end
      end,
    })
  end,
}
