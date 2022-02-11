local defaults = require("rynkai.config").options
local hsluv = require("rynkai.hsluv")

local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

local function hexToRgb(hex_str)
	local hex = "[abcdef0-9][abcdef0-9]"
	local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
	hex_str = string.lower(hex_str)

	assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

	local r, g, b = string.match(hex_str, pat)
	return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function M.blend(fg, bg, alpha)
	bg = hexToRgb(bg)
	fg = hexToRgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, math.abs(amount))
end

function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, math.abs(amount))
end

function M.brighten(color, percentage)
	local hsl = hsluv.hex_to_hsluv(color)
	local larpSpace = 100 - hsl[3]
	if percentage < 0 then
		larpSpace = hsl[3]
	end
	hsl[3] = hsl[3] + larpSpace * percentage
	return hsluv.hsluv_to_hex(hsl)
end

M.set_lualine = function()
	local lualine = pcall("lualine")
	if lualine then
		lualine.setup({
			options = {
				theme = "rynkai",
			},
		})
	end
end

-- Change_style takes a style name as a parameter and switches to that style
M.change = function(style)
	M.set_lualine()
	defaults.theme = style
	vim.cmd([[colorscheme rynkai]])
end

M.get_next_theme = function()
	local themes = M.list_themes()
	for index, value in ipairs(themes) do
		if defaults.theme == value then
			return themes[(index % table.getn(themes)) + 1]
		end
	end
end

-- Toggle_style takes no parameters toggles the style on every function call
M.cycle = function(opts)
	local next_theme = M.get_next_theme()
	M.change(next_theme)
	if opts.override then
		M.change_theme(next_theme)
	end
end

M.file = function(mode, filepath, content)
	local data
	local fd = assert(vim.loop.fs_open(filepath, mode, 438))
	local stat = assert(vim.loop.fs_fstat(fd))
	if stat.type ~= "file" then
		data = false
	else
		if mode == "r" then
			data = assert(vim.loop.fs_read(fd, stat.size, 0))
		else
			assert(vim.loop.fs_write(fd, content, 0))
			data = true
		end
	end
	assert(vim.loop.fs_close(fd))
	return data
end

M.change_theme = function(current_theme, new_theme)
	if current_theme == new_theme then
		return
	end

	local file = vim.fn.stdpath("config") .. "/" .. defaults.config_file

	-- store in data variable
	local data = assert(M.file("r", file))
	-- escape characters which can be parsed as magic chars
	current_theme = current_theme:gsub("%p", "%%%0")
	new_theme = new_theme:gsub("%p", "%%%0")
	local find = "theme = .?" .. current_theme .. ".?"
	local replace = 'theme = "' .. new_theme .. '"'
	local content = string.gsub(data, find, replace)
	-- see if the find string exists in file
	if content == data then
		print("Error: Cannot change default theme with " .. new_theme .. ", edit " .. file .. " manually")
		return false
	else
		assert(M.file("w", file, content))
	end
end

M.set_schemes = function(colors)
	local base16 = {
		base00 = colors.bg,
		base01 = M.brighten(colors.bg, 0.04),
		base02 = M.brighten(colors.bg, 0.12),
		base03 = M.brighten(colors.bg, 0.22),
		base04 = M.lighten(colors.bg, 0.4),
		base05 = M.lighten(colors.bg, 0.6),
		base06 = M.brighten(colors.accent, 0.6),
		base07 = M.brighten(colors.accent, 0.8),
		base08 = M.darken(colors.accent, 0.8, colors.bg),
		base09 = colors.accent,
		base0A = colors.blue,
		base0B = colors.red,
		base0C = colors.orange,
		base0D = colors.yellow,
		base0E = colors.green,
		base0F = colors.purple,
	}
	return vim.tbl_deep_extend("keep", base16, colors)
end

M.list_themes = function(return_type)
	local themes = {}
	-- folder where theme files are stored
	local themes_folder = vim.fn.stdpath("data") .. defaults.rynkai_dir
	-- list all the contents of the folder and filter out files with .lua extension, then append to themes table
	local fd = vim.loop.fs_scandir(themes_folder)
	if fd then
		while true do
			local name, typ = vim.loop.fs_scandir_next(fd)
			if name == nil then
				break
			end
			if typ ~= "directory" and string.find(name, ".lua$") then
				-- return the table values as keys if specified
				if return_type == "keys_as_value" then
					themes[vim.fn.fnamemodify(name, ":r")] = true
				else
					table.insert(themes, vim.fn.fnamemodify(name, ":r"))
				end
			end
		end
	end
	return themes
end

return M
