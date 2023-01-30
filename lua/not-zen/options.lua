local o, opt_local, cmd = vim.o, vim.opt_local, vim.cmd
local M = {}

local saved_options = {}

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
	saved_options.fillchars = o.fillchars
	saved_options.laststatus = opt_local.laststatus
	saved_options.cmdheight = opt_local.cmdheight
end

M.restore_options = function()
	o.fillchars = saved_options.fillchars
	opt_local.laststatus = saved_options.laststatus
	opt_local.cmdheight = saved_options.cmdheight
end

M.set_options = function()
	save_options()
	o.fillchars = "stl: ,stlnc: ,vert: ,diff: ,msgsep: ,eob: "
	opt_local.laststatus = 0
	opt_local.cmdheight = 0
end

return M
