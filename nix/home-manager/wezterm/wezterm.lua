local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- 背景の透明度
config.window_background_opacity = 0.9

-- changing the font size and color scheme.
--config.font_size = 10
--config.color_scheme = 'AdventureTime'

return config
