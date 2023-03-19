-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("n", "<Leader>m", ":b#<CR>") -- go to previous buffer
keymap.set("n", "<Leader>x", ":bd<CR>") -- close current buffer

keymap.set("n", "Y", "y$") -- yank to the end of the row

-- retain cursor position when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z")

keymap.set("x", "<leader>p", '"_dP') -- replace selected text with text in register

-- yank to + register
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", 'gg"+yG')

-- move selected rows up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete without adding to the register
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

keymap.set("n", "<leader>s", ":source $MYVIMRC<CR>") -- source vimrc
keymap.set("n", "<leader>e", ":Explore<CR>") -- open netrw
