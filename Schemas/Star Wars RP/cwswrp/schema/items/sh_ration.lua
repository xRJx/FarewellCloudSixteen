local ITEM = Clockwork.item:New();

ITEM.name = "Ration";
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A tinned can with various nutrient supplements.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 5, 0, player:GetMaxHealth() ) );
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();