local M = {
	opts = {
		padding = {
			width = 25,
			use_percent = true,
		},
		on_open = nil,
		on_close = nil,
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
