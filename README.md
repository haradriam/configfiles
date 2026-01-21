# Configuration files

## VIM

### Bindings

| Key | Mode | Action |
| --- | --- | --- |
| `F2` | Normal/Insert | Toggle paste mode |
| `F3` | Normal | Toggle all folds |
| `F4` | Normal/Insert | FZF files |
| `F5` | Normal/Insert | NERDTree toggle |
| `F6` | Normal/Insert | TagList toggle |
| `F7` | Normal/Insert | LSP: go to definition |
| `F8` | Normal/Insert | Jump back (`<C-o>`) |
| `F9` | Normal/Insert | Open Git console (`:Git`) |
| `Y` | Normal | Yank to end of line |
| `<C-L>` | Normal | Clear search highlight |
| `<Leader>s` | Normal | Replace word under cursor in the whole buffer |
| `tc/tn/tp/tf/tl` | Normal | New tab / next / previous / first / last |

### Language servers (LSP)

This setup uses `vim-lsp` + `vim-lsp-settings`. For each language you want LSP
features for, you must install the corresponding language server binary.

| Language | Server | Install | Notes |
| --- | --- | --- | --- |
| C/C++ | `clangd` | `sudo apt install clangd` | Used for navigation/completion in `.c/.cpp` |
| Python | `pylsp` | `sudo apt install python3-pylsp` | Used for navigation/completion in `.py` |
| Bash/sh | `bash-language-server` | `npm i -g bash-language-server` | Uses Node.js/npm |
| Go | `gopls` | `sudo apt install gopls` | Used for navigation/completion in `.go` |
| Rust | `rust-analyzer` | `rustup component add rust-analyzer` | Uses rustup |
| YAML | `yaml-language-server` | `npm i -g yaml-language-server` | Uses Node.js/npm |
| JSON | `vscode-json-language-server` | `npm i -g vscode-langservers-extracted` | Uses Node.js/npm |
| Markdown | `marksman` | `cargo install --locked marksman` | Uses Rust/cargo |

In Vim, you can check the active servers with `:LspStatus`. If something does
not start, inspect `:messages`.

Notes:
- Node-based servers require `node` + `npm`.
- Rust-based installs require `rustup`/`cargo`.

### Navigation

| Key | Mode | Action |
| --- | --- | --- |
| `gd` | Normal | LSP: go to definition |
| `gD` | Normal | LSP: go to declaration |
| `gr` | Normal | LSP: references |
| `gh` | Normal | LSP: hover |
| `gb` | Normal | Jump back (`<C-o>`) |

### Project local vimrc
Project-specific settings are supported via `vim-localrc`.

- Default filename: `.local.vimrc` (loaded from the current directory and its
  parents)
- Typical use: set indentation per project, set `g:hl_limits_columns`, etc.

### Diff workflow
After `F9` press `dd` over the file to compare against HEAD.

| Key | Action |
| --- | --- |
| `Alt+Down` | Jump to next diff (`]c`) |
| `Alt+Up` | Jump to previous diff (`[c`) |
| `Alt+Right` | Get change from other buffer (`:diffget`) |
| `Alt+Left` | Put change to other buffer (`:diffput`) |

## TMUX

| Key | Action |
| --- | --- |
| Prefix | `Ctrl+a` |
| `prefix + R` | Reload tmux config |
| `prefix + |` / `_` | Split horizontal / vertical in current path |
| `prefix + v` / `s` | Split horizontal / vertical |
| `prefix + h/j/k/l` | Move across panes (vim-style) |
| `Ctrl+Arrow` | Move across panes with arrows |
| `v` (copy-mode) | Start selection |
| `y` (copy-mode) | Copy selection |
| `p` | Paste buffer |

Some mappings use `<C-Arrow>`; to see your terminal sequence, use `od -a`.
