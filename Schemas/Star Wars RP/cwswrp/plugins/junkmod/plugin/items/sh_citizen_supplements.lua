--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Citizen Supplements";
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A tinned can, it slushes when you shake it.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 5, 0, player:GetMaxHealth() ) );
	
	player:GiveItem(Clockwork.item:CreateInstance("empty_jar"));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();