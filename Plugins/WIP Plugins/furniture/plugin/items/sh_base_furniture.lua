local ITEM = Clockwork.item:New(nil, true);

ITEM.name = "Furniture Base";
ITEM.batch = 1;
ITEM.description = "A box full of furniture parts.";
ITEM.category = "Furniture";
ITEM.useText = "Assemble";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor();
	local entityName = self:GetEntityName();
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
		local entity = ents.Create(entityName);
		
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
		Clockwork.player:Notify(player, "You cannot drop furniture that far away!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();