local PLUGIN = PLUGIN;

-- A function to load the radios.
function PLUGIN:LoadRadios()
	local radios = Clockwork.kernel:RestoreSchemaData( "plugins/radios/"..game.GetMap() );
	
	for k, v in pairs(radios) do
		local entity = ents.Create("cw_radio");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetFrequency(v.frequency);
			entity:SetOff(v.off);
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if (IsValid(physicsObject)) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the radios.
function PLUGIN:SaveRadios()
	local radios = {};
	
	for k, v in pairs( ents.FindByClass("cw_radio") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		radios[#radios + 1] = {
			off = v:IsOff(),
			key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
			frequency = v:GetFrequency()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/radios/"..game.GetMap(), radios);
end;