--- init.lua
--- https://github.com/mvllow/lilvim
---
--- Combines all modules of lilvim.

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git", "clone", "--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim", mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })

-- Set leader key before loading modules for accurate mappings
vim.g.mapleader = " "

-- Modules
require("lil-editing")
require("lil-grep")
require("lil-lsp")
require("lil-search")
require("lil-places")
require("lil-quickfix")
require("lil-status")
require("lil-ft")

MiniDeps.add("rose-pine/neovim")
vim.cmd "colorscheme rose-pine"

MiniDeps.add("nvim-treesitter/nvim-treesitter")
require "nvim-treesitter.configs".setup {
	auto_install = true,
}
