local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharSwap");
COMMAND.tip = "Swap a character to a faction. (Isn't required to be whitelisted)";
COMMAND.text = "<string Name> <string Faction> [string Data]";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	
	if (target) then
		local faction = arguments[2];
		local name = target:Name();
		
		if (!Clockwork.faction.stored[faction]) then
			Clockwork.player:Notify(player, faction.." is not a valid faction!");
			return;
		end;
		
		local targetFaction = target:GetFaction();
		
		if (targetFaction == faction) then
			Clockwork.player:Notify(player, target:Name().." is already the "..faction.." faction!");
			return;
		end;
		
		if (!Clockwork.faction:IsGenderValid(faction, target:GetGender())) then
			Clockwork.player:Notify(player, target:Name().." is not the correct gender for the "..faction.." faction!");
			return;
		end;
		
		if (!Clockwork.faction.stored[faction].OnTransferred) then
			Clockwork.player:Notify(player, target:Name().." cannot be transferred to the "..faction.." faction!");
			return;
		end;
		
		local bSuccess, fault = Clockwork.faction.stored[faction]:OnTransferred(target, Clockwork.faction.stored[targetFaction], arguments[3]);
		
		if (bSuccess != false) then
			target:SetCharacterData("Faction", faction, true);
			
			Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
			Clockwork.player:NotifyAll(player:Name().." has swapped "..name.." to the "..faction.." faction.");
		else
			Clockwork.player:Notify(player, fault or target:Name().." could not be transferred to the "..faction.." faction!");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();