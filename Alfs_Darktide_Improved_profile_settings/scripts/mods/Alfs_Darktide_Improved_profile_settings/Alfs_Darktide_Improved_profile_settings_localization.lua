local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

local colours = {
	title = "200,140,20",
	subtitle = "226,199,126",
	text = "169,191,153",
}

local function lerp(a, b, t)
	return a + (b - a) * t
end

local function utf8_chars(s)
	local chars = {}

	for char in string.gmatch(s, "[%z\1-\127\194-\244][\128-\191]*") do
		table.insert(chars, char)
	end

	return chars
end

mod.gradientText = function(text, startColor, endColor, colorSpaces)
	local result = ""
	local chars = utf8_chars(text)
	local visibleIndex = 0

	for _, char in ipairs(chars) do
		if colorSpaces or char ~= " " then
			visibleIndex = visibleIndex + 1
		end
	end

	local currentIndex = 0

	for _, char in ipairs(chars) do
		if not colorSpaces and char == " " then
			result = result .. char
		else
			currentIndex = currentIndex + 1
			local t = visibleIndex <= 1 and 0 or (currentIndex - 1) / (visibleIndex - 1)
			local r = math.floor(lerp(startColor[1], endColor[1], t))
			local g = math.floor(lerp(startColor[2], endColor[2], t))
			local b = math.floor(lerp(startColor[3], endColor[3], t))

			result = result .. string.format("{#color(%d,%d,%d)}%s", r, g, b, char)
		end
	end

	return "{#color(" .. colours.title .. ")} " .. result .. "{#reset()}"
end

local mod_name = {
	en = "Alf's Darktide Improved",
}

mod.localisation = {
	mod_name = {
		en = mod_name.en,
	},
	mod_name_pizazz = {
		en = mod.gradientText(mod_name.en, { 0, 170, 255 }, { 0, 255, 170 }, true),
	},
	mod_name_boring = {
		en = mod_name.en,
	},
	mod_description = {
		en = "The settings profile for Alf's Darktide Improved mod collection.",
	},
	mod_name_pizazz_toggle = {
		en = "Enable Name Pizazz",
	},
	mod_name_pizazz_tooltip = {
		en = "Toggles the rainbow colours effect on the mod name text. Requires a reload.\nIf enabled, you will get a small euphoric experience everytime you scroll through the mod menu, \nIf disabled - you will be a John Darktide and have no rainbow sprinkles (but I'll love you anyway).",
	},
	general_settings = {
		en = "{#color(" .. colours.title .. ")}General Settings{#reset()}",
	},
	has_been_imported = {
		en = "Settings imported",
	},
	has_been_imported_tooltip = {
		en = "Turn this off to have the import prompt appear again next launch, or on to import the profile now.",
	},
	reimport = {
		en = "Click to import profile",
	},
	reimport_profile_settings = {
		en = "Reimport settings profile",
	},
	reimport_tooltip = {
		en = "Reapply this profile's settings now.",
	},
	profile_settings = {
		en = "Presets",
	},
}

mod.toggle_pizazz = function()
	for key, values in pairs(mod.localisation) do
		if key == "mod_name" then
			for language, _ in pairs(values) do
				if mod:get("mod_name_pizazz_toggle") and mod.localisation.mod_name_pizazz[language] then
					mod.localisation[key][language] = mod.localisation.mod_name_pizazz[language]
				else
					mod.localisation[key][language] = mod.localisation.mod_name_boring[language]
				end
			end
		end
	end
end

mod.toggle_pizazz()

return mod.localisation
