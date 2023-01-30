local M = {
	opts = {
		padding = {
			width = 25,
			use_percent = true,
		},
		on_open = nil,
		on_close = nil,
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
