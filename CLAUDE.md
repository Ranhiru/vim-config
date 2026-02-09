# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Vim/MacVim configuration using **dein.vim** as the plugin manager. The config is symlinked into the home directory via `install.sh`.

## Installation

```bash
./install.sh          # Symlinks .vimrc, .gvimrc, .vim/ to home directory
vim                   # Open vim, then run :call dein#install() to install plugins
brew install ack ag   # Required for Ack/Ag search plugin
```

Requires the [Meslo powerline font](https://github.com/Lokaltog/powerline-fonts).

## Architecture

### Config Loading Order

`.vimrc` loads configs in this sequence:
1. **dein.vim** bootstrap (auto-clones from GitHub if missing, caches to `~/.cache`)
2. `runtime! custom_preconfig/*.vim` - User overrides loaded first (e.g., mapleader changes)
3. `runtime! common_config/*.vim` - Shared config (checked into git)
4. `runtime! custom_config/*.vim` - User-specific config (gitignored)

### Key Files

- `.vimrc` - Entry point: dein bootstrap, colorscheme (Tomorrow-Night-Eighties), filetype/autocmd settings
- `.gvimrc` - GUI-specific settings (window size, font Monaco:h17, loads `custom_config/*.gvim`)
- `.vim/common_config/01_plugin_config.vim` - All plugin declarations and plugin-specific keymaps
- `.vim/common_config/general_config.vim` - Editor defaults (2-space tabs, splits, search, status line)
- `.vim/common_config/key_mappings.vim` - General keybindings
- `.vim/common_config/functions.vim` - Utility functions (StripTrailingWhitespaces, PasteAsCoffee, TrimEndLines)
- `.vim/common_config/just-one-space.vim` - JustOneSpace function
- `install.sh` - Shell script that symlinks config files to `~/`

### Customization

- `custom_preconfig/` and `custom_config/` directories are gitignored
- `.vim` files load in vim, `.gvim` files load in graphical vim only
- Common practice: symlink your personal config folder as `.vim/custom_config`

### Plugin Manager

Uses **dein.vim** (successor to NeoBundle). Plugins are declared with `call dein#add(...)` in `01_plugin_config.vim`. Search uses `rg` (ripgrep) via Ack plugin (`let g:ackprg = "rg ..."`). CtrlP uses `fd` for file listing. Completion via coc.nvim + UltiSnips + SuperTab.

### Notable Conventions

- Trailing whitespace is auto-stripped on save (`TrimEndLines` in `general_config.vim`)
- Leader key is default (`\`); can be overridden in `custom_preconfig/`
