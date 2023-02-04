# not-zen.nvim

`zen is not zen, it is only called that`

## Zen

![Screenshot](https://raw.githubusercontent.com/catgoose/not-zen.nvim/images/images/zen.png)

## Not Zen

![Screenshot](https://raw.githubusercontent.com/catgoose/not-zen.nvim/images/images/not-zen.png)

## Setup

### lazy.nvim

```lua
return {
    "catgoose/not-zen.nvim",
    opts = {
        padding = {
            width = 0.25, -- 0 > width < 1 is interpreted as percent
            -- of screen width, otherwise in columns
        },
        on_open = function() end, -- on_open callback
        on_close = function() end, -- on_close callback
        winhighlight = { -- highlights for main and padding
            main = "WinBar:Normal,NormalNC:Normal,WinBar:Normal,WinBarNC:Normal",
            padding = "Normal:NormalNC,WinBar:NormalNC",
        },
    },
    event = "BufReadPre"
}
```

### example config

```lua
local opts = {
    padding = {
        width = 0.2,
    },
    on_open = function()
        cmd("silent !tmux set status off")
        cmd("silent !i3-msg fullscreen enable")
        end,
    on_close = function()
        cmd("silent !tmux set status on")
        cmd("silent !i3-msg fullscreen disable")
        end,
}
```

### globals

`vim.g.not_zen`

- use to disable statusbar/winbar in heirline, lualine, etc

### user commands

- `NotZenToggle`
  - Call not-zen normally
- `NotZenToggleNoCb`
  - Call not-zen ignoring cb
