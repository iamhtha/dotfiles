# Keymap Reference

## Prefixes

| Prefix       | Purpose                       |
| ------------ | ----------------------------- |
| `<leader>a*` | Sidekick — AI NES + CLI       |
| `<leader>f*` | fzf-lua — fuzzy finding       |
| `<leader>g*` | Gitsigns — hunk operations    |
| `<leader>i*` | Avante — AI panel             |
| `<leader>k`  | Key Analyzer                  |
| `<leader>l*` | Language tools                |
| `<leader>n*` | Neogen — annotation generator |
| `<leader>t*` | Trouble — diagnostics list    |
| `gn*`        | Treesitter navigation         |
| `gr*`        | LSP operations                |
| `d*`         | DAP (debugger)                |
| `[` / `]`    | Previous / next navigation    |

## Sidekick (`<leader>a*`)

| Key          | Mode | Description                                                                     |
| ------------ | ---- | ------------------------------------------------------------------------------- |
| `<Tab>`      | n    | NES: jump to or apply next edit suggestion                                      |
| `<Tab>`      | i, s | blink.cmp chain: snippet fwd → NES jump-or-apply → inline completion → fallback |
| `<leader>at` | n    | Toggle CLI                                                                      |
| `<leader>as` | n    | Select CLI tool                                                                 |
| `<leader>ac` | n    | Close CLI                                                                       |
| `<leader>ap` | n    | Prompt CLI                                                                      |
| `<leader>ae` | v    | Send visual selection to CLI                                                    |

## Avante AI panel (`<leader>i*`)

| Key          | Mode | Description    |
| ------------ | ---- | -------------- |
| `<leader>it` | n    | Toggle panel   |
| `<leader>ia` | n, v | Ask            |
| `<leader>ir` | n    | Refresh        |
| `<leader>if` | n    | Focus panel    |
| `<leader>ie` | v    | Edit selection |

## Language tools (`<leader>l*`)

| Key          | Mode | Description               | Scope                           |
| ------------ | ---- | ------------------------- | ------------------------------- |
| `<leader>ll` | n    | Run linter (nvim-lint)    | global                          |
| `<leader>lr` | n    | Toggle render-markdown    | buffer-local (markdown, Avante) |
| `<leader>lm` | n    | Toggle nabla math preview | buffer-local (tex, markdown)    |

## Neogen (`<leader>n*`)

| Key          | Mode | Description                       |
| ------------ | ---- | --------------------------------- |
| `<leader>na` | n    | Generate annotation (auto-detect) |
| `<leader>nc` | n    | Generate annotation (class)       |
| `<leader>nf` | n    | Generate annotation (function)    |
| `<leader>nF` | n    | Generate annotation (file)        |
| `<leader>nt` | n    | Generate annotation (type)        |

## Gitsigns (`<leader>g*`)

Keymaps are registered buffer-locally via `on_attach` in `lua/plugins/git.lua`.

| Key          | Mode | Description               |
| ------------ | ---- | ------------------------- |
| `]g`         | n    | Next hunk                 |
| `[g`         | n    | Previous hunk             |
| `<leader>gs` | n, v | Stage hunk                |
| `<leader>gr` | n, v | Reset hunk                |
| `<leader>gS` | n    | Stage buffer              |
| `<leader>gR` | n    | Reset buffer              |
| `<leader>gu` | n    | Undo stage hunk           |
| `<leader>gp` | n    | Preview hunk              |
| `<leader>gb` | n    | Blame line (full)         |
| `<leader>gB` | n    | Blame buffer              |
| `<leader>gd` | n    | Diff this                 |
| `<leader>gD` | n    | Diff this ~               |
| `<leader>gt` | n    | Toggle deleted            |
| `ih`         | o, x | Select hunk (text object) |

## LSP (`gr*`, `gd`, `gD`)

| Key         | Mode | Description                           |
| ----------- | ---- | ------------------------------------- |
| `gd`        | n    | Jump to definition                    |
| `gD`        | n    | Jump to declaration                   |
| `grt`       | n    | Jump to type definition               |
| `grn`       | n    | Rename symbol (built-in)              |
| `grr`       | n    | List references (quickfix)            |
| `gra`       | n    | Code action                           |
| `gri`       | n    | List implementations (quickfix)       |
| `grs`       | n    | List document symbols (location list) |
| `gO`        | n    | List buffer symbols (location list)   |
| `grf`       | n    | Format buffer (conform, LSP fallback) |
| `K`         | n    | Hover information                     |
| `<C-s>`     | i, s | Signature help                        |
| `<C-w>d`    | n    | Show diagnostic under cursor          |
| `[d` / `]d` | n    | Previous / next diagnostic            |
| `[D` / `]D` | n    | First / last diagnostic in buffer     |

## DAP (Debugger)

| Key        | Mode       | Description                    |
| ---------- | ---------- | ------------------------------ |
| `<F5>`     | n, i, v    | Continue / start debug session |
| `<F5>`     | s          | Debug selection (Python)       |
| `<C-F5>`   | n, i, v, s | Run to cursor                  |
| `<S-F5>`   | n, i, v, s | Stop debugger                  |
| `<C-S-F5>` | n, i, v, s | Restart debugger               |
| `<F9>`     | n, i, v, s | Toggle breakpoint              |
| `<S-F9>`   | n, i, v, s | Clear all breakpoints          |
| `<C-S-F9>` | n, i, v, s | Set conditional breakpoint     |
| `<F10>`    | n, i, v, s | Step over                      |
| `<F11>`    | n, i, v, s | Step into                      |
| `<S-F11>`  | n, i, v, s | Step out                       |
| `<F12>`    | n, i, v, s | Test method (Python)           |
| `<S-F12>`  | n, i, v, s | Test class (Python)            |
| `dr`       | n          | Toggle REPL                    |
| `dp`       | n          | Preview (widgets)              |
| `dK`       | n          | Hover (widgets)                |
| `du`       | n          | Toggle DAP UI                  |

## Treesitter (`gn*`)

| Key   | Mode | Description            |
| ----- | ---- | ---------------------- |
| `gnd` | n    | Go to definition       |
| `gnD` | n    | List definitions       |
| `gnO` | n    | List definitions (ToC) |
| `gnn` | n    | Go to next usage       |
| `gnp` | n    | Go to previous usage   |

## fzf-lua (`<leader>f*`)

### General

| Key                 | Description         |
| ------------------- | ------------------- |
| `<leader>f<leader>` | fzf overview        |
| `<leader>fb`        | Buffers             |
| `<leader>ff`        | Files               |
| `<leader>fh`        | File history        |
| `<leader>fl`        | Live grep (project) |
| `<leader>fq`        | Quickfix list       |
| `<leader>fr`        | Resume last search  |
| `<leader>fT`        | Tabs                |

### Diagnostics & LSP (`<leader>fd*`)

| Key               | Description                    |
| ----------------- | ------------------------------ |
| `<leader>fdr`     | References                     |
| `<leader>fdd`     | Definitions                    |
| `<leader>fdD`     | Declarations                   |
| `<leader>fdt`     | Type definitions               |
| `<leader>fdi`     | Implementations                |
| `<leader>fds`     | Document symbols               |
| `<leader>fdS`     | Workspace symbols              |
| `<leader>fd<C-s>` | Workspace symbols (live query) |
| `<leader>fdc`     | Incoming calls                 |
| `<leader>fdC`     | Outgoing calls                 |
| `<leader>fda`     | Code actions                   |
| `<leader>fdf`     | LSP finder (all locations)     |
| `<leader>fd<C-d>` | Document diagnostics           |
| `<leader>fd<C-w>` | Workspace diagnostics          |

### Git (`<leader>fg*`)

| Key           | Description       |
| ------------- | ----------------- |
| `<leader>fgf` | git ls-files      |
| `<leader>fgs` | git status        |
| `<leader>fgc` | git log (buffer)  |
| `<leader>fgC` | git log (project) |
| `<leader>fgb` | git branches      |
| `<leader>fgB` | git blame         |
| `<leader>fgt` | git tags          |
| `<leader>fgS` | git stash         |

### Search (`<leader>fs*`)

| Key           | Description              |
| ------------- | ------------------------ |
| `<leader>fsb` | Live grep current buffer |
| `<leader>fsq` | Live grep quickfix list  |
| `<leader>fsl` | Live grep location list  |
| `<leader>fst` | Live grep project tags   |
| `<leader>fsT` | Grep project tags        |
| `<leader>fsg` | Grep project             |
| `<leader>fsL` | Grep (last pattern)      |
| `<leader>fsw` | Grep word under cursor   |
| `<leader>fsW` | Grep WORD under cursor   |
| `<leader>fsv` | Grep visual selection    |
| `<leader>fsB` | Grep current buffer      |
| `<leader>fsQ` | Grep quickfix list       |
| `<leader>fsX` | Grep location list       |

### Tags (`<leader>ft*`)

| Key           | Description                 |
| ------------- | --------------------------- |
| `<leader>ftt` | Search project tags         |
| `<leader>ftb` | Search buffer tags          |
| `<leader>ftw` | Tags grep word under cursor |
| `<leader>ftW` | Tags grep WORD under cursor |
| `<leader>ftv` | Tags grep visual selection  |

### Extra (`<leader>fx*`)

| Key           | Description        |
| ------------- | ------------------ |
| `<leader>fxa` | Argument list      |
| `<leader>fxc` | Command history    |
| `<leader>fxl` | Location list      |
| `<leader>fxL` | Location stack     |
| `<leader>fxr` | Registers          |
| `<leader>fxs` | Search history     |
| `<leader>fxt` | Treesitter symbols |

## Trouble (`<leader>t*`)

| Key                | Description                    |
| ------------------ | ------------------------------ |
| `<leader>t<space>` | Open Trouble menu              |
| `<leader>tl`       | Toggle LSP (current buffer)    |
| `<leader>tL`       | Toggle LSP                     |
| `<leader>t<C-l>`   | Toggle location list           |
| `<leader>tq`       | Toggle quickfix                |
| `<leader>ts`       | Toggle document symbols        |
| `<leader>td`       | Toggle definitions             |
| `<leader>tD`       | Toggle declarations            |
| `<leader>t<C-d>d`  | Toggle diagnostics (buffer)    |
| `<leader>t<C-d>D`  | Toggle diagnostics (workspace) |
| `<leader>ti`       | Toggle implementations         |
| `<leader>tr`       | Toggle references              |

## Misc

| Key             | Mode       | Description                             |
| --------------- | ---------- | --------------------------------------- |
| `<leader>?`     | n          | Show buffer keymaps (which-key)         |
| `<leader>k`     | n          | Key Analyzer                            |
| `<A-t>`         | n, i, v, s | Toggle Twilight (focus mode)            |
| `<cr>`          | n, v       | Jump within visible lines (mini.jump2d) |
| `<A-1>`–`<A-0>` | i, s       | Accept 1st–10th completion item         |

## DAP Sign Legend

| Sign | Meaning                |
| ---- | ---------------------- |
| 🛑   | Breakpoint             |
| ❓   | Conditional breakpoint |
| ⭕   | Rejected breakpoint    |
| 🟡   | Stopped (current line) |
| 💬   | Log point              |

## Diagnostic Sign Legend

| Sign | Severity |
| ---- | -------- |
| `✗`  | Error    |
| `⚠`  | Warning  |
| `ℹ`  | Info     |
| `●`  | Hint     |

## Gitsigns Sign Legend

| Sign | Meaning      |
| ---- | ------------ |
| `+`  | Added line   |
| `~`  | Changed line |
| `_`  | Deleted line |
