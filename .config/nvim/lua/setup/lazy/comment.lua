return {
  'numToStr/Comment.nvim',
  -- Lazy-load: plugin baru jalan kalau tombol ditekan atau masuk insert mode
  keys = { "gc", "gb", "gcc", "gbc" }, 
  event = "InsertEnter",
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      -- Gunakan pre_hook jika nanti kamu pasang 'ts_context_commentstring'
      -- Sangat berguna untuk koding React/HTML/Vue
      pre_hook = nil, 
    })
  end,
}
