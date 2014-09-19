--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Empty Vegetable Oil Bottle";
ITEM.cost = 1;
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.business = true;
ITEM.category = "Junk";
ITEM.description = "A bottle of no vegetable oil, it tastes like air.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();