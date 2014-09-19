--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Empty Red Can";
ITEM.cost = 1;
ITEM.skin = 1;
ITEM.model = "models/props_junk/popcan01a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A red aluminium can, it doesn't swish when you shake it.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();