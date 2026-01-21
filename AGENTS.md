# AGENTS guide for configfiles
Repository scope: personal dotfiles (vim, zsh, tmux, helper scripts). There are no application builds, package manifests, or tests. Use this guide to stay consistent and lightweight.

## Quick facts
- Primary intent: store editor/terminal configuration files.
- Languages present: Vimscript, shell scripts, tmux config, markdown.
- Package managers: none tracked here; plugins managed manually (vim-plug, oh-my-zsh).
- Default shell: zsh via oh-my-zsh (`~/.oh-my-zsh` expected).
- Editor defaults: vim with vim-plug, 4-space soft tabs, auto-strip trailing spaces, fold by indent, 80+ column highlight plugin.
- Terminal multiplexer: tmux with prefix `Ctrl+a` and vi-style copy mode.
- AI guardrails: no Cursor rules, no Copilot repo rules detected.
- Git state: treat as personal files; keep changes minimal and readable.

## Build, lint, test commands
- There is no build, lint, or test toolchain in this repo; it is pure configuration.
- When making edits, manual validation is expected (e.g., open vim/tmux/zsh to ensure syntax loads cleanly).
- For vimscript validation, run `vim -Nu NONE -c "source ~/.vimrc | quit"` to surface syntax errors quickly.
- For tmux config, reload with `tmux source-file ~/.tmux.conf` inside a tmux session to spot errors.
- For zsh config, reload with `source ~/.zshrc` and open a new shell to confirm prompt/plugins load.
- For shell scripts, run `bash -n scripts/avim` to check syntax.
- No unit tests exist; if adding scripts, provide minimal self-check commands in comments or docstrings.
- If you introduce tooling (linters, formatters), document commands here and avoid assuming availability of language runtimes.

## Repository layout at a glance
- `README.md`: short notes on vim usage and ctags generation.
- `.vimrc`: main vim configuration with plugins via vim-plug.
- `.vimiderc`: alternate vim config that sources `.vimrc` and opens sidebar helpers.
- `.zshrc`: oh-my-zsh configuration and plugin list.
- `.tmux.conf`: tmux settings and keybindings.
- `scripts/avim`: helper to open vim with all C/C++ files under a path.
- `scripts/idevim`: start vim using `.vimiderc`.
- `AppsToIntall`: list of recommended desktop apps/extensions.
- Hidden files under `.git/` are standard git metadata; do not touch.

## Editing expectations (vim-centric)
- Indent width: `shiftwidth=4`, `softtabstop=4`, `expandtab` (use spaces, no hard tabs).
- Trailing whitespace: auto-removed on save via `autocmd BufWritePre * %s/\s\+$//e`; keep files clean even when editing outside vim.
- Line length: `vim_hl_limits` plugin highlights from column 81; keep code and prose near 80 columns when reasonable.
- Folding: `fdm=indent`, `foldlevelstart=99`; keep indentation meaningful, avoid mixing tabs/spaces.
- Case handling: searches are case-insensitive unless capitals are used (`ignorecase` + `smartcase`).
- Mouse: enabled; avoid mappings that conflict with existing mouse usage.
- Confirm on quit: `confirm` enabled; scripts should avoid forced exits.
- Swap files: disabled (`noswapfile`); prefer version control for safety.
- Undo levels: 1000; avoid gigantic generated buffers in repo.
- Plugins used: vim-airline, vim-fugitive, vim-signify, nerdtree, taglist, fzf, a.vim, vim-localrc, tabular, vim_hl, vim_hl_limits, YouCompleteMe, plantuml-syntax, github/copilot.vim.
- Avoid adding heavy plugins that require system-wide builds unless documented.

## Import and dependency guidance
- No language package manifests are tracked; avoid adding ad-hoc dependencies without user approval.
- For new scripts, rely on POSIX shell features where possible; document non-standard binaries you require.
- Vim plugins are managed via vim-plug in `.vimrc`; keep plugin list minimal and tested.
- oh-my-zsh plugins list is explicit; add new plugins only if they are fast and documented in this file.
- tmux config assumes standard tmux; avoid version-specific options unless noted.

## Formatting guidelines
- Use spaces, no tabs in tracked files unless copying literal output that demands tabs.
- Preserve ASCII; repo currently uses ASCII-only text.
- Keep lines under ~100 chars; prefer 80.
- End files with a newline.
- Avoid trailing whitespace; double-check when editing outside vim.
- For Markdown, use simple headings and bullet lists; avoid embedded images.
- Keep comment style consistent with file type (e.g., `"` in Vimscript, `#` in shell/tmux).
- Avoid excessive blank lines; aim for compact readability.

## Naming conventions
- Vimscript functions: use `CamelCase` as seen in `.vimiderc` (e.g., `OpenSidebar`).
- Autocommand groups: use lowercase descriptive names (e.g., `quickfix`).
- Shell scripts: prefer lowercase with hyphens or simple names (`avim`, `idevim`).
- Variables in shell: uppercase for env vars, lowercase for locals.
- Files: keep simple descriptive names; avoid spaces.

## Error handling expectations
- Shell scripts: set `set -euo pipefail` when appropriate for new scripts; current ones are minimal but be cautious when extending.
- Provide clear error messages on failure; avoid silent exits.
- Validate user input paths before use; current `avim` script trusts args—if modifying, add checks.
- For vim config changes, prefer defensive checks (e.g., `if exists()` before calling plugin functions).
- Avoid breaking existing keybindings; if changed, document rationale in this file.

## Keybindings overview (tmux)
- Prefix is `Ctrl+a`; do not reset without documenting.
- Window base index: 1.
- Split shortcuts: `|` horizontal, `_` vertical with current working dir preserved.
- Pane navigation: `Ctrl+Arrow` keys.
- Vi copy mode enabled; `v` to select, `y` to yank, `p` to paste.
- Debugger helpers mapped to `Ctrl+F3..F9` and `Ctrl-e` for termdebug-related commands; avoid conflicting mappings.
- Reload config inside tmux: `prefix + R`.

## Keybindings overview (vim)
- F2 toggles paste mode.
- F3 toggles folds (indent-based).
- F4: FZF file search (requires plugin).
- F5: NERDTree toggle.
- F6: TagList toggle.
- F7: YouCompleteMe go-to-definition.
- F8: return to previous tag.
- Tab management: `tc` new tab, `tn` next, `tp` prev, `tf` first, `tl` last.
- Quick search replace: `<Leader>s` replaces word under cursor.
- `<C-L>` clears search highlighting.

## oh-my-zsh expectations
- Theme: `robbyrussell`.
- Plugins enabled: git, tmux, command-not-found, dirhistory, last-working-dir, web-search, wd, zsh-syntax-highlighting, zsh-autosuggestions, fzf.
- `ZSH_TMUX_AUTOSTART=true`; tmux auto-starts—scripts should not assume plain shell startup.
- If adding aliases or functions, keep them lightweight to avoid slow shell startup.
- Loading extras: `[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh` already present; preserve.

## Sidebar vim workflow (`.vimiderc`)
- Sources `.vimrc` then adjusts sidebar defaults (NERDTree + TagList open on startup unless diff mode).
- Functions `OpenSidebar` and `CheckLeftBuffers` manage automatic layout and auto-quit when only helper buffers remain.
- If modifying, keep diff-mode guard to avoid sidebar noise during diffs.
- Respect the auto-quit logic; ensure helper buffers are detected correctly.

## C/C++ helper script (`scripts/avim`)
- Purpose: open vim with all C-family files under provided paths using `find` and regex for `h/hh/cpp/cc/c`.
- Behavior: echoes the invoked command then runs vim with command substitution.
- If extending: prefer `find ... -print0` with `xargs -0` for robust filenames; add `set -euo pipefail` at top; handle zero matches gracefully.

## Alternate vim launcher (`scripts/idevim`)
- Purpose: start vim with `.vimiderc` using `vim -u ~/.vimiderc`.
- Keep it single-line; if adding options (e.g., `-p` for tabs), document here.

## Version control practices
- Never run destructive git commands (`reset --hard`, `checkout --`) on user changes.
- Keep commits small and descriptive if asked to create them; default branch is `master`.
- Do not amend existing commits unless explicitly instructed.
- Ignore files in `.git/`; only touch tracked configs or new docs.

## Safety and compatibility
- Configs assume Unix-like environment with vim, tmux, zsh available.
- Avoid paths that are OS-specific without guards.
- Keep commands portable (no GNU-only flags unless documented).
- Test changes by opening new shells/tmux sessions; avoid breaking login shells.
## Cursor/Copilot rules
- No `.cursor/rules/` or `.cursorrules` present.
- No `.github/copilot-instructions.md` present.
- If such files are added later, summarize them here and follow precedence rules.

## Working locally
- Launch vim normally with `vim` or `idevim` for sidebar layout.
- Launch tmux and reload config with `prefix + R` after edits.
- Reload zsh config in a shell with `source ~/.zshrc`.
- Keep environment variables minimal; do not bake secrets into tracked files.

## Troubleshooting quick checks
- Vim: `vim -Nu NONE -c "source ~/.vimrc | quit"` to catch syntax errors without plugins.
- Tmux: `tmux -f ~/.tmux.conf new -s test` to see warnings before regular use.
- Zsh: `time zsh -i -c exit` to estimate startup cost when tweaking plugins.

## Summary for agents
- Treat repo as dotfiles; edits should stay minimal, reversible, and well-documented.
- No formal tests; validation relies on manual reloads in vim/tmux/zsh.
- Follow vim/zsh/tmux conventions (4-space soft tabs, trimmed whitespace, ~80-col awareness).
- Document any new tooling or dependencies you introduce and update this file when workflows change.
