--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.name = "Heartbeat Implant";
ITEM.cost = 2000;
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.category = "Implants";
ITEM.business = true;
ITEM.description = "An implant that allows you to sense the heartbeats of others.";

-- Called when the item's local amount is needed.
function ITEM:GetLocalAmount(amount)
	if ( openAura.Client:GetSharedVar("implant") ) then
		return amount - 1;
	else
		return amount;
	end;
end;

-- Called to get whether a player has the item equipped.
function ITEM:HasPlayerEquipped(player, arguments)
	return player:GetSharedVar("implant");
end;

-- Called when a player has unequipped the item.
function ITEM:OnPlayerUnequipped(player, arguments)
	player:SetCharacterData("implant", nil);
	player:SetSharedVar("implant", false);
	
	player:UpdateInventory(self.uniqueID);
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if ( player:Alive() and !player:IsRagdolled() ) then
		player:SetCharacterData("implant", true);
		player:SetSharedVar("implant", true);
		
		player:UpdateInventory(self.uniqueID);
		
		if (itemEntity) then
			return true;
		end;
	else
		openAura.player:Notify(player, "You don't have permission to do this right now!");
	end;
	
	return false;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);