# nvim-config
This repository contains my Neovim configuration files and plugins setup. It is designed to enhance the Neovim experience with improved productivity and additional features for various workflows.

- file structure:
```
.
├── init.lua
├── lazy-lock.json
├── lua
│   └── setup
│       ├── init.lua
│       ├── lazy
│       │   ├── autopairs.lua
│       │   ├── catpuccin.lua
│       │   ├── comment.lua
│       │   ├── copilot.lua
│       │   ├── fugitive.lua
│       │   ├── gitsign.lua
│       │   ├── gruvbox.lua
│       │   ├── lsp.lua
│       │   ├── lualine.lua
│       │   ├── minifiles.lua
│       │   ├── noice.lua
│       │   ├── nvimtree.lua
│       │   ├── render-markdown.lua
│       │   ├── telescope.lua
│       │   ├── treesitter.lua
│       │   ├── undotree.lua
│       │   ├── vimbegood.lua
│       │   └── vimtest.lua
│       ├── lazy_init.lua
│       ├── remap.lua
│       └── set.lua
└── README.md
```

## Keymaps

### 1. Basic Navigation & Editor (Remap)
| Keymap | Action |
| :--- | :--- |
| `<leader>pv` | Alternative to open File Explorer |
| `<C-a>` | Select All text |
| `dw` | Delete inner word |
| `<Esc>` | Clear search highlights |
| `J` / `K` | (Visual Mode) Move selected lines up/down |
| `<leader>y` | Yank (copy) to system clipboard |
| `<leader>Y` | Yank current line to system clipboard |
| `<A-h/j/k/l>` | Navigate between split windows (Alt + hjkl) |

### 2. File Explorer (Nvim-Tree & Mini.Files)
| Keymap | Action |
| :--- | :--- |
| `<C-b>` | Toggle Sidebar (Nvim-Tree) |
| `<leader>e` | Open Mini.Files (Floating at current file's directory) |
| `<leader>E` | Open Mini.Files at Root Directory (CWD) |
| `<leader>ta` | **Expand All**: Open all folders in the sidebar |
| `<leader>tc` | **Collapse All**: Close all folders in the sidebar |

### 3. Search & Navigation (Telescope)
| Keymap | Action |
| :--- | :--- |
| `<C-p>` | Find Files in project |
| `<C-g>` | Find Git-tracked files |
| `<C-S>` | **Live Grep**: Search text within the current file's directory |
| `<leader>ps` | Grep Input: Search specific text in the whole project |
| `<leader>pr` | Resume: Re-open the last search results |
| `<leader>ss` | Document Symbols (Functions/Variables list) |

### 4. LSP & Diagnostics (Lspsaga)
| Keymap | Action |
| :--- | :--- |
| `K` | Hover: View documentation/type info |
| `gd` | Go to Definition |
| `gs` | **Go Split**: Open definition in a horizontal split |
| `gh` | LSP Finder (Definitions & References) |
| `gr` | Rename variable project-wide |
| `<leader>ca` | Code Action (Quick fixes) |
| `<leader>o` | Toggle Outline (Code structure on the right) |

### 5. Git (Fugitive & Gitsigns)
| Keymap | Action |
| :--- | :--- |
| `<leader>gs` | Open Git Status (Fugitive) |
| `<leader>gp` | Preview Hunk (View line changes) |
| `<leader>gb` | Toggle Blame (View line author) |

### 6. Buffer & Tab (Bufferline)
| Keymap | Action |
| :--- | :--- |
| `<C-t>` | Create new Buffer/Tab |
| `<C-w>` | Close active Buffer (via BufDelete) |
| `<C-l>` | Move to the right Tab |
| `<C-h>` | Move to the left Tab |

---

## Key Features

### Automated Workflow
- **Auto-Startup**: Running `nvim .` automatically opens Nvim-Tree.
- **Persistence**: Undo history is preserved even after closing Neovim (via Undotree).

### UI Aesthetics
- **Noice & Notify**: Command-line and notifications appear in elegant floating windows.
- **Barbecue**: Breadcrumbs at the top for easy folder/code structure navigation.
- **Transparent Mode**: Telescope, Noice, and Mini.Files utilize a transparent background.

### Performance
- Powered by `lazy.nvim` to load plugins only when necessary.
- **FZF Native** integration in Telescope for lightning-fast file searches.

---

## Maintenance
- `:Lazy` - Plugin management (Install/Update/Clean).
- `:Mason` - LSP, Formatter, and Linter management.
- `:checkhealth` - Check Neovim configuration health.
