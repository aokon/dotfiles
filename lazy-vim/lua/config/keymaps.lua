-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle theme
vim.keymap.set(
  "n",
  "<leader>bg",
  ':let &background = (&background == "dark" ? "light" : "dark")<CR>',
  { noremap = true, desc = "Change theme variant" }
)

-- Fast saving
vim.keymap.set("n", "<leader>bw", ":w<CR>", { noremap = true, desc = "Fast saving" })
