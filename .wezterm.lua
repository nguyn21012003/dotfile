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
local background_folder = user_home .. "/.config/nvim/backdrops"

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

config.window_background_image = user_home .. "/.config/nvim/backdrops/bg4.jpg"
-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#3c1361",
		"#52307c",
		"#663a82",
		"#7c5295",
		"#b491c8",
	}

	-- Foreground color for the text across the fade
	local text_fg = "#c0c0c0"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650
config.animation_fps = 144
config.window_decorations = "RESIZE"

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("Cascadia Code")
config.font_size = 11

config.max_fps = 120
config.window_background_opacity = 0.65
config.win32_system_backdrop = "Acrylic"
config.window_background_image_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 0.25,
}
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 10,
	right = 5,
	top = 10,
	bottom = 0,
}

config.default_cwd = "E:/codespace"
config.initial_cols = 170
config.initial_rows = 50

config.default_prog = { "pwsh.exe", "--nologo" }
config.front_end = "OpenGL"

------- zen vim
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then	
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
