return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = "┊",
		},
		scope = {
			enabled = true,
			char = "╎",
			show_start = true,
			show_end = true,
			show_exact_scope = true,
			-- highlight = { "Function", "Label" },
		},
	},
}
