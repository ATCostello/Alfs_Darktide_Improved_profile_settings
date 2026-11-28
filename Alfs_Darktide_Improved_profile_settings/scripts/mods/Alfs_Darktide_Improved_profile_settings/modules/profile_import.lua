local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

local function get_extension()
	return get_mod("Alfs_DMF_Extensions")
end

mod._profile_import_in_progress = mod._profile_import_in_progress or false

mod.reimport_profile_settings = function()
	local extension = get_extension()

	if type(extension) ~= "table" or type(extension.import_profile_settings) ~= "function" then
		return false
	end

	local previous_in_progress = mod._profile_import_in_progress

	mod._profile_import_in_progress = true
	local imported = extension.import_profile_settings(mod)
	mod._profile_import_in_progress = previous_in_progress

	return imported
end

mod.on_setting_changed = function(setting_id)
	if type(setting_id) ~= "string" or setting_id ~= "has_been_imported" or mod._profile_import_in_progress then
		return
	end

	if mod:get("has_been_imported") then
		mod.reimport_profile_settings()
		return
	end

	local extension = get_extension()

	if type(extension) == "table" and type(extension.set_profile_import_state) == "function" then
		extension.set_profile_import_state(mod, false)
	end
end
