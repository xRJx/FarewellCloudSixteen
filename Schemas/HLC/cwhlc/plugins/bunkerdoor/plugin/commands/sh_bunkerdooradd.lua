local COMMAND = Clockwork.command:New("BunkerDoorAdd");

COMMAND.tip = "Adds a bunker door set at your target location.";
COMMAND.text = "<string Class|Faction>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local tr = player:GetEyeTraceNoCursor();
	local ent = ents.Create("cw_bunkerdoor");

	local faction = Clockwork.faction:FindByID(arguments[1]);
	local class = Clockwork.class:FindByID(arguments[1]);
	
	if (class or faction) then
		if (faction) then
			name = faction.name;
		else
			name = class.name;
		end;
		
		ent:SpawnFunction(player, tr, name);
	else
		ent:SpawnFunction(player, tr);
	end;
	
	if (IsValid(entity)) then
		Clockwork.player:Notify(player, "You have added a bunker door set.");
	end;
end;

COMMAND:Register();