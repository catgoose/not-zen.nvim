local cmd, g, api, fn = vim.cmd, vim.g, vim.api, vim.fn
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

M.close = function()
	if g.not_zen == nil then
		return
	end
	local cur_pos = fn.getpos(".")
	local buf_id = vim.api.nvim_get_current_buf()
	cmd.only()
	vim.schedule(function()
		api.nvim_win_set_buf(0, buf_id)
		fn.setpos(".", cur_pos)
	end)
	ac.create_augroup()
	o.restore_options()
	call.on_close()
	g.not_zen = nil
end

M.open = function()
	if g.not_zen == true then
		return
	end
	win.create_layout()
	call.on_open()
	g.not_zen = true
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
