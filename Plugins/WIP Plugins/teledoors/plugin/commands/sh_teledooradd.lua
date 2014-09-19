local COMMAND = Clockwork.command:New("TeledoorAdd");

COMMAND.tip = "Adds a teledoor set at your target location.";
COMMAND.text = "<string Model> <string Sound> <string Idle Animation> <string Open Animation>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 3;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local tr = player:GetEyeTraceNoCursor();
	local ent = ents.Create("cw_teledoor");
	local model = arguments[1];
	local sound = arguments[2];
	local idleAnimation = arguments[3];
	local openAnimation = arguments[4];
	
	ent:SpawnFunction(player, tr, model, sound, idleAnimation, openAnimation);
	
	if (IsValid(entity)) then
		Clockwork.player:Notify(player, "You have added a teledoor set.");
	end;
end;
--/teledooradd "models/props_silo/silo_door01.mdl" "doors/gate_move1.wav" "unlock" "lock"
--/teledooradd models/props_silo/silo_door01.mdl doors/gate_move1.wav unlock lock
COMMAND:Register();