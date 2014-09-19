--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- A function to load the static props.
function PLUGIN:LoadStaticProps()
	self.staticProps = openAura:RestoreSchemaData( "plugins/props/"..game.GetMap() );
	
	for k, v in pairs(self.staticProps) do
		if not v.class then v.class = "prop_physics"; end
		local entity = ents.Create(v.class);
		
		entity:SetAngles(v.angles);
		entity:SetModel(v.model);
		entity:SetPos(v.position);
		entity:Spawn();		
		
		openAura.entity:MakeSafe(entity, true, true, true);
		self.staticProps[k] = entity;
	end;
end;

-- A function to save the static props.
function PLUGIN:SaveStaticProps()
	local staticProps = {};
	
	for k, v in pairs(self.staticProps) do
		if ( IsValid(v) ) then
			staticProps[#staticProps + 1] = {
				class = v:GetClass(),
				model = v:GetModel(),
				angles = v:GetAngles(),
				position = v:GetPos()
			};
		end;
	end;
	
	openAura:SaveSchemaData("plugins/props/"..game.GetMap(), staticProps);
end;