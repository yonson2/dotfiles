return {
  -- add oldworld
  -- {
  --   "dgox16/oldworld.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     styles = {
  --       booleans = { italic = true, bold = true },
  --       comments = { italic = true, bold = false },
  --       keywords = { italic = false, bold = true },
  --       identifiers = { italic = false, bold = true }, -- style for identifiers
  --       functions = { italic = true, bold = false },
  --       -- variables = {}, -- style for variables
  --     },
  --     highlight_overrides = {
  --       Constant = { fg = "#F5A26F" },
  --       PreProc = { fg = "#F5A26F" },
  --       Define = { fg = "#F5A26F" },
  --       Macro = { fg = "#F5A26F" },
  --       PreCondit = { fg = "#F5A26F" },
  --       Structure = { fg = "#F5A26F" },
  --       htmlTagName = { fg = "#F5A26F" },
  --       ["@namespace"] = { fg = "#F5A26F", italic = true },
  --       ["@tag"] = { fg = "#F5A26F" },
  --       ["@keyword.import"] = { fg = "#F5A26F" },
  --       ["@markup.link.label"] = { fg = "#F5A26F" },
  --     },
  --   },
  -- },
  -- add nordic
  -- Configure LazyVim to load a different colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
