return {
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
			keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set(
				"n",
				"<leader>sw",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Find string under cursor in cwd" }
			)
			keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Find in git files" })
			keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in git files" })
		end,
	},
}
