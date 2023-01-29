local g = vim.g

if g.not_zen_loaded == 1 then
	return
else
	g.not_zen_loaded = 1
	g.not_zen = nil
end

vim.api.nvim_create_user_command("NotZen", function()
	require("not-zen").toggle()
end, {})
