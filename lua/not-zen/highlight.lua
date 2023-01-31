local M = {}

local get_cfg = function()
	return require("not-zen.config").config()
end

M.center_win = function()
	vim.wo.winhighlight = get_cfg().winhighlight.main
end

M.padding_wins = function()
	vim.wo.winhighlight = get_cfg().winhighlight.padding
end

return M
