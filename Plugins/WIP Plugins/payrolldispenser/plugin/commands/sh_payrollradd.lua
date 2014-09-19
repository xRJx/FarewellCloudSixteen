local COMMAND = Clockwork.command:New("PayrollAdd");

COMMAND.tip = "Add a payroll dispenser at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_payroll_dispenser");
	
	entity:SetPos(trace.HitPos);
	entity:Spawn();
	
	if (IsValid(entity)) then
		entity:SetAngles( Angle(0, player:EyeAngles().yaw + 180, 0) );
		
		Clockwork.player:Notify(player, "You have added a payroll dispenser.");
	end;
end;

COMMAND:Register();