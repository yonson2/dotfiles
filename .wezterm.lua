-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Custom config
config.color_scheme = 'catppuccin-mocha'
config.enable_scroll_bar = true
config.scrollback_lines = 20000
config.font_size = 13.3
config.warn_about_missing_glyphs = true
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = '3',
    mods = 'OPT',
    action = wezterm.action { SendString = "#" },
  },
  {
    key = '2',
    mods = 'OPT',
    action = wezterm.action { SendString = "€" },
  },
  {
    key = 'a',
    mods = 'OPT',
    action = wezterm.action { SendString = "á" },
  },
  {
    key = 'A',
    mods = 'OPT',
    action = wezterm.action { SendString = "Á" },
  },
  {
    key = 'e',
    mods = 'OPT',
    action = wezterm.action { SendString = "é" },
  },
  {
    key = 'E',
    mods = 'OPT',
    action = wezterm.action { SendString = "É" },
  },
  {
    key = 'i',
    mods = 'OPT',
    action = wezterm.action { SendString = "í" },
  },
  {
    key = '(',
    mods = 'OPT',
    action = wezterm.action { SendString = "Í" },
  },
  {
    key = 'o',
    mods = 'OPT',
    action = wezterm.action { SendString = "ó" },
  },
  {
    key = 'O',
    mods = 'OPT',
    action = wezterm.action { SendString = "Ó" },
  },
  {
    key = 'u',
    mods = 'OPT',
    action = wezterm.action { SendString = "ú" },
  },
  {
    key = 'U',
    mods = 'OPT',
    action = wezterm.action { SendString = "Ú" },
  },
  {
    key = 'n',
    mods = 'OPT',
    action = wezterm.action { SendString = "ñ" },
  },
}

--Font config
config.font = wezterm.font(
  { -- Normal text
    family = 'Monaspace Neon',
    harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
  })

config.font_rules = {
  { -- Italic
    intensity = 'Normal',
    italic = true,
    font = wezterm.font({
      family = "Monaspace Radon", -- script style
      harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
      weight = 'DemiBold',
      style = 'Italic',
    })
  },

  { -- Bold
    intensity = 'Bold',
    italic = false,
    font = wezterm.font({
      family = 'Monaspace Argon',
      harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
      -- weight='ExtraBold',
      weight = 'Bold',
    })
  },

  { -- Bold Italic
    intensity = 'Bold',
    italic = true,
    font = wezterm.font({
      family = 'Monaspace Radon',
      harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
      style = 'Italic',
      weight = 'ExtraBold',
    }
    )
  },
}

-- and finally, return the configuration to wezterm
return config
