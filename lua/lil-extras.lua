--- lil-extras.lua
--- https://github.com/mvllow/lilvim
---
--- Setup not so lil enhancements. This includes plugins to replace or improve
--- built-in functionality.

local use = require('lil-helpers').use

use({
	'folke/which-key.nvim',
	config = function()
		require('which-key').setup({
			plugins = {
				spelling = {
					enabled = true,
				},
			},
		})
	end,
})

use({
	'kyazdani42/nvim-tree.lua',
	config = function()
		require('nvim-tree').setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				-- Hide ".git" folder.
				custom = { '^.git$' },
			},
			git = {
				-- Do not hide gitignored files.
				ignore = false,
			},
			renderer = {
				icons = {
					-- Do not show tree icons.
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false,
					},
				},
			},
			trash = {
				-- Use cross-platform trash command.
				-- https://github.com/sindresorhus/trash-cli
				cmd = 'trash',
			},
			view = {
				mappings = {
					list = {
						-- Replace destructive default with trash command.
						{ key = 'd', action = 'trash' },
						{ key = 'D', action = 'remove' },
					},
				},
				side = 'right',
			},
		})
	end,
})

-- Toggle file tree at your current file.
vim.keymap.set(
	'n',
	'<leader>e',
	':NvimTreeFindFileToggle<cr>',
	{ silent = true, desc = 'Toggle file tree' }
)
