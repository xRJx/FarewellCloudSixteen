--[[
Name: "sh_melon.lua".
Product: "New Vegas".
--]]

ITEM = openAura.item:New();
ITEM.batch = 1;
ITEM.name = "Apple";
ITEM.cost = 1;
ITEM.model = "models/maniasfood/apple/apple.mdl";
ITEM.weight = 0.35;
ITEM.access = "y";
ITEM.business = true;
ITEM.useText = "Eat";
ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
ITEM.category = "Consumables";
ITEM.description = "A apple, it's old.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 8, 0, 100) );
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 100, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") + 10);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);