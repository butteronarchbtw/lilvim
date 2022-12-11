--- lil-ui.lua
--- https://github.com/mvllow/lilvim

--- Setup interface elements including colorscheme and statusline.

local use = require('lil-helpers').use

use({
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = 'all',
			highlight = { enable = true },
		})
	end,
})
use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		require('rose-pine').setup({ disable_italics = true })
		vim.cmd('colorscheme rose-pine')
	end,
})

vim.diagnostic.config({
	virtual_text = false,
})

vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 3
vim.opt.statusline = ' %f %M %= %l:%c ♥ '
vim.opt.shortmess:append('c')

-- Improve netrw defaults
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

-- Add virtual color column per line only when necessary
vim.cmd('hi LilColorColumn cterm=reverse gui=reverse')
vim.fn.matchadd('LilColorColumn', '\\%81v', 100)

-- Equally resize splits
vim.api.nvim_create_autocmd('VimResized', {
	command = 'tabdo wincmd =',
})

local opts = { silent = true }
vim.keymap.set('n', '<leader>e', ':Lex!<cr>', opts) -- toggle file explorer
