# Configuration files

## VIM
- Some mappings use `<C-Arrow>`; to see your terminal sequence, use `od -a`.
- Generate C++ stdlib ctags: `ctags -f ~/.vim/tags/cpp -R --c++-kinds=+p --fields=+iaS --extra=+q -I "_GLIBCXX_BEGIN_NAMESPACE_VERSION _GLIBCXX_END_NAMESPACE_VERSION _GLIBCXX_VISIBILITY+" -n /usr/include/c++/7/*`

| Key | Mode | Action |
| --- | --- | --- |
| `F2` | Normal/Insert | Toggle paste mode |
| `F3` | Normal | Toggle all folds |
| `F4` | Normal/Insert | FZF files |
| `F5` | Normal/Insert | NERDTree toggle |
| `F6` | Normal/Insert | TagList toggle |
| `F7` | Normal/Insert | Go to definition (YCM) |
| `F8` | Normal/Insert | Jump back (`<C-o>`) |
| `F9` | Normal/Insert | Open Git console (`:Git`) |
| `Y` | Normal | Yank to end of line |
| `<C-L>` | Normal | Clear search highlight |
| `<Leader>s` | Normal | Replace word under cursor in the whole buffer |
| `tc/tn/tp/tf/tl` | Normal | New tab / next / previous / first / last |

### Diff workflow
Use `:Gdiff` or `:Gvdiffsplit` (from vim-fugitive) to open a diff view against HEAD.

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
