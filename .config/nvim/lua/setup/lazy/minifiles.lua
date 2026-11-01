return {
  "echasnovski/mini.files",
  event = "VeryLazy",
  -- keymap & highlight ada di remap.lua / colorscheme.lua
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
}
