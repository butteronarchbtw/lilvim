--- lil-search.lua
--- https://github.com/mvllow/lilvim
---
--- Setup search.

local use = require("lil-helpers").use

use({
	"nvim-telescope/telescope.nvim",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		require("telescope").setup({})
	end,
})

-- Case-insensitive search, unless search contains uppercase.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clear search highlights.
vim.keymap.set("n", "<esc>", ":noh<cr>", {
	desc = "Clear search highlights",
	silent = true,
})

-- Keep position when searching for word under cursor.
vim.keymap.set("n", "*", "*N", { desc = "Search word", silent = true })
vim.keymap.set("v", "*", [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], {
	desc = "Search word",
	silent = true,
})

vim.keymap.set(
	"n",
	"<leader>f",
	"<cmd>Telescope find_files find_command=fd,-t,f,-H,-E,.git,--strip-cwd-prefix theme=dropdown previewer=false<cr>",
	{
		desc = "Find files",
		silent = true,
	}
)
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", {
	desc = "Search",
	silent = true,
})
vim.keymap.set("n", "<leader>p", "<cmd>Telescope commands theme=dropdown<cr>", {
	desc = "Command palette",
	silent = true,
})
