local wezterm = require("wezterm")

local config = wezterm.config_builder()
local io = require("io")
local os = require("os")

local function pick_random_background(folder)
    local command = 'cmd /C "dir /B "' .. folder .. '""'
    local handle = io.popen(command)
    local files = handle:read("*a")
    handle:close()

    -- Split the output into file names
    local images = {}
    for file in files:gmatch("[^\r\n]+") do
        table.insert(images, file)
    end

    -- Return a random file path or nil if no images are found
    if #images > 0 then
        return folder .. "\\" .. images[math.random(#images)]
    end
    return nil
end

-- config image
local user_home = os.getenv("USERPROFILE")
local background_folder = user_home .. "/.config/nvim/bg"
-- local background_folder = user_home .. "/Users/Nguyen/Videos/wez"

-- config.window_background_image = user_home .. "/Desktop/ebeee.jpg"

--config.window_background_image = user_home .. "/.config/nvim/bg/bg7.jpg"
-- config.window_background_image = user_home .. "/Videos/wez/bg2.gif"

--config.background = {
--	{
--		source = { File = { path = user_home .. "/.config/nvim/bg/bg4.jpg" } },
--		opacity = 0.65,
--		width = "100%",
--		hsb = { brightness = 0.5 },
--	},
--}

config.window_background_opacity = 0.8
config.window_background_image_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 0.3,
}



config.keys = {
	{ key = "N", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "E", mods = "ALT|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "W", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local new_background = pick_random_background(background_folder)
            if new_background then
                window:set_config_overrides({
                    window_background_image = new_background,
                })
                wezterm.log_info("New bg:" .. new_background)
            else
                wezterm.log_error("Could not find bg image")
            end
        end),
    },
}

config.window_background_image = user_home .. "/.config/nvim/bg/bg1.jpg"
-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "🔋" .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format({
		{ Text = bat .. "   " .. date },
	}))
end)
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650
config.animation_fps = 240
config.window_decorations = "RESIZE"

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Cascadia Code")
config.font_size = 14

config.win32_system_backdrop = "Acrylic"

config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 5,
	right = 5,
	top = 10,
	bottom = 0,
}
config.default_cwd = "E:/codespace"
config.initial_cols = 140
config.initial_rows = 35

config.default_prog = { "pwsh.exe", "--nologo" }
config.front_end = "OpenGL"


return config
