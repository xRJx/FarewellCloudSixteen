local ITEM = Clockwork.item:New();

ITEM.name = "Stamina Stimpack";
ITEM.cost = 5;
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Inject";
ITEM.category = "Consumables";
ITEM.description = "An injector used to revitalize your stamina.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetCharacterData("stamina", 100);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();