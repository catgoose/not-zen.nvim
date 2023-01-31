local M = {}

local augroup = require("not-zen.utils").create_augroup
local autocmd = vim.api.nvim_create_autocmd
local not_zen_augroup_name = "NotZenAuGroup"

local not_zen_augroup

M.create_augroup = function()
	return augroup(not_zen_augroup_name)
end

local quit_ac = function()
	autocmd({ "QuitPre" }, {
		group = not_zen_augroup,
		callback = function()
			require("not-zen").close()
		end,
	})
end

M.create_autocmds = function()
	not_zen_augroup = M.create_augroup()
	quit_ac()
end

return M
