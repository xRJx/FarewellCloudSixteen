--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Whiskey";
ITEM.cost = 13;
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl";
ITEM.weight = 1.2;
ITEM.access = "w";
ITEM.business = true;
ITEM.attributes = {Stamina = 2};
ITEM.description = "A brown colored whiskey bottle, be careful!";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:GiveItem(Clockwork.item:CreateInstance("empty_bagged_bottle"));
end;

ITEM:Register();