local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("SafeboxAdd");
COMMAND.tip = "Add a safebox at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(caller, arguments)
	local trace = caller:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_safebox");
	
	entity:SetPos(trace.HitPos + Vector(0, 0, 13));
	entity:Spawn();
	entity:AssignID();
	
	if ( IsValid(entity) ) then
		entity:SetAngles(Angle(0, caller:EyeAngles().yaw + 180, 0));
		Clockwork.player:Notify(caller, "You have added a safebox.");
	end;
	
	for k, v in pairs(player.GetAll()) do
		v:QueryCharacter("Data")[entity.ID.."safeboxcash"] = 0;
		v:QueryCharacter("Data")[entity.ID.."safeboxitems"] = {};
	end;
	
	PLUGIN:SavePersonalStorage();
end;

COMMAND:Register();