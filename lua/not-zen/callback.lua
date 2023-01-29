local M = {}

M.on_open = function()
	local config = require("not-zen.config").init()
	if type(config.on_open) == "function" then
		config.on_open()
	end
end

M.on_close = function()
	local config = require("not-zen.config").init()
	if type(config.on_open) == "function" then
		config.on_close()
	end
end

return M
