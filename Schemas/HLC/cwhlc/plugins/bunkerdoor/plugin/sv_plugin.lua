local PLUGIN = PLUGIN;

-- A function to load the bunker doors.
function PLUGIN:LoadBunkerDoors()
	local bunkerDoors = Clockwork.kernel:RestoreSchemaData( "plugins/bunkerdoors/"..game.GetMap() );

	for k, v in pairs(bunkerDoors) do
		local entity = ents.Create("cw_bunkerdoor");
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:SetLinkedFaction(v.linkedFaction);
		entity:Spawn();
		
		if (v.moveable == false) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
	
	for k, v in pairs(bunkerDoors) do
		for k2, v2 in pairs(ents.FindInSphere(v.position, 1)) do
			for k3, v3 in pairs(ents.FindInSphere(v.linkedPos, 1)) do
				if (v2:GetClass() == "cw_bunkerdoor" and v3:GetClass() == "cw_bunkerdoor") then
					v2:SetLinkedEnt(v3);
				end;
			end;
		end;
	end;
end;

-- A function to save the bunker doors.
function PLUGIN:SaveBunkerDoors()
	local bunkerDoors = {};
	
	for k, v in pairs(ents.FindByClass("cw_bunkerdoor")) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		bunkerDoors[#bunkerDoors + 1] = {
			angles = v:GetAngles(),
			moveable = moveable,
			position = v:GetPos(),
			linkedPos = v:GetLinkedEnt():GetPos(),
			linkedFaction = v:GetLinkedFaction()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/bunkerdoors/"..game.GetMap(), bunkerDoors);
end;