local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git', '--branch=stable',
		lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{	'phaazon/hop.nvim' },
	{	'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
	},
	{	'nvim-treesitter/nvim-treesitter' },
	{	'neovim/nvim-lspconfig' },
	{	'hrsh7th/cmp-nvim-lsp' },
	{	'hrsh7th/cmp-buffer' },
	{	'hrsh7th/cmp-path' },
	{	'hrsh7th/cmp-cmdline' },
	{	'hrsh7th/nvim-cmp' },
	{	'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('kanagawa').setup({})
			vim.cmd('colorscheme kanagawa')
		end,
	},
	{	'windwp/nvim-autopairs',
		event = 'InsertEnter',
	},
	{	'numToStr/Comment.nvim', },
})
