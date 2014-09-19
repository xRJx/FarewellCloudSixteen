--[[
	Name: cl_auto.lua.
	Author: Snazzy.
--]]

local PLUGIN = PLUGIN;

-- Called when a player attempts to lock an entity.
function PLUGIN:PlayerCanLockEntity(player, entity)
	local doorName = openAura.entity:GetDoorName(entity);
	
	if(self.classDoors[doorName])then
		if(table.HasValue(self.classDoors[doorName], player:Team()))then
			return true;
		end;
	end;
end;

-- Called when a player attempts to unlock an entity.
function PLUGIN:PlayerCanUnlockEntity(player, entity)
	local doorName = openAura.entity:GetDoorName(entity);
	
	if(self.classDoors[doorName])then
		if(table.HasValue(self.classDoors[doorName], player:Team()))then
			return true;
		end;
	end;
end;
