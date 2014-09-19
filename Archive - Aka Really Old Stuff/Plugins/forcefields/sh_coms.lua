local openAura = openAura;

local PLUGIN = PLUGIN;

local COMMAND = {};
COMMAND.tip = "Add a Combine force field at your position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.text = "<bool Dissolve>";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local shouldDissolve = openAura:ToBool( table.concat(arguments, " ") );
	local entity = ents.Create("aura_forcefield");
	entity:SpawnFunction(player, trace);
	
	if ( IsValid(entity) ) then
		entity:SetDissolve(shouldDissolve);
		
		openAura.player:Notify(player, "You have added a force field.");
	end;
end;

openAura.command:Register(COMMAND, "FieldAdd");