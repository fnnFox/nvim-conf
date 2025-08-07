local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
	vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
	local opts = { buffer = bufnr, noremap=true, silent=true }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
	vim.keymap.set({'n','v'}, '<leader>la', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
end

-- lspconfig.clangd.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = { 'clangd', '--background-index', '--compile-commands-dir=build' },
-- }

lspconfig.ccls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.intelephense.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		intelephense = {
			environment = {
				includePaths = { 'vendor' },
			},
		},
	},
}

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
