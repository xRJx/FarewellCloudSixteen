local COMMAND = Clockwork.command:New("BunkerDoorAdd");
COMMAND.tip = "Adds a bunker door set at your target location.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local tr = player:GetEyeTraceNoCursor();
	local ent = ents.Create("cw_bunkerdoor");
	
	ent:SpawnFunction(player, tr);
	
	if (IsValid(entity)) then
		Clockwork.player:Notify(player, "You have added a bunker door set.");
	end;
end;

--[[ Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_bunkerdoor");
	
	entity:SetPos(trace.HitPos);
	entity:Spawn();
	
	if (IsValid(entity)) then
		entity:SetAngles( Angle(0, player:EyeAngles().yaw + 90, 0) );
		
		Clockwork.player:Notify(player, "You have added a bunker door set.");
	end;
end;]]--

COMMAND:Register();