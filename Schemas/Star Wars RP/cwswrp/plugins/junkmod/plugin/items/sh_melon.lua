--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Melon";
ITEM.cost = 8;
ITEM.model = "models/props_junk/watermelon01.mdl";
ITEM.weight = 1;
ITEM.access = "v";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "A green fruit, it has a hard outer shell.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 10, 0, 100) );
	
	player:BoostAttribute(self.name, ATB_ACROBATICS, 2, 120);
	player:BoostAttribute(self.name, ATB_AGILITY, 2, 120);
	
	player:GiveItem(Clockwork.item:CreateInstance("eaten_melon"));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();