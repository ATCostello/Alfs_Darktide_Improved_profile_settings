local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

mod.global_profile_settings = mod:io_dofile(
	"Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/preset_JSON_string"
)

dbg_1 = mod
mod._profile_import_in_progress = false

mod.reimport_profile_settings = function()
	local extension = get_mod("Alfs_DMF_Extensions")

	if not extension or type(extension.import_profile_settings) ~= "function" then
		return
	end

	mod._profile_import_in_progress = true
	extension.import_profile_settings(mod)
	mod._profile_import_in_progress = false
end

mod.on_setting_changed = function(setting_id)
	if setting_id ~= "has_been_imported" or mod._profile_import_in_progress then
		return
	end

	local extension = get_mod("Alfs_DMF_Extensions")

	if not extension then
		return
	end

	if mod:get("has_been_imported") then
		mod.reimport_profile_settings()
	elseif type(extension.set_profile_import_state) == "function" then
		extension.set_profile_import_state(mod, false)
	end
end
