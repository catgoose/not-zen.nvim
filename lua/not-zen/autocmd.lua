local M = {}

local augroup = require("not-zen.utils").create_augroup
local autocmd = vim.api.nvim_create_autocmd
local not_zen_augroup_name = "NotZenAugroup"

M.not_zen_augroup = augroup(not_zen_augroup_name)

M.create_augroup = function()
	M.not_zen_augroup = augroup(not_zen_augroup_name)
end

M.quit_autocmd = function()
	autocmd({ "QuitPre" }, {
		group = M.not_zen_augroup,
		callback = function()
			require("not-zen").not_zen()
		end,
	})
end

return M
