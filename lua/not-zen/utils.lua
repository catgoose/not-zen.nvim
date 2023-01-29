local api = vim.api

local M = {}

M.create_cmd = function(command, f, opts)
	opts = opts or {}
	api.nvim_create_user_command(command, f, opts)
end

M.create_augroup = function(group, opts)
	opts = opts or { clear = true }
	return api.nvim_create_augroup(group, opts)
end

return M
