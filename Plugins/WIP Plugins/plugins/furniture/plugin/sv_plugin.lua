local PLUGIN = PLUGIN;

-- A function to load furniture.
function PLUGIN:LoadFurniture()
	local furniture = Clockwork.kernel:RestoreSchemaData( "plugins/furniture/"..game.GetMap() );
	
	for k, v in pairs(furniture) do
		local entity = ents.Create(v.class);
		
		if (IsValid(entity)) then
			entity:SetAngles(v.angles);
			entity:SetPos(v.position);
			entity:Spawn();
				
			local physicsObject = entity:GetPhysicsObject();
			
			if (!v.isLocked) then
				physicsObject:EnableMotion(true);
				entity:SetNetworkedBool("isLocked", false);
			else
				physicsObject:EnableMotion(false);
				entity:SetNetworkedBool("isLocked", true);
			end;
		end;
	end;
end;

-- A function to save furniture.
function PLUGIN:SaveFurniture()
	local furniture = {};
	
	for k, v in pairs( ents.FindByClass("cw_furniture_*") ) do
		local physicsObject = v:GetPhysicsObject();
		local locked = v:GetNetworkedBool("isLocked")
		
		furniture[#furniture + 1] = {
			key = Clockwork.entity:QueryProperty(v, "key"),
			class = v:GetClass(),
			angles = v:GetAngles(),
			isLocked = locked,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/furniture/"..game.GetMap(), furniture);
end;