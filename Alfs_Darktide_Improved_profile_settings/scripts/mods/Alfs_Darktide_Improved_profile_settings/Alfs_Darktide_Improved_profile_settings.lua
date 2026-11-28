local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

local script_path = "Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/"
local preset = mod:io_dofile(script_path .. "preset_JSON_string")

if type(preset) == "string" and preset ~= "" then
	mod.global_profile_settings = preset
end

mod:io_dofile(script_path .. "modules/profile_import")
