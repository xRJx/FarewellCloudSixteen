local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("CraftItem");
COMMAND.tip = "Craft an item at your target position.";
COMMAND.text = "<string UniqueID>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local itemTable = Clockwork.item:FindByID(arguments[1]);
	
	if (!itemTable or (itemTable("isBaseItem") and !itemTable("crafting")) ) then
		return false;
	end;
	
	itemTable = Clockwork.item:CreateInstance(itemTable("uniqueID"));
	PLUGIN:PlayerAdjustCraftItemTable(player, itemTable);
	
	if (!Clockwork.kernel:HasObjectAccess(player, itemTable)) then
		Clockwork.player:Notify(player, "You not have access to craft this item!");
		return false;
	end;
	
	if (!PLUGIN:PlayerCanCraftItem(player, itemTable)) then
		return false;
	end;
	
	if (itemTable.AllowCraft) then
		if (itemTable:AllowCraft(player, itemTable)) then
			local trace = player:GetEyeTraceNoCursor();
			local entity = nil;

			if (itemTable.CanCraft and itemTable:CanCraft(player, v) == false) then
				return false;
			end;
			
			Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has crafted a "..itemTable("name")..".");
			
			if (itemTable.OnCraft) then
				itemTable:OnCraft(player, itemTable);
			end;
			
			PLUGIN:PlayerCraftItem(player, itemTable, entity);
			player.cwNextCraftTime = CurTime() + 2;
			
			Clockwork.datastream:Start(player, "CraftTime", player.cwNextCraftTime);
		else
			Clockwork.player:Notify(player, "You do not have the required materials to craft this!");
		end;
	end;
end;

COMMAND:Register();