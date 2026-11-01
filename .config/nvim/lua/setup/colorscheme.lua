-- Ganti tema cukup di sini. Plugin tema ada di lazy/colorschemes.lua
-- Pilihan: "vesper", "catppuccin", "github_dark_default", "sonokai"
local theme = "vesper"

-- Warna border = warna highlight (aksen) tema aktif, diambil dari highlight group ini.
-- vesper: "Function" = oren, "Title" = hijau
local border_hl = "Function"

local function border_color()
  for _, name in ipairs({ border_hl, "FloatBorder", "WinSeparator" }) do
    local fg = vim.api.nvim_get_hl(0, { name = name, link = false }).fg
    if fg then
      return fg
    end
  end
end

-- Override highlight yang harus bertahan walau tema diganti (:colorscheme ...)
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("UserHighlights", { clear = true }),
  callback = function()
    local hl = vim.api.nvim_set_hl
    local border = border_color()
    local black = "#000000"

    -- Border bawaan (LSP hover, diagnostic float, Lazy, Mason, Lspsaga, ...)
    local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })
    hl(0, "FloatBorder", { fg = border, bg = float_border.bg })

    -- Telescope transparan
    hl(0, "TelescopeNormal", { bg = "none" })
    for _, name in ipairs({ "TelescopeBorder", "TelescopePromptBorder", "TelescopeResultsBorder", "TelescopePreviewBorder" }) do
      hl(0, name, { fg = border, bg = "none" })
    end

    -- Noice (cmdline popup, popupmenu, confirm)
    for _, name in ipairs({
      "NoiceCmdlinePopupBorder", "NoiceCmdlinePopupBorderSearch",
      "NoicePopupBorder", "NoicePopupmenuBorder", "NoiceConfirmBorder",
    }) do
      hl(0, name, { fg = border, bg = "none" })
    end

    -- mini.files bg hitam
    hl(0, "MiniFilesNormal", { bg = black })
    hl(0, "MiniFilesBorder", { fg = border, bg = black })
    local warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn", link = false }).fg
    hl(0, "MiniFilesBorderModified", { fg = warn, bg = black })
    hl(0, "MiniFilesTitle", { bg = black })
    hl(0, "MiniFilesTitleFocused", { bg = black, bold = true })

    -- which-key bg hitam
    hl(0, "WhichKeyNormal", { bg = black })
    hl(0, "WhichKeyBorder", { fg = border, bg = black })
    hl(0, "WhichKeyTitle", { bg = black, bold = true })
  end,
})

local ok = pcall(vim.cmd.colorscheme, theme)
if not ok then
  vim.notify("Colorscheme '" .. theme .. "' tidak ditemukan", vim.log.levels.WARN)
  vim.cmd.colorscheme("default")
end
