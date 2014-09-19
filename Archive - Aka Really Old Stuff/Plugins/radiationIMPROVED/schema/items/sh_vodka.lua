--[[
Name: "sh_beer.lua".
Product: "New Vegas".
--]]

ITEM = openAura.item:New();
ITEM.batch = 1;
ITEM.base = "alcohol_base";
ITEM.cost = 6;
ITEM.name = "Vodka";
ITEM.model = "models/stalker/item/food/vokda.mdl";
ITEM.weight = 0.25;
ITEM.access = "M59";
ITEM.business = true;
ITEM.description = "A glass bottle filled with russian vodka.";

-- Called when a player drinks the item.
function ITEM:OnDrink(player)
	player:UpdateInventory("empty_beer_bottle", 1, true);
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 50, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") - 20);

end;

openAura.item:Register(ITEM);