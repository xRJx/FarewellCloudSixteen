--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Empty Jar";
ITEM.cost = 1;
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A tinned can, it doesn't slush when you shake it.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();