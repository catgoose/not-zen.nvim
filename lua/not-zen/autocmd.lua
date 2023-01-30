local M = {}

local augroup = require("not-zen.utils").create_augroup
local autocmd = vim.api.nvim_create_autocmd
local not_zen_augroup_name = "NotZenQuitOff"

M.create_augroup = function()
	M.not_zen_augroup = augroup(not_zen_augroup_name)
end

--  TODO: 2023-01-30 - create autocmd to return to win.main when pads are
--  selected.  It can match pattern by custom filetype

M.quit_autocmd = function()
	autocmd({ "QuitPre" }, {
		group = M.not_zen_augroup,
		callback = function()
			require("not-zen").close()
		end,
	})
end

return M
