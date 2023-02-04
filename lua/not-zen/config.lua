local M = {
	opts = {
		padding = {
			width = 0.25,
		},
		on_open = function() end,
		on_close = function() end,
		winhighlight = {
			main = "WinBar:Normal,NormalNC:Normal,WinBar:Normal,WinBarNC:Normal",
			padding = "Normal:NormalNC,WinBar:NormalNC",
		},
	},
}

M.init = function(opts)
	opts = opts or {}
	M.opts = vim.tbl_deep_extend("keep", opts, M.opts)
	return M.opts
end

return M
