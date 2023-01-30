local g = vim.g
local api = vim.api

if g.not_zen_loaded == 1 then
	return
else
	g.not_zen_loaded = 1
end

api.nvim_create_user_command("NotZen", function()
	require("not-zen").toggle()
end, {})

api.nvim_create_user_command("NotZenToggle", function()
	require("not-zen").toggle()
end, {})

api.nvim_create_user_command("NotZenOn", function()
	require("not-zen").on()
end, {})

api.nvim_create_user_command("NotZenOff", function()
	require("not-zen").off()
end, {})
