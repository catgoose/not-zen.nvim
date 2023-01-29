local M = {
	opts = {
		padding = {
			width = 30,
		},
	},
}

M.init = function(opts)
	opts = opts or {}
	M.opts = vim.tbl_deep_extend("keep", opts, M.opts)
	return M.opts
end

return M
