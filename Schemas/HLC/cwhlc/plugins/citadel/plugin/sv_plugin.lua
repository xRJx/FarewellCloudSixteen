local PLUGIN = PLUGIN;

-- A function to load the stash items.
function PLUGIN:LoadCitadels()
	local citadels = Clockwork.kernel:RestoreSchemaData("plugins/citadels/"..game.GetMap());
	self.citadels = {};
	
	for k, v in pairs(citadels) do
		local entity = ents.Create("cw_citadel");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if ( IsValid(entity) ) then
			entity:SetAngles(v.angles);
		end;
	end;
	
end;

-- A function to save the stash items.
function PLUGIN:SaveCitadels()
	local citadels = {};
	
	for k, v in pairs(ents.FindByClass("cw_citadel")) do
		citadels[#citadels + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/citadels/"..game.GetMap(), citadels);
end;