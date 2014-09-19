local ITEM = Clockwork.item:New();

ITEM.name = "Bottled Water";
ITEM.cost = 10;
ITEM.model = "models/props_junk/glassbottle01a.mdl";
ITEM.weight = 0.5;
ITEM.access = "1";
ITEM.useText = "Drink";
ITEM.business = true;
ITEM.category = "Consumables";
ITEM.description = "A glass bottle filled with water.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetCharacterData("stamina", 100);
	player:SetHealth(math.Clamp(player:Health() + 4, 0, player:GetMaxHealth()));
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120);
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
	
	player:GiveItem(Clockwork.item:CreateInstance("empty_glass_bottle"));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();