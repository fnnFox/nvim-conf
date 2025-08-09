return {
	'nvim-treesitter/nvim-treesitter',
	opts = {
		ensure_installed = { 'c', 'cpp', 'lua', 'java', 'markdown', 'vim' },
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		fold = { enable = true },
	},
}

