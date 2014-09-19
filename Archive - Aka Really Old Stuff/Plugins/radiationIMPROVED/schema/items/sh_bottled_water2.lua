--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.name = "Contaminated Bottled Water2";
ITEM.model = "models/props_junk/glassbottle01a.mdl";
ITEM.plural = "Bottled Waters2";
ITEM.weight = 0.5;
ITEM.useText = "Drink";
ITEM.access = "y";
ITEM.business = true;
ITEM.cost = 1;
ITEM.category = "Consumables"
ITEM.description = "A clear bottle, the liquid inside looks dirty and it seems to glow...";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 8, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") + 10);
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 25, 0, 100) );
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);