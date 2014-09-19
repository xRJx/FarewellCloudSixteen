local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

PLUGIN.customSchemes = {};

for k, v in pairs(file.Find("cwhlc/plugins/crafting/plugin/blueprints/*.lua", "LUA", "namedesc")) do
	Clockwork.kernel:IncludePrefixed("cwhlc/plugins/crafting/plugin/blueprints/"..v);
end;

Clockwork.option:SetKey("name_crafting", "Crafting");

Clockwork.config:ShareKey("crafting_cost");
Clockwork.config:ShareKey("schemes");

-- A function to add a custom scheme.
function PLUGIN:AddCustomScheme(name, flag, model)
	local formattedName = string.gsub(name, "[%s%p]", "");
	local lowerName = string.lower(name);
	
	self.customSchemes[ string.lower(formattedName) ] = {
		model = model,
		name = name,
		flag = flag,
		key = Clockwork.kernel:SetCamelCase(formattedName, true)
	};
end;