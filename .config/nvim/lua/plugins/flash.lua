return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap as it conflicts with vim surround
    { "S", mode = { "n", "x", "o" }, false },
  },
}
