--[[
Name: "sh_melon.lua".
Product: "New Vegas".
--]]

ITEM = openAura.item:New();
ITEM.batch = 1;
ITEM.name = "Melon";
ITEM.cost = 1;
ITEM.model = "models/props_junk/watermelon01.mdl";
ITEM.weight = 0.35;
ITEM.access = "My";
ITEM.business = true;
ITEM.useText = "Eat";
ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
ITEM.category = "Consumables";
ITEM.description = "A green fruit, it has a hard outer shell.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 8, 0, 100) );
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 100, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") + 5);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);