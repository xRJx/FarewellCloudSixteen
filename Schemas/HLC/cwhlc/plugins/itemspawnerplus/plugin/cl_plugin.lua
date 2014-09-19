local PLUGIN = PLUGIN;

Clockwork.setting:AddCheckBox("Framework", "Enable item spawn ESP.", "cwItemSpawnESP", "Whether or not to enable the item spawn ESP.", function()
	return Clockwork.Client:IsSuperAdmin();
end);