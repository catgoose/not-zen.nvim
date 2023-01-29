local o, opt_local, cmd = vim.o, vim.opt_local, vim.cmd
local ac = require("not-zen.autocmd")
local M = {}

local options = {}

local pad_options = {
	bo = {
		buftype = "nofile",
		bufhidden = "hide",
		modifiable = false,
		buflisted = false,
		swapfile = false,
	},
	wo = {
		number = false,
		cursorline = false,
		list = false,
	},
}

M.set_pad_options = function()
	for opt_type, _ in pairs(pad_options) do
		for opt, val in pairs(pad_options[opt_type]) do
			vim[opt_type][opt] = val
		end
	end
end

local save_options = function()
	options.fillchars = o.fillchars
	options.laststatus = opt_local.laststatus
	options.cmdheight = opt_local.cmdheight
end

M.load_options = function()
	ac.create_augroup()
	cmd.only()
	o.fillchars = options.fillchars
	opt_local.laststatus = options.laststatus
	opt_local.cmdheight = options.cmdheight
end

M.set_options = function()
	save_options()
	o.fillchars = "stl: ,stlnc: ,vert: ,diff: ,msgsep: ,eob: "
	opt_local.laststatus = 0
	opt_local.cmdheight = 0
end

return M
