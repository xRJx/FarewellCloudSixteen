--[[
Name: "sh_citizen_supplements.lua".
Product: "HL2 RP".
--]]

ITEM = openAura.item:New();
ITEM.batch = 1;
ITEM.name = "Citizen Supplements";
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A tinned can, it slushes when you shake it.";
ITEM.access = "My";
ITEM.business = true;
ITEM.cost = 2;


-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 5, 0, player:GetMaxHealth() ) );
	player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") - 100, 0, 100) );
	player:SetCharacterData("radiation", player:GetCharacterData("radiation") + 5);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);