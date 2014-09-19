local COMMAND = Clockwork.command:New("SchemeTake");
COMMAND.tip = "Take a character's scheme(s) away.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		if (!Schema:IsPlayerCombineRank(player, "RCT")) then
			local target = player:GetEyeTraceNoCursor().Entity;
			
			if (target and target:IsPlayer()) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetFaction() == FACTION_CITIZEN) then
						for k, v in pairs(PLUGIN.customSchemes) do
							Clockwork.player:TakeFlags(target, v);
						end;
						
						Clockwork.player:Notify(player, "You have taken this character's scheme(s)!");
					else
						Clockwork.player:Notify(player, "This character is not a citizen!");
					end;
				else
					Clockwork.player:Notify(player, "This character is too far away!");
				end;
			else
				Clockwork.player:Notify(player, "You must look at a character!");
			end;
		else
			Clockwork.player:Notify(player, "You are not ranked high enough for this!");
		end;
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();