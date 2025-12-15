return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason.nvim',
		'mason-org/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	event = { 'BufReadPre', 'BufNewFile' },

	config = function()
		require('mason-lspconfig').setup({
			ensure_installed = { 'clangd', 'lua_ls', 'intelephense' },
			automatic_enable = false,
		})

		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

		local default = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		lspconfig.clangd.setup(vim.tbl_deep_extend('force', default, {
			cmd = {
				-- 'clangd',
				"/home/fnnfox/.espressif/tools/esp-clang/esp-19.1.2_20250312/esp-clang/bin/clangd",
				"--header-insertion=never",
				"--query-driver=**",
				"--log=error",
				"--compile-commands-dir=build",
			},
		}))

		lspconfig.lua_ls.setup(vim.tbl_deep_extend('force', default, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				},
			},
		}))

		lspconfig.intelephense.setup(vim.tbl_deep_extend('force', default, {
			settings = {
				intelephense = {
					environment = {
						includePaths = { 'vendor' }
					}
				},
			},
		}))

		lspconfig.asm_lsp.setup({
			filetypes = { "asm", "s", "S" },
		})


		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}
