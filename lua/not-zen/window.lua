local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local o = require("not-zen.options")
local hl = require("not-zen.highlight")
local ac = require("not-zen.autocmd")

--  TODO: 2023-01-30 - Create no-zen filetype/highlight groups to use to
--  customize window highlights for pads

local M = { win = {}, buf = {} }

local resize_pads = function()
	local config = require("not-zen.config").init()
	local width
	if config.padding.use_percent then
		width = math.floor(vim.o.columns * config.padding.width / 100)
	else
		width = config.padding.width
	end
	api.nvim_win_set_width(M.win.left, width)
	api.nvim_win_set_width(M.win.right, width)
end

local new_pads = function(new_cmd, direction)
	cmd(new_cmd)
	local win_id = api.nvim_get_current_win()
	o.set_pad_options()
	cmd("wincmd " .. direction)
	return win_id
end

M.create_layout = function()
	if fn.filereadable(fn.expand("%:p")) ~= 1 or g.not_zen == true then
		return
	end
	local cur_pos = fn.getpos(".")
	ac.quit_autocmd()
	cmd.tabe("%")
	o.set_options()
	fn.setpos(".", cur_pos)
	hl.main_win()
	M.win.main = api.nvim_get_current_win()
	M.buf.main = api.nvim_get_current_buf()
	M.win.left = new_pads("leftabove vnew", "l")
	M.win.right = new_pads("vnew", "h")
	resize_pads()
end

return M
