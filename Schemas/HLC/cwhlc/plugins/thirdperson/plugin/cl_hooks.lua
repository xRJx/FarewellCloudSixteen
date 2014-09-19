local PLUGIN = PLUGIN;
local Clockwork = Clockwork;
Clockwork.kernel = Clockwork.kernel;

-- Called when the client initializes.
function PLUGIN:Initialize()
	CW_CONVAR_THIRDPERSON = Clockwork.kernel:CreateClientConVar("cwThirdPerson", 0, false, true);
end;

-- Called when a PLUGIN ConVar has changed.
function PLUGIN:ClockworkConVarChanged()
	if (CW_CONVAR_THIRDPERSON:GetInt() == 1) then
		RunConsoleCommand("chasecam", "1");
	else
		RunConsoleCommand("chasecam", "0");
	end;
end;