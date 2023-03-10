local cmd, g = vim.cmd, vim.g
local o, ac, w, call, cnf =
	require("not-zen.options"),
	require("not-zen.autocmd"),
	require("not-zen.window"),
	require("not-zen.callback"),
	require("not-zen.config")

local M = {}

M.setup = function(config)
	config = config or {}
	cnf.init(config)
end

M.open = function()
	if g.not_zen == true then
		return
	end
	w.create_layout()
	call.on_open()
	g.not_zen = true
end

M.close = function()
	if g.not_zen == nil then
		return
	end
	cmd.only()
	o.restore_options()
	ac.create_augroup()
	call.on_close()
	g.not_zen = nil
end

M.toggle = function(config)
	config = config or {}
	config = vim.tbl_deep_extend("keep", config, {
		callback = {
			on_open = true,
			on_close = true,
		},
	})
	g.not_zen_callback = config.callback
	if g.not_zen == true then
		cmd.q()
	else
		M.open()
	end
end

return M
