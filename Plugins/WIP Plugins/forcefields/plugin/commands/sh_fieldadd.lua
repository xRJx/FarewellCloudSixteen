local COMMAND = Clockwork.command:New("FieldAdd");

COMMAND.tip = "Add a Combine force field at your position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.text = "<bool Dissolve>";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	if (!trace.Hit) then return end

	local shouldDissolve = Clockwork.kernel:ToBool(arguments[1]);

	local whychessnut = ents.Create("cw_forcefield");
	local entity = whychessnut:SpawnFunction(player, trace)
	whychessnut:Remove()
	
	if (IsValid(entity)) then
		entity.shouldDissolve = shouldDissolve;
		Clockwork.player:Notify(player, "You have added a force field.");
	end;
end;

COMMAND:Register()