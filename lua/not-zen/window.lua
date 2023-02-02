local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local o = require("not-zen.options")
local hl = require("not-zen.highlight")
local ac = require("not-zen.autocmd")

local M = { win_ids = {} }

local get_width = function(config)
	local width = config.padding.width
	if config.padding.width > 0 and config.padding.width < 1 then
		width = math.floor(vim.o.columns * config.padding.width)
	end
	return width
end

local resize_pads = function()
	local config = require("not-zen.config").init()
	local width = get_width(config)
	api.nvim_win_set_width(M.win_ids.left, width)
	api.nvim_win_set_width(M.win_ids.right, width)
end

local new_pads = function(new_cmd, direction)
	cmd(new_cmd)
	local win_id = api.nvim_get_current_win()
	o.set_pad_options()
	hl.padding_wins()
	cmd("wincmd " .. direction)
	return win_id
end

M.create_layout = function()
	if fn.filereadable(fn.expand("%:p")) ~= 1 or g.not_zen == true then
		return
	end
	local cur_pos = fn.getpos(".")
	cmd.tabe("%")
	o.set_options()
	fn.setpos(".", cur_pos)
	hl.center_win()
	M.win_ids.center = api.nvim_get_current_win()
	M.win_ids.left = new_pads("leftabove vnew", "l")
	M.win_ids.right = new_pads("vnew", "h")
	resize_pads()
	ac.create_autocmds()
end

return M
