local cmd, g = vim.cmd, vim.g
local o, ac, win, call =
	require("not-zen.options"), require("not-zen.autocmd"), require("not-zen.window"), require("not-zen.callback")

local M = {}

M.setup = function(config)
	M.config = config or {}
	M.config = require("not-zen.config").init(config)
	ac.create_augroup()
end

M.not_zen = function()
	if g.not_zen == nil then
		return
	end
	call.on_close()
	o.load_options()
	g.not_zen = nil
end

local zen = function()
	call.on_open()
	win.open_windows()
	g.not_zen = true
end

M.toggle = function()
	if g.not_zen == true then
		cmd.q()
	else
		zen()
	end
end

return M
