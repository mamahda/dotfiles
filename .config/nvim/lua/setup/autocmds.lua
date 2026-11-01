local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Hapus semua spasi di akhir baris saat save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Nyalakan highlight Treesitter untuk setiap filetype yang parser-nya tersedia
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if lang then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})
