return {
    packages = {},
    run = function()
        fassert(rawget(_G, "new_mod"), "`Alfs_Darktide_Improved_profile_settings` encountered an error loading the Darktide Mod Framework.")
        new_mod("Alfs_Darktide_Improved_profile_settings", {
            mod_data = "Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/Alfs_Darktide_Improved_profile_settings_data",
            mod_localization = "Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/Alfs_Darktide_Improved_profile_settings_localization",
            mod_script = "Alfs_Darktide_Improved_profile_settings/scripts/mods/Alfs_Darktide_Improved_profile_settings/Alfs_Darktide_Improved_profile_settings",
        })
    end,
    load_after = {
        "dmf",
        "Alfs_DMF_Extensions",
    },
}
