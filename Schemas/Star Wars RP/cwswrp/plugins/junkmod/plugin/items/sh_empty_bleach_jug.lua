--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Empty Bleach Jug";
ITEM.cost = 1;
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A bottle of no bleach, this is not dangerous stuff.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();