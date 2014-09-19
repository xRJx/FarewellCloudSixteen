local ITEM = Clockwork.item:New();

ITEM.name = "Designator";
ITEM.category = "Uniforms";
ITEM.weight = 0.5;
ITEM.business = false;
ITEM.description = "A device used for designating uniforms.";
ITEM.model = "models/gibs/manhack_gib02.mdl";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (player:HasItemByID("civil_protection_uniform") and !player:FindItemByID("civil_protection_uniform"):GetData("designated")) then
		Clockwork.datastream:Start(player, "DesignateUniform");
	else
		Clockwork.player:Notify(player, "You have no uniforms to designate!");
	end;
	
	return false;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();