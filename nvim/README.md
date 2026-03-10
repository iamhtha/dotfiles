#  neovim

## Requirements

### Required

- `neovim >= 0.11.2`
- `git`, `curl` or `wget`, `unzip`, GNU `tar`, `gzip` — used by lazy.nvim and Mason to fetch and unpack plugins and tools
- `node` + `npm` — required to build avante.nvim and to run prettier, commitlint, markdownlint, and the TypeScript language server
- `make` — required to build avante.nvim

### Optional

- `cargo` — only needed if Mason cannot download a pre-built binary for rust-analyzer or stylua
- `uv` — Python package manager; required for Python DAP debugging via nvim-dap-python
- `zathura` — PDF viewer used by vimtex for LaTeX live preview. Any viewer supported by vimtex can be substituted by changing `vim.g.vimtex_view_method` in `languages.lua`.
- `lua` — standard Lua interpreter; only needed if you use the LaTeX or Markdown language features that invoke Lua scripts outside of Neovim itself.

### Neovim plugins

## Language support

| Language   | LSP            | Formatter    | Linter              | DAP                       |
| ---------- | -------------- | ------------ | ------------------- | ------------------------- |
| Python     | pyright + ruff | ruff_format  | mypy (nvim-lint)    | debugpy (nvim-dap-python) |
| Rust       | rust_analyzer  | rustfmt      | —                   | codelldb                  |
| C          | clangd         | clang-format | —                   | codelldb                  |
| C++        | clangd         | clang-format | —                   | codelldb                  |
| Go         | gopls          | gofmt        | golangci-lint       | delve                     |
| JavaScript | ts_ls          | prettier     | —                   | —                         |
| TypeScript | ts_ls          | prettier     | —                   | —                         |
| Bash / sh  | bashls         | shfmt        | shellcheck          | —                         |
| HTML       | html           | prettier     | —                   | —                         |
| CSS        | cssls          | prettier     | —                   | —                         |
| Markdown   | marksman       | prettier     | markdownlint        | —                         |
| LaTeX      | texlab         | —            | chktex (via texlab) | —                         |
| Lua        | lua_ls         | stylua       | —                   | —                         |

## AI tools

| Tool                                                    | Purpose                           | Provider       |
| ------------------------------------------------------- | --------------------------------- | -------------- |
| [sidekick.nvim](https://github.com/folke/sidekick.nvim) | NES (Next Edit Suggestions) + CLI | GitHub Copilot |
| [avante.nvim](https://github.com/yetone/avante.nvim)    | AI chat panel                     | GitHub Copilot |

Copilot LSP is provided by [copilot.lua](https://github.com/zbirenbaum/copilot.lua).

## Key plugins

| Plugin                 | Role                      |
| ---------------------- | ------------------------- |
| lazy.nvim              | Plugin manager            |
| mason.nvim             | LSP/DAP/tool installer    |
| nvim-lspconfig         | LSP client                |
| blink.cmp              | Completion                |
| LuaSnip                | Snippets                  |
| conform.nvim           | Formatting                |
| nvim-lint              | Linting                   |
| nvim-dap + nvim-dap-ui | Debugging                 |
| nvim-treesitter        | Syntax / navigation       |
| fzf-lua                | Fuzzy finding             |
| gitsigns.nvim          | Git hunk operations       |
| vim-fugitive           | Git commands              |
| trouble.nvim           | Diagnostics list          |
| which-key.nvim         | Keymap hints              |
| neogen                 | Annotation generator      |
| render-markdown.nvim   | Markdown preview (opt-in) |
| vimtex + nabla.nvim    | LaTeX (opt-in)            |
| overseer.nvim          | Task runner               |
| sniprun                | Code runner               |
| twilight.nvim          | Focus mode                |

## Keymaps

See [KEYMAPS.md](./KEYMAPS.md) for the full keymap reference.

## Structure

```
~/.config/nvim/
├── init.lua                    Entry point
├── KEYMAPS.md                  Full keymap reference
├── lua/
│   ├── settings.lua            Vim options, lazy.nvim setup, FileType rules
│   ├── keymaps.lua             Global keymaps (which-key)
│   ├── lsp.lua                 LSP server configs + diagnostic signs
│   └── plugins/
│       ├── code.lua            Core coding plugins (AI, completion, DAP, formatting, linting)
│       ├── languages.lua       Language-specific plugins (Markdown, LaTeX, Go, Lua DAP, TS)
│       ├── git.lua             Gitsigns + vim-fugitive
│       ├── visuals.lua         Colorscheme + lualine
│       ├── helpers.lua         UI helpers (which-key, fzf-lua, mini.*, etc.)
│       └── vscode.lua          VSCode Neovim overrides
```
