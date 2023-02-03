# not-zen.nvim

One of them zen plugins

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
        on_open = nil, -- on_open callback function() end
        on_close = nil, -- on_close callback function() end
        winhighlight = {
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

### user commands

- `NotZenToggle`
  - Call not-zen normally
- `NotZenToggleNoCb`
  - Call not-zen ignoring cb
