# Dotfiles

## Dependencies

In case of usng `nvim.lua` as a primary config for the nvim, then following packages are required:

* [fzf](https://github.com/junegunn/fzf)
* [rg](https://github.com/BurntSushi/ripgrep)
* [fd](https://github.com/sharkdp/fd)

For WSL2 and linux distro following packages are required:
* xclip
* xdg-utils

## About

Package contains my personal development setup for unix systems.
It contains following options:

* Custom bash aliases
* gitignore rules
* ruby gems config / irb
* personal git config
* personal bash_aliases
* vim / nvim configs

## Vim / Nvim

### Set user config for coc

Run the command  to open your user configuration file.

```
:CocConfig
```

### Creating vim snippet

At the moment I'm using coc-snippets as a snippets engine.
If you want to create / update custom snippets run:

```
:CocCommand snippets.editSnippets
```
