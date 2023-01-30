local cmd, g = vim.cmd, vim.g
local o, ac, win, call, cnf =
	require("not-zen.options"),
	require("not-zen.autocmd"),
	require("not-zen.window"),
	require("not-zen.callback"),
	require("not-zen.config")

local M = {}

M.setup = function(config)
	config = config or {}
	cnf.init(config)
	ac.create_augroup()
end

M.off = function()
	if g.not_zen == nil then
		return
	end
	call.on_close()
	o.load_options()
	g.not_zen = nil
end

M.on = function()
	if g.not_zen == true then
		return
	end
	call.on_open()
	win.open_windows()
	g.not_zen = true
end

M.toggle = function()
	if g.not_zen == true then
		cmd.q()
	else
		M.on()
	end
end

return M
