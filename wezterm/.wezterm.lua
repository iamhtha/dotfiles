local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.colors = {
	foreground = "white",
	background = "black",
}
config.window_background_opacity = 0.75
config.font = wezterm.font("JetBrainsMono Nerd Font")
return config
