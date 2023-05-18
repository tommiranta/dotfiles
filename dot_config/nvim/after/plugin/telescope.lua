-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

-- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- find files within current git reposiroty, respects .gitignore
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
-- find string in current working directory as you type
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
-- list available help tags
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
-- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
-- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
-- list current changes per file with diff preview ["gs" for git status]
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

telescope.load_extension("fzf")
