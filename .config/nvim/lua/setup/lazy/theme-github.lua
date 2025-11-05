return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_colorblind')
  end,
}
