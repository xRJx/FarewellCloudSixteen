local COMMAND = Clockwork.command:New("ZombieAdd");
COMMAND.tip = "Spawns a zombie at your target location.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("npc_hlc_zombie");
	
	entity:SetPos(trace.HitPos + Vector(0, 0, 13));
	entity:Spawn();
	
	if ( IsValid(entity) ) then
		entity:SetAngles(Angle(0, player:EyeAngles().yaw + 180, 0));
		Clockwork.player:Notify(player, "You have added a zombie.");
	end;
end;

COMMAND:Register();