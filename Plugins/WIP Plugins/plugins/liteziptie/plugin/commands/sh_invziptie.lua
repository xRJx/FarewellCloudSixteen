local COMMAND = Clockwork.command:New("InvZipTie");
COMMAND.tip = "Use a zip tie from your inventory.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("zip_tie");
	
	if (!itemTable) then
		Clockwork.player:Notify(player, "You do not own a zip tie!");
		
		return;
	end;

	Clockwork.player:RunClockworkCommand(player, "InvAction", "use", itemTable("uniqueID"), tostring(itemTable("itemID")));
end;

COMMAND:Register();