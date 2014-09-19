local ITEM = Clockwork.item:New();

local turretHealth = 5;

ITEM.name = "Automated Turret";
ITEM.cost = 200;
ITEM.model = "models/combine_turrets/floor_turret.mdl";
ITEM.weight = 4;
ITEM.useText = "Place";
ITEM.business = true;
ITEM.description = "A turret standing on three feet with automated targeting capabilities.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor(); -- Variable for getting where the player is looking.
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then -- Checks if the ground is less than or equal to 192 units away.
		local turret = ents.Create("npc_turret_floor"); -- Variable for spawning the turret NPC.
		
		turret:SetPos(trace.HitPos); -- Sets the turret's location to where the player is looking.
		turret:SetMaxHealth(turretHealth);
		turret:SetHealth(turretHealth); -- Sets the turret's health to the 'turretHealth' variable.
		turret:AddEntityRelationship(player, D_LI, 99); -- Makes the turret friendly towards the owner.
		turret:Spawn(); -- Initializes the turret.
		
		local physicsObject = turret:GetPhysicsObject(); -- Variable for the turret's physics.
	
		if (IsValid(physicsObject)) then -- Checks if the turret's physics is valid.
			physicsObject:Wake(); -- Initializes the turret's physics.
			physicsObject:EnableMotion(false); -- Makes the turret unmovable.
		end;
		
		if (IsValid(entity)) then
			entity:SetAngles(Angle(0, player:EyeAngles().yaw + 360, 0));
		end;
	else
		Clockwork.player:Notify(player, "You cannot place a turret that far away!"); -- If the player tries to place the turret over 192 units away, a message will be sent.
		
		return false; -- Stops the turret from being placed if the player tries to place the turret over 192 units away.
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();