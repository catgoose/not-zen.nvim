local g = vim.g

local M = {}

local do_call = function(call)
	if g.not_zen_callback[call] == true then
		local config = require("not-zen.config").opts
		if type(config[call]) == "function" then
			config[call]()
		end
	end
	g.not_zen_callback[call] = nil
end

M.on_open = function()
	do_call("on_open")
end

M.on_close = function()
	do_call("on_close")
end

return M
