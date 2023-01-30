local M = {}

--  TODO: 2023-01-29 - allow for configuraion of winhighlight string
M.winhighlight = function()
	local highlight = "NormalNC:Normal,WinSeparator:Normal,WinBarNC:Normal,MsgArea:Normal"
	vim.wo.winhighlight = highlight
end

return M
