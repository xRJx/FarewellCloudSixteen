--[[
Name: "sh_beer.lua".
Product: "New Vegas".
--]]

ITEM = openAura.item:New();
ITEM.batch = 1;
ITEM.base = "alcohol_base";
ITEM.cost = 3;
ITEM.name = "Beer";
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl";
ITEM.weight = 0.25;
ITEM.access = "M";
ITEM.business = true;
ITEM.description = "A glass bottle filled with liquid, it has a funny smell.";

-- Called when a player drinks the item.
function ITEM:OnDrink(player)
	player:UpdateInventory("empty_beer_bottle", 1, true);
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 50, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") - 10);
end;

openAura.item:Register(ITEM);