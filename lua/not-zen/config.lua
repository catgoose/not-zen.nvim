local M = {
	opts = {
		padding = {
			width = 25,
			use_percent = true,
		},
		on_open = nil,
		on_close = nil,
		winhighlight = "NormalNC:Normal,WinSeparator:Normal,WinBarNC:Normal,MsgArea:Normal",
	},
}

M.init = function(opts)
	opts = opts or {}
	M.opts = vim.tbl_deep_extend("keep", opts, M.opts)
	return M.opts
end

M.config = function()
	return M.opts
end

return M
