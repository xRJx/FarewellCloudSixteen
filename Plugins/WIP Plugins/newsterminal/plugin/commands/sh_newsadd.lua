local COMMAND = Clockwork.command:New("NewsAdd");

COMMAND.tip = "Add a news terminal at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local entity = ents.Create("cw_news_terminal");
	
	entity:SetPos(trace.HitPos + Vector(0, 0, 1));
	entity:Spawn();
	
	if ( IsValid(entity) ) then
		entity:SetAngles(Angle(0, player:EyeAngles().yaw + 180, 0));
		
		Clockwork.player:Notify(player, "You have added a news terminal.");
	end;
end;

COMMAND:Register();