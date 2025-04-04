-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "standardrb"

vim.opt.textwidth = 140

-- wrap long lines
vim.o.wrap = false

-- indent at the same level of the previous line
vim.o.autoindent = true

-- smart autoindenting for C programs
vim.o.smartindent = true

-- use indents of 2 spaces
vim.o.shiftwidth = 2

-- don't use tabs
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.cmd([[
  set directory=$HOME/.vim/tmp/
  set nobackup
  set nowritebackup
]])

vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

vim.cmd([[autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab]])

vim.cmd([[let g:python3_host_prog = "$HOME/.asdf/shims/python3"]])
