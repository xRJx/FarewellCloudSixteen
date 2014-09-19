local openAura = openAura;

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- This just adds a nice tag so the developer (me, Spencer) can see if you're using the script, I like to see who uses my stuff. All it does is add a tag to the server.
function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end
	
	if (!string.find(GetConVarString('sv_tags'), "sf_forcefields")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_forcefields");
	end
end

-- A function to load the fields.
function PLUGIN:LoadFields()
	local fields = openAura:RestoreSchemaData( "plugins/ff/"..game.GetMap() );
	
	for k, v in pairs(fields) do
		local entity = ents.Create("aura_forcefield");
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		entity:Activate();
		entity:SpawnProps();
		entity:SetDissolve(v.dissolve);
		entity.policeOnly = v.policeOnly;

		local physicsObject = entity:GetPhysicsObject();
		
		if ( IsValid(physicsObject) ) then
			physicsObject:EnableMotion(false);
		end;
	end;
end;

-- A function to save the fields.
function PLUGIN:SaveFields()
	local fields = {};
	
	for k, v in pairs( ents.FindByClass("aura_forcefield") ) do
		local position = v:GetPos();
		local angles = v:GetAngles();
		local shouldDissolve = v:GetDissolve();
		local policeOnly = v.policeOnly or false;

		fields[#fields + 1] = {
			position = position,
			angles = angles,
			dissolve = shouldDissolve,
			policeOnly = policeOnly
		};
	end;
	
	openAura:SaveSchemaData("plugins/ff/"..game.GetMap(), fields);
end;

-- 10.07.2012 : added this http://facepunch.com/showthread.php?t=1195391&p=36691884&viewfull=1#post36691884
-- Called when OpenAura has loaded all of the entities.
function PLUGIN:OpenAuraInitPostEntity()
    self:LoadFields();
end;

-- Called when data should be saved.
function PLUGIN:PostSaveData()
	self:SaveFields();
end;