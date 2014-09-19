--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Milk Jugs";
ITEM.cost = 8;
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl";
ITEM.weight = 1;
ITEM.access = "v";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "A jug filled with delicious milk.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 10, 0, 100) );
	
	player:BoostAttribute(self.name, ATB_ENDURANCE, 2, 120);
	player:BoostAttribute(self.name, ATB_STRENGTH, 2, 120);
	
	player:GiveItem(Clockwork.item:CreateInstance("empty_milk_jug"));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();