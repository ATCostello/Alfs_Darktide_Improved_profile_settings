local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

local script_path = "Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/"
local gradient_text = mod:io_dofile(script_path .. "utils/gradient_text")

local title_colour = "200,140,20"

mod.gradientText = function(text, start_colour, end_colour, colour_spaces)
	if type(gradient_text) ~= "function" then
		return text
	end

	local gradient = gradient_text(text, start_colour, end_colour, colour_spaces) or ""

	return "{#color(" .. title_colour .. ")} " .. gradient .. "{#reset()}"
end

local mod_name = "Alf's Darktide Improved"
local pizazz_name = mod.gradientText(mod_name, { 0, 170, 255 }, { 0, 255, 170 }, true)

mod.localisation = {
	mod_name = { en = mod_name },
	mod_name_pizazz = { en = pizazz_name },
	mod_name_boring = { en = mod_name },
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
		en = "{#color(" .. title_colour .. ")}General Settings{#reset()}",
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
	local source = mod.localisation.mod_name_boring

	if mod:get("mod_name_pizazz_toggle") ~= false then
		source = mod.localisation.mod_name_pizazz
	end

	if type(source) ~= "table" then
		return
	end

	local names = mod.localisation.mod_name

	if type(names) ~= "table" then
		return
	end

	for language, name in pairs(source) do
		names[language] = name
	end
end

mod.toggle_pizazz()

return mod.localisation
