local wezterm = require 'wezterm'
return {
  font = wezterm.font( 'JetBrains Mono',{weight = 'Bold', italic= true}),
   default_prog = { '/usr/bin/zsh', '-l' },
  color_scheme = "nightfox",
    window_background_opacity = 0.5,

}
