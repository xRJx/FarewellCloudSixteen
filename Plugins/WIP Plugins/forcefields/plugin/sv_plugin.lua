local Clockwork = Clockwork;

local PLUGIN = PLUGIN;

-- A function to load the fields.
function PLUGIN:LoadFields()
	local fields = Clockwork.kernel:RestoreSchemaData("plugins/ff/"..game.GetMap());
	
	for k, v in pairs(fields) do
		local entity = ents.Create("cw_forcefield");
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		entity:Activate();
		entity:SpawnProps();
		entity.shouldissolve = v.dissolve;
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
	
	for k, v in pairs(ents.FindByClass("cw_forcefield")) do
		local position = v:GetPos();
		local angles = v:GetAngles();
		local shouldDissolve = v.shouldDissolve;
		local policeOnly = v.policeOnly or false;

		fields[#fields + 1] = {
			position = position,
			angles = angles,
			dissolve = shouldDissolve,
			policeOnly = policeOnly
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/ff/"..game.GetMap(), fields);
end;