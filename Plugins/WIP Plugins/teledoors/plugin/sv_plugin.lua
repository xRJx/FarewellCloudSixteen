local PLUGIN = PLUGIN;

-- A function to load the union light.
function PLUGIN:LoadTeledoors()
	local teledoors= Clockwork.kernel:RestoreSchemaData( "plugins/teledoors/"..game.GetMap() );

	for k, v in pairs(teledoors) do
		local entity = ents.Create("cw_teledoor");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity.Model = v.model;
		entity.UseSound = "\""..v.sound.."\"";
		entity.IdleAnim = v.idleAnim;
		entity.OpenAnim = v.openAnim;
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:SetModel(v.model);
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
function PLUGIN:SaveTeledoors()
	local teledoors = {};

	for k, v in pairs( ents.FindByClass("cw_teledoor") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if ( IsValid(physicsObject) ) then
			moveable = physicsObject:IsMoveable();
		end;
		
		teledoors[#teledoors + 1] = {
			key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
			linkedPos = v.LinkedEnt:GetPos();
			model = v.Model,
			sound = v.UseSound,
			idleAnim = v.IdleAnim,
			openAnim = v.OpenAnim
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/teledoors/"..game.GetMap(), teledoors);
end;