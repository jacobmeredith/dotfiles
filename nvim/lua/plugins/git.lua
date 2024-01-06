return {
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		-- Does have ability to preview hunk changes - go to docs to see how to enable
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+", bg = nil, fg = nil },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "" },
			},
		},
	},
}
