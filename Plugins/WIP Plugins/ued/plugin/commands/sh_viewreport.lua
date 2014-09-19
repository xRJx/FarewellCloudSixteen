local COMMAND = Clockwork.command:New("ViewReport");

COMMAND.tip = "View reports about a given character.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		local target = Clockwork.player:FindByID( arguments[1] );
		
		if (target) then
			if (Schema:PlayerIsCombine(target)) then
				if (Schema:IsPlayerCombineRank(player, "UED")) then
					if (player != target) then
						Clockwork.datastream:Start( player, "EditReport", { target, target:GetCharacterData("combinereport") } );
						
						player.editReportAuthorised = target;
					else
						Clockwork.player:Notify(player, "You cannot view or edit your own reports!");
					end;
				else
					Clockwork.player:Notify(player, "<:: Access Denied ::>");
				end;
			else
				Clockwork.player:Notify(player, arguments[1].." is not the Combine!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();