-- check https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua#L314
-- for more info if this breaks.
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
      ██╗ ██████╗     ██╗██████╗ ██████╗ 
     ███║██╔═████╗   ██╔╝╚════██╗╚════██╗
     ╚██║██║██╔██║  ██╔╝  █████╔╝  ▄███╔╝
      ██║████╔╝██║ ██╔╝  ██╔═══╝   ▀▀══╝ 
      ██║╚██████╔╝██╔╝   ███████╗  ██╗   
      ╚═╝ ╚═════╝ ╚═╝    ╚══════╝  ╚═╝   
        ]],
        keys = {
          { icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header", gap = 1, padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
