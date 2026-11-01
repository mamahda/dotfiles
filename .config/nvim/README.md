# nvim-config
This repository contains my Neovim configuration files and plugins setup. It is designed to enhance the Neovim experience with improved productivity and additional features for various workflows.

- file structure:
```
.
├── init.lua
├── lazy-lock.json
├── lua
│   └── setup
│       ├── init.lua          -- urutan load: set → remap → autocmds → lazy_init → colorscheme
│       ├── set.lua           -- options (vim.opt) + leader
│       ├── remap.lua         -- SEMUA keymap (termasuk plugin & LSP)
│       ├── autocmds.lua      -- autocommand umum
│       ├── colorscheme.lua   -- pilih tema aktif + override highlight
│       ├── lazy_init.lua     -- bootstrap lazy.nvim
│       └── lazy              -- spec plugin (hanya config, tanpa keymap)
│           ├── colorschemes.lua
│           ├── autopairs.lua, barbecue.lua, bufferline.lua,
│           ├── copilot.lua, fugitive.lua, gitsign.lua, lsp.lua, lspsaga.lua,
│           ├── lualine.lua, minifiles.lua, noice.lua, nvimtree.lua,
│           └── telescope.lua, treesitter.lua, undotree.lua, whichkey.lua
└── README.md
```

## Keymaps

`<leader>` = `Space`. Keys marked ✱ are custom (defined in `lua/setup/remap.lua`); the rest are important Neovim/plugin defaults.
Press `<leader>` (or `g`, `[`, `]`, `<C-w>`) and wait — **which-key** shows everything available.

### 1. Editor
| Keymap | Action |
| :--- | :--- |
| `<Esc>` ✱ | Clear search highlight |
| `<C-a>` ✱ | Select all |
| `dw` ✱ | Delete the whole word under cursor (`diw`) — see note below |
| `J` / `K` ✱ | (Visual) Move selected lines down / up |
| `<leader>y` ✱ | (Normal/Visual) Yank to system clipboard |
| `<leader>Y` ✱ | Yank line to system clipboard |
| `<leader>dc` ✱ | Delete from next `/` to end of line |
| `<leader>u` ✱ | Toggle Undotree |
| `<leader>nd` ✱ | Dismiss all notifications |
| `gcc` / `gc{motion}` | Toggle comment line / motion (native) |
| `gc` | (Visual) Toggle comment selection (native) |
| `<Esc>` ✱ | (Terminal) Exit terminal mode |

> **Note on `dw`:** in stock Vim, `dw` deletes from the cursor to the start of the next word.
> Here it is remapped to `diw` (delete the whole word under the cursor, wherever the cursor is).
> For the original behaviour use `de`/`dE`, or `daw` to delete the word plus its trailing space.

### 2. Windows & Buffers
| Keymap | Action |
| :--- | :--- |
| `<A-h/j/k/l>` ✱ | Move between split windows |
| `<C-w>v` / `<C-w>s` | Vertical / horizontal split |
| `<C-w>q` / `<C-w>o` | Close window / close all other windows |
| `<C-w>=` | Equalize window sizes |
| `<C-t>` ✱ | New empty buffer |
| `<C-x>` ✱ | Close current buffer (keeps window layout) |
| `<C-l>` / `<C-h>` ✱ | Next / previous buffer (bufferline) |

### 3. Working Directory (cwd)
| Keymap | Action |
| :--- | :--- |
| `<leader>pc` ✱ | Set cwd to the current file's folder |
| `:cd <path>` / `:cd -` | Change cwd / go back to previous cwd |
| `+` ✱ / `-` | (Nvim-Tree) Make folder under cursor the root / go up to parent — cwd follows |
| `g.` ✱ | (Mini.Files) Set cwd to highlighted folder (or the file's parent) |

cwd and the Nvim-Tree root are always synced, so Telescope and `<leader>E` search where the tree points.

### 4. Nvim-Tree (sidebar)
| Keymap | Action |
| :--- | :--- |
| `<C-b>` ✱ | Toggle tree and reveal current file |
| `<leader>pv` ✱ | Toggle tree |
| `<leader>ta` / `<leader>tc` ✱ | Expand all / collapse all folders |
| `<CR>` / `o` | Open file / toggle folder |
| `<C-v>` / `<C-x>` / `<C-t>` | Open in vertical split / horizontal split / new tab |
| `<Tab>` | Preview file (keep focus in tree) |
| `<BS>` / `P` | Close parent folder / jump to parent folder |
| `a` | Create file (end with `/` for a folder) |
| `r` / `d` / `D` | Rename / delete / move to trash |
| `x` / `c` / `p` | Cut / copy / paste |
| `y` / `Y` / `gy` | Copy name / relative path / absolute path |
| `H` / `I` | Toggle dotfiles / git-ignored files |
| `f` | Live filter |
| `R` | Refresh |
| `s` | Open with system default app |
| `g?` | Show all nvim-tree keymaps |

### 5. Mini.Files (floating explorer)
| Keymap | Action |
| :--- | :--- |
| `<leader>e` ✱ | Open at current file (press again to close) |
| `<leader>E` ✱ | Open at cwd |
| `l` / `<Right>` ✱ | Go into folder / open file (explorer stays open) |
| `<CR>` | Open file and close explorer |
| `h` / `<Left>` ✱ | Go to parent folder (closing the column on the right) |
| `H` | Go to parent folder (keep columns) |
| `q` / `<Esc>` ✱ | Close |
| `s` | **Synchronize**: apply file-system edits |
| `<M-c>` ✱ | Copy path of entry to system clipboard |
| `@` | Reveal cwd |
| `<BS>` | Reset to the starting folder |
| `m{char}` / `'{char}` | Set bookmark / jump to bookmark |
| `g?` | Show all mini.files keymaps |

File operations are done by **editing the text**: add a line to create (end with `/` for a folder), edit a name to rename, delete a line to delete, `dd` + `p` to move — then press `s` to apply.

### 6. Telescope
| Keymap | Action |
| :--- | :--- |
| `<C-p>` ✱ | Find files (cwd) |
| `<C-g>` ✱ | Find git-tracked files |
| `<C-s>` ✱ | Live grep in the current file's folder |
| `<leader>ss` ✱ | Document symbols (LSP) |
| `<leader>pr` ✱ | Resume last search |
| `<C-n>` / `<C-p>` | (Inside picker) Next / previous result |
| `<CR>` | Open selection |
| `<C-x>` / `<C-v>` / `<C-t>` | Open in horizontal split / vertical split / new tab |
| `<C-u>` / `<C-d>` | Scroll preview |
| `<Tab>` | Toggle multi-select |
| `<C-q>` | Send results to quickfix list |
| `<C-c>` / `<Esc><Esc>` | Close picker |

### 7. LSP & Diagnostics
| Keymap | Action |
| :--- | :--- |
| `K` ✱ | Hover documentation (Lspsaga; press again to enter the window) |
| `<leader>k` ✱ | Hover documentation (native) |
| `gd` ✱ | Go to definition |
| `gs` ✱ | Go to definition in a horizontal split |
| `gh` ✱ | LSP Finder (definitions, references, implementations) |
| `<leader>ca` ✱ | Code action (Lspsaga) |
| `<leader>o` ✱ | Toggle symbol outline (right side) |
| `grn` | Rename symbol (native) |
| `gra` | Code action (native) |
| `grr` / `gri` / `grt` | References / implementation / type definition (native) |
| `gO` | Document symbols (native) |
| `<C-s>` | (Insert) Signature help (native) |
| `<leader>sl` ✱ | Show line diagnostics |
| `[e` / `]e` ✱ | Previous / next diagnostic (Lspsaga) |
| `[d` / `]d` | Previous / next diagnostic (native) |
| `<C-w>d` | Show diagnostic under cursor (native) |

Inside Lspsaga Finder: `o` open, `s` vertical split, `i` horizontal split, `t` new tab, `q` quit.

### 8. Completion (nvim-cmp) & Copilot
| Keymap | Action |
| :--- | :--- |
| `<C-n>` / `<C-p>` | Next / previous completion item |
| `<C-y>` | Confirm completion |
| `<C-Space>` | Trigger completion manually |
| `<C-e>` | Close completion menu |
| `<Tab>` | Accept Copilot suggestion |
| `<M-]>` / `<M-[>` | Next / previous Copilot suggestion |
| `<C-]>` | Dismiss Copilot suggestion |
| `<leader>ce` / `<leader>cd` / `<leader>cs` ✱ | Copilot enable / disable / status |

### 9. Git
| Keymap | Action |
| :--- | :--- |
| `<leader>gs` ✱ | Git status (Fugitive) |
| `<leader>gv` ✱ | Diff current file against index (split) |
| `<leader>GB` ✱ | Git blame for whole file (Fugitive) |
| `<leader>gp` ✱ | Preview hunk under cursor (Gitsigns) |
| `<leader>gb` ✱ | Toggle inline blame for current line (Gitsigns) |

Inside the Fugitive status window: `s` stage, `u` unstage, `-` toggle stage, `=` inline diff, `dv` vertical diff, `X` discard change, `cc` commit, `ca` amend, `g?` help.

### 10. Undotree
| Keymap | Action |
| :--- | :--- |
| `j` / `k` | Move between undo states |
| `<CR>` | Restore the selected state |
| `?` | Help |

---

## Key Features

### Automated Workflow
- **Auto-Startup**: Running `nvim .` automatically opens Nvim-Tree.
- **Persistence**: Undo history is saved to disk (`undofile`), so you can undo even after closing Neovim; browse it with Undotree. Swap files are disabled.

### UI Aesthetics
- **Noice & Notify**: Command-line and notifications appear in elegant floating windows.
- **Barbecue**: Breadcrumbs at the top for easy folder/code structure navigation.
- **Transparent Mode**: Telescope and Noice utilize a transparent background; Mini.Files and which-key use a black background.

### Performance
- Powered by `lazy.nvim` to load plugins only when necessary.
- **FZF Native** integration in Telescope for lightning-fast file searches.

---

## Maintenance
- `:Lazy` - Plugin management (Install/Update/Clean).
- `:Mason` - LSP, Formatter, and Linter management.
- `:checkhealth` - Check Neovim configuration health.
