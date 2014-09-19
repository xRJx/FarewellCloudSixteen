local PLUGIN = PLUGIN;

-- A function to load the bunker doors.
function PLUGIN:LoadBunkerDoors()
	local bunkerDoors = Clockwork.kernel:RestoreSchemaData( "plugins/bunkerdoors/"..game.GetMap() );

	for k, v in pairs(bunkerDoors) do
		local entity = ents.Create("cw_bunkerdoor");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		--entity:SetNWString("Parent-" .. v.creationID, v.parent);
		entity:SetNWString("Faction-" .. entity:GetCreationID(), v.faction);
		entity:Spawn();
		
		for k2, v2 in pairs( ents.FindInSphere(v.parentPos, 10) ) do
			if (v2 != "") then
				entity:SetNWString("parentPos-"..entity:GetCreationID(), v2:GetPos());
				entity:SetNWString("Parent-"..entity:GetCreationID(), v2);
			else
				entity:SetNWBool("isAdditional-"..entity:GetCreationID(), true);
			end;
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
	
	for k, v in pairs(bunkerDoors) do
		for k2, v2 in pairs( ents.FindInSphere(v.parentPos, 10) ) do
			for k3, v3 in pairs( ents.FindByClass("cw_bunkerdoor") ) do
				
			end;
		end;
	end;
end;

-- A function to save the bunker doors.
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
			parentPos = v:GetNWString("parentPos-"..v:GetCreationID()),
			parentAngles = v:GetNWString("parentPos-"..v:GetCreationID()),
			faction = v:GetNWString("Faction-"..v:GetCreationID())
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/bunkerdoors/"..game.GetMap(), bunkerDoors);
end;