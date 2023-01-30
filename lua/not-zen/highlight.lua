local M = {}

M.winhighlight = function()
	local config = require("not-zen.config").config()
	vim.wo.winhighlight = config.winhighlight
end

return M
