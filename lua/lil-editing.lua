---
--- lil-editing.lua
--- https://github.com/mvllow/lilvim
---
--- Setup general editing options and keymaps
---
---@keymaps
--- |NORMAL|
--- <leader>yy : Copy to clipboard
--- <leader>pp : Paste from clipboard
--- j/k       : Navigate wrapped lines
--- gcc       : Comment line
--- |VISUAL|
--- gc        : Comment selection
---

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true

-- Continue wrapped lines with matching indentation
vim.o.breakindent = true
vim.o.linebreak = true
-- Visually show indented lines, e.g. if this line were to naturally wrap you
-- \\would see "\\" as demonstrated at the start of this line
vim.o.showbreak = [[\\]]

-- Persistent undo between sessions
vim.o.undofile = true

-- Start scrolling before reaching the edge of the screen
vim.o.scrolloff = 10

-- Highlight spaces, tabs and so on
vim.opt.list = true
vim.opt.listchars = "eol:↲,trail:󱁐,tab:» ,space:·"

-- Highlight line the cursor is on
vim.o.cursorline = true

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nvim does not call InsertLeave on <C-c>
-- which is problematic because <Esc> does
-- e.g. diagnostics do get displayed on InsertLeave which would not happen with
-- <C-c> normally, but with <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Copy and paste via clipboard
vim.keymap.set({ "n", "v" }, "<leader>yy", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>pp", '"+p', { desc = "Paste from clipboard" })

-- Navigate through wrapped lines via j/<down>, k/<up>
vim.keymap.set({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set({ "n", "v" }, "<up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set({ "n", "v" }, "<down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Indent line with selection
vim.keymap.set('v', '<', '<gv', { desc = 'Dedent line' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent line' })

-- Ident whole file at once
vim.keymap.set('n', '=', 'mxgg=G`x', { desc = 'Indent file' })
