# zsh config

Zsh configuration with plugins managed by [Antidote](https://github.com/mattmc3/antidote).

## Setup

1. Place `plugins.zsh` and `.zsh_plugins.txt` in your `ZDOTDIR` (e.g. `~/.config/zsh/`).
2. Source `plugins.zsh` from your `.zshrc`:

```zsh
 source "${ZDOTDIR:-~}/plugins.zsh"
```

3. On first run, Antidote will be cloned automatically (requires `git`). All plugins listed in `.zsh_plugins.txt` will be fetched from GitHub.

## Requirements

- [git](https://git-scm.com/)
- [starship](https://starship.rs)
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [eza](https://github.com/eza-community/eza)
- Clipboard backend
  - [wl-clipboard](https://github.com/bugaevc/wl-clipboard) for Wayland or [xclip](https://github.com/astrand/xclip) for X11

## Plugins

Plugins are declared in `.zsh_plugins.txt` and sourced via [Antidote](https://github.com/mattmc3/antidote).

| Plugin                    | Source                                                  |
| ------------------------- | ------------------------------------------------------- |
| `use-omz`                 | https://github.com/getantidote/use-omz                  |
| `clipboard.zsh`           | https://github.com/ohmyzsh/ohmyzsh (lib/clipboard.zsh)  |
| `sudo`                    | https://github.com/ohmyzsh/ohmyzsh (plugins/sudo)       |
| `copyfile`                | https://github.com/ohmyzsh/ohmyzsh (plugins/copyfile)   |
| `copybuffer`              | https://github.com/ohmyzsh/ohmyzsh (plugins/copybuffer) |
| `copypath`                | https://github.com/ohmyzsh/ohmyzsh (plugins/copypath)   |
| `dirhistory`              | https://github.com/ohmyzsh/ohmyzsh (plugins/dirhistory) |
| `zsh-vi-mode`             | https://github.com/jeffreytse/zsh-vi-mode               |
| `zsh-autosuggestions`     | https://github.com/zsh-users/zsh-autosuggestions        |
| `zsh-syntax-highlighting` | https://github.com/zsh-users/zsh-syntax-highlighting    |
