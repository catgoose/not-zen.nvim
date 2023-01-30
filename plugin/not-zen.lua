local g = vim.g
local api = vim.api

if g.not_zen_loaded == 1 then
	return
else
	g.not_zen_loaded = 1
	g.not_zen_callback = {
		on_open = true,
		on_close = true,
	}
end

api.nvim_create_user_command("NotZen", function()
	require("not-zen").toggle()
end, {})

api.nvim_create_user_command("NotZenToggle", function()
	require("not-zen").toggle()
end, {})

api.nvim_create_user_command("NotZenToggleNoCb", function()
	require("not-zen").toggle({
		callback = {
			on_open = false,
			on_close = false,
		},
	})
end, {})

api.nvim_create_user_command("NotZenOpen", function()
	require("not-zen").open()
end, {})

api.nvim_create_user_command("NotZenClose", function()
	require("not-zen").close()
end, {})
