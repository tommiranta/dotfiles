-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"gopls",
		"pyright",
		"lua_ls",
		"terraformls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- go
		"golangci_lint",
		"gofmt",
		"goimports",
		"golines",
		-- python
		"flake8",
		"pydocstyle",
		"isort",
		"black",
		-- sql
		"sqlfluff",
		-- shell and make
		"checkmake",
		"beautysh",
		-- lua
		"luacheck",
		"stylua",
		-- json, yaml, markdown
		"jsonlint",
		"markdownlint",
		"write_good",
		"yamllint",
		"prettier",
		-- terraform
		"terraform_fmt",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
