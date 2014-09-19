--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Empty Soda Bottle";
ITEM.cost = 1;
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A plastic bottle, it's fairly big and filled with nothing.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();