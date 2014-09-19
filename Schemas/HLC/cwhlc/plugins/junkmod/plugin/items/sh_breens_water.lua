local ITEM = Clockwork.item:New();

ITEM.name = "Blue Soda";
ITEM.cost = 10;
ITEM.model = "models/props_junk/popcan01a.mdl";
ITEM.weight = 0.5;
ITEM.access = "1";
ITEM.useText = "Drink";
ITEM.business = true;
ITEM.category = "Consumables";
ITEM.description = "A blue aluminium can, it swishes when you shake it.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetCharacterData("stamina", 100);
	player:SetHealth(math.Clamp(player:Health() + 4, 0, player:GetMaxHealth()));
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120);
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
	
	player:GiveItem(Clockwork.item:CreateInstance("empty_blue_can"));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

-- Called when the item's functions should be edited.
function ITEM:OnEditFunctions(functions)
	if (Schema:PlayerIsCombine(Clockwork.Client, false)) then
		for k, v in pairs(functions) do
			if (v == "Drink") then functions[k] = nil; end;
		end;
	end;
end;

ITEM:Register();