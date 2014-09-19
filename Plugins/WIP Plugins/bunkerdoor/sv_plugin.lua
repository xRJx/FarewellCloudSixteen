local PLUGIN = PLUGIN;

-- A function to load the union light.
function PLUGIN:LoadBunkerDoors()
	local bunkerDoors = Clockwork.kernel:RestoreSchemaData( "plugins/bunkerdoors/"..game.GetMap() );

	for k, v in pairs(bunkerDoors) do
		local entity = ents.Create("cw_bunkerdoor");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the union light.
function PLUGIN:SaveBunkerDoors()
	local bunkerDoors = {};

	for k, v in pairs( ents.FindByClass("cw_bunkerdoor") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if ( IsValid(physicsObject) ) then
			moveable = physicsObject:IsMoveable();
		end;
		
		bunkerDoors[#bunkerDoors + 1] = {
			key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/bunkerDoors/"..game.GetMap(), bunkerDoors);
end;