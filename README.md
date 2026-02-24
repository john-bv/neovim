# Nvim config

I know this is messy but I plan on updating it to be better eventually.

## Install

Run `make` to install the font and copy config files:

```bash
make
```

Or separately:

```bash
make font     # installs JetBrainsMono Nerd Font via Homebrew
make install  # copies config to ~/.config/nvim/
make deps     # installs Rust toolchain + rust-analyzer and lua-language-server via Mason
```

> After installing the font, set **JetBrainsMono Nerd Font** in your terminal's font settings, otherwise nvim-tree icons will show as question marks.

I have `nvim .` open nvim-tree by default, so if you dont like that you can change it.

If you want to change any of this, i've tried making consilidating everything for the most part in `/lua/usr/conf` still working on that though.

## Keybinds

> `<leader>` is `Space`

### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>rt` | Toggle relative line numbers |

### File / Search

| Key | Action |
|-----|--------|
| `<leader>f` | Telescope: find files |
| `<leader>F` | Telescope: live grep |
| `<leader>t` | Telescope: theme picker |
| `Cmd+b` | Toggle nvim-tree |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `Ctrl+k` | Code action |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Rust 

| Key | Action |
|-----|--------|
| `<leader>a` | Rust code action |
| `K` | Rust hover actions (overrides LSP hover) |

### 99 (AI)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>9v` | Visual | Send selection as prompt |
| `<leader>9x` | Normal | Cancel all in-flight requests |
| `<leader>9s` | Normal | Search |
