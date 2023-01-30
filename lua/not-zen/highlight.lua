local M = {}

M.main_win = function()
	local config = require("not-zen.config").config()
	vim.wo.winhighlight = config.winhighlight.main
end

return M
