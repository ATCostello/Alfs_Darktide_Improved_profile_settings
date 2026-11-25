local mod = get_mod("Alfs_Darktide_Improved_profile_settings")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = false,
	options = {
		widgets = {
			{
				setting_id = "general_settings",
				type = "group",
				sub_widgets = {
					{
						setting_id = "mod_name_pizazz_toggle",
						type = "checkbox",
						default_value = true,
						tooltip = "mod_name_pizazz_tooltip",
					},
				},
			},
			{
				setting_id = "profile_settings",
				type = "group",
				sub_widgets = {
					{
						setting_id = "has_been_imported",
						type = "checkbox",
						default_value = false,
						tooltip = "has_been_imported_tooltip",
					},
					{
						setting_id = "reimport_profile_settings",
						type = "button",
						button_text = "reimport",
						function_name = "reimport_profile_settings",
						tooltip = "reimport_tooltip",
					},
				},
			},
		},
	},
}
