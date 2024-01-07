require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
}

pcall(require("telescope").load_extension, "fzf")

-- Use <space>? to open list of recent files
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })

-- Use <space><space> to open list of open buffers
vim.keymap.set("n", "<leader><space>", function()
  require("telescope.builtin").buffers(require("telescope.themes").get_dropdown {
    previewer = false
  })
end, { desc = "[ ] Find open buffers" })

-- Use <space><space>p to open list of open buffers with preview
vim.keymap.set("n", "<leader><space>p", require("telescope.builtin").buffers, { desc = "[ p] Find open buffers" })

-- Use <space>/ to search in current buffer
vim.keymap.set("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false
  })
end, { desc = "[/] Fuzzily search in current buffer" })

-- Use <space>sf to search files
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
-- Use <space>sf to search help
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
-- Use <space>sw to search current word
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
-- Use <space>sw to search by grep
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

-- Use <space>gf to search in git files
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
-- Use <space>gs to list git status
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "[Git] [S]tatus" })
