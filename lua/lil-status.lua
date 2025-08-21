local function lsp_status()
	local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #attached_clients == 0 then
		return ""
	end
	local it = vim.iter(attached_clients)
	it:map(function(client)
		local name = client.name:gsub("language.server", "ls")
		return name
	end)
	local names = it:totable()
	return string.format("[%s]", table.concat(names, ", "))
end

function _G.statusline()
	return table.concat({
		"%f",
		"%h%w%r%m",
		"%=",
		lsp_status(),
		" %l,%c ",
	})
end

vim.opt.statusline = "%{%v:lua._G.statusline()%}"
