-- It is recommended to disable copilot.lua's suggestion and panel modules,
-- as they can interfere with completions properly appearing in copilot-cmp.
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
