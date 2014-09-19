--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Eaten Melon";
ITEM.cost = 1;
ITEM.model = "models/props_junk/watermelon01_chunk01b.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A green fruit, it has a hard outer shell and has been eaten.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();