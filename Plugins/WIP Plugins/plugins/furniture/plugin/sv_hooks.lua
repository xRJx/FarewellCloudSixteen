local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadFurniture();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveFurniture();
end;

-- Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	local physicsObject = entity:GetPhysicsObject();
		
	if (arguments == "cw_furnitureUnlock") then
		physicsObject:EnableMotion(true);
		entity:SetNetworkedBool("isLocked", false);
	elseif (arguments == "cw_furnitureLock") then
		physicsObject:EnableMotion(false);
		entity:SetNetworkedBool("isLocked", true);
	end;
end;