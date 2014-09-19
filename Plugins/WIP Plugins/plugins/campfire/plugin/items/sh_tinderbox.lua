local ITEM = Clockwork.item:New();
ITEM.name = "Tinder Box";
ITEM.model = "models/props_junk/cardboard_box003a.mdl";
ITEM.weight = 2;
ITEM.access = "1v";
ITEM.business = true;
ITEM.description = "A box containing a few small logs and the means to create fire.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor();
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
		local entity = ents.Create("cw_campfire");
		
		entity:SetModel(self.model);
		entity:SetPos(trace.HitPos);
		entity:Spawn();
		
		if (IsValid(itemEntity)) then
			local physicsObject = itemEntity:GetPhysicsObject();
			
			entity:SetPos( itemEntity:GetPos() );
			entity:SetAngles( itemEntity:GetAngles() );
			
			if (IsValid(physicsObject)) then
				if (!physicsObject:IsMoveable()) then
					physicsObject = entity:GetPhysicsObject();
					
					if (IsValid(physicsObject)) then
						physicsObject:EnableMotion(false);
					end;
				end;
			end;
		else
			Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
		end;
	else
		Clockwork.player:Notify(player, "You cannot create a campfire that far away!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();