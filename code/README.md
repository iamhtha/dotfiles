# VS Code / VSCodium config

## Plugins

- [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim)
- [Gruvbox Theme](https://github.com/jdinhify/vscode-theme-gruvbox)

## Files

| File               | Purpose                                                             |
| ------------------ | ------------------------------------------------------------------- |
| `settings.json`    | Editor settings and vscode-neovim configuration                     |
| `keybindings.json` | Extra keybindings not handled by Neovim (Alt keys, debug shortcuts) |

## Dependencies

- **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)** — the font used by the editor (`editor.fontFamily` in `settings.json`). Install it system-wide before launching VSCodium. The Nerd Font variant is preferred for icon/glyph support.

## Neovim integration

When Neovim runs embedded inside VS Code (via the VSCode Neovim extension), it loads
`nvim/lua/plugins/vscode.lua` instead of the full plugin set. That file contains:

- `mini.surround`, `mini.jump`, `mini.jump2d`
- All leader/motion keymaps wired to VS Code commands via `require("vscode").action(...)`

`keybindings.json` handles the small number of keys that VS Code intercepts before
Neovim ever sees them:

| Key             | Action                     |
| --------------- | -------------------------- |
| `Alt+T`         | Toggle Zen Mode            |
| `Shift+F9`      | Remove all breakpoints     |
| `Ctrl+Shift+F9` | Add conditional breakpoint |
