local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- 設定変更を自動で読み込み
config.automatically_reload_config = true

-- 背景の透明度
config.window_background_opacity = 0.9

config.font_size = 12.5

config.use_ime = true

return config
