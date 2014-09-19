local ITEM = Clockwork.item:New();

ITEM.name = "Notepad";
ITEM.cost = 5;
ITEM.model = "models/props_lab/clipboard.mdl";
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.business = true;
ITEM.description = "A clean notepad, useful to note taking.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTraceNoCursor();
	
	if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
		local entity = ents.Create("cw_notepad");
		
		Clockwork.player:GiveProperty(player, entity);
		
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
		Clockwork.player:Notify(player, "You cannot drop notepads that far away!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();