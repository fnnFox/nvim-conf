require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "java", "markdown", "vim" },
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	fold = { enable = true },
}
