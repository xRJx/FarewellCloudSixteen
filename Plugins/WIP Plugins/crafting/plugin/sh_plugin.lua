local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

for k, v in pairs(file.Find(Clockwork.kernel:GetSchemaFolder().."/plugins/crafting/plugin/blueprints/*.lua", "LUA", "namedesc")) do
	Clockwork.kernel:IncludePrefixed(Clockwork.kernel:GetSchemaFolder().."/plugins/crafting/plugin/blueprints/"..v);
end;

Clockwork.option:SetKey("name_crafting", "Crafting");
Clockwork.option:SetKey("description_crafting", "Combine various items to make new items.");

Clockwork.config:ShareKey("crafting_cost");
Clockwork.config:ShareKey("craftingMenu");