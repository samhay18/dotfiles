local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()

local scheme = 'Dracula'
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]
config.color_scheme = scheme

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_decorations = 'RESIZE'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    }
  }
}

config_keys = {
  {
    key = '%',
    mods = 'CTRL|SHIFT|ALT',
    action = act.DisableDefaultAssignment,
  },
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = act.DisableDefaultAssignment,
  },
  {
    key = 'n',
    mods = 'ALT',
    action = act.SplitHorizontal {
      domain = 'CurrentPaneDomain',
    },
  },
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = act.ShowTabNavigator,
  },
  {
    key = 'R',
    mods = 'CMD|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}


-- config.font = wezterm.font 'HackNF'


config.default_prog = { 'fish' }

return config
