-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- yank to the end of the row
vim.keymap.set("n", "Y", "y$")

-- retain cursor position when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- replace selected text with text in register
vim.keymap.set("x", "<leader>p", '"_dP')

-- yank to + register
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", 'gg"+yG')

-- delete without adding to the register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- tmux navigation needs to be set her in order to work
vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-\\>", ":NvimTmuxNavigateLastActive<CR>")
vim.keymap.set("n", "<C-Space>", ":NvimTmuxNavigateNext<CR>")

-- add newlines above and below
vim.keymap.set("n", "[o", "O<ESC>j", { desc = "Add newline above" })
vim.keymap.set("n", "]o", "o<ESC>k", { desc = "Add newline below" })
