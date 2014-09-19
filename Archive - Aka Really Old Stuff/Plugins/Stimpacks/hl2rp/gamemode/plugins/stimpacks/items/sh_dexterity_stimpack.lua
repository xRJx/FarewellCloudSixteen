--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.name = "Dexterity Stimpack";
ITEM.cost = 1750;
ITEM.model = "models/props_c17/trappropeller_lever.mdl";
ITEM.weight = 1;
ITEM.access = "U";
ITEM.useText = "Inject";
ITEM.category = "Stimpacks"
ITEM.business = true;
ITEM.description = "A Stimpack branded stimulator promising to enhance the body.\nThis stimpack permanently enhances your dexterity by ten points.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:UpdateAttribute(ATB_DEXTERITY, 10);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);