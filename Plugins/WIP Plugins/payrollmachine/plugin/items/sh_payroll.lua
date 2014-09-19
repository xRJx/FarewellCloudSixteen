local ITEM = Clockwork.item:New();

ITEM.name = "Payroll";
ITEM.model = "models/weapons/w_package.mdl";
ITEM.weight = 1;
ITEM.useText = "Open";
ITEM.description = "A purple container containing a unit's weekly payroll.";

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if (quickUse) then
		if (!player:CanHoldWeight(self.weight)) then
			Clockwork.player:Notify(player, "You do not have enough inventory space!");
			
			return false;
		end;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (Schema:PlayerIsCombine(player)) then
		local tokenAmount = 0;
		
		if (Schema:IsPlayerCombineRank(player, {"RCT"})) then
			tokenAmount = 50;
		elseif (Schema:IsPlayerCombineRank(player, {"05", "04", "03"})) then
			tokenAmount = 100;
		elseif (Schema:IsPlayerCombineRank(player, {"02", "01"})) then
			tokenAmount = 200;
		elseif (Schema:IsPlayerCombineRank(player, {"EpU"})) then
			tokenAmount = 350;
		elseif (Schema:IsPlayerCombineRank(player, {"OfC"})) then
			tokenAmount = 400;
		elseif (Schema:IsPlayerCombineRank(player, {"DvL"})) then
			tokenAmount = 600;
		end;
		
		Clockwork.player:GiveCash(player, tokenAmount, "payroll packet");
		
		Clockwork.plugin:Call("PlayerUsePayroll", player);
	elseif (player:GetFaction() == FACTION_ADMIN) then
		Clockwork.player:Notify(player, "You cannot open this payroll!");
		
		return false;
	else
		Clockwork.player:Notify(player, "You cannot open this payroll!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();