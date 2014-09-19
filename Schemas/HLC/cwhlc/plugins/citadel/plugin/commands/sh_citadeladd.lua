local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("CitadelAdd");
COMMAND.tip = "Add a scaled citadel at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_citadel");
	
	entity:SetPos(trace.HitPos + Vector(0, 0, 190));
	entity:Spawn();
	
	if ( IsValid(entity) ) then
		entity:SetAngles(Angle(0, player:EyeAngles().yaw + 180, 0));
		Clockwork.player:Notify(player, "You have added a citadel.");
	end;
	
	PLUGIN:SaveCitadels();
end;

COMMAND:Register();