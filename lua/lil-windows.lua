---@tag lil-windows
---@signature require"lil-windows"
---@text Window management

--Create new windows in a more (subjectively) natural position
vim.o.splitbelow = true
vim.o.splitright = true

-- Simpler navigation between windows
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "Focus window to the left" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "Focus window below" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "Focus window above" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "Focus window to the right" })

vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("LilWindowsResize", { clear = true }),
	command = "tabdo wincmd =",
	desc = "Maintain window ratios after resize",
})
