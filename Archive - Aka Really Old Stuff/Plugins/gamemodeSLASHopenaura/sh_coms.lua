-- Let's an Admin Cloak a player.(Good for Stalker RP and other gamemodes)
COMMAND = openAura.command:New();
COMMAND.tip = "Cloak a player.";
COMMAND.text = "<character>";
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get(arguments[1]);

	if (target) then
		if (!target:Alive()) then
			openAura.player:Notify(player, "This player is currently dead.");
			return;
		end;
		
		if (!target.observer) then
			target:GodEnable();
			target:SetNoDraw(true);
		
			if (target:GetActiveWeapon()) then
				target:GetActiveWeapon():SetNoDraw(true);
			end;
		
			target:SetNotSolid(true);
			target:SetColor(0, 0, 0, 45);
			target.observer = true;
			
			openAura.player:NotifyAll(player:Name().." cloaked '"..target:Name().."'.");
		else
			target:GodDisable();
			target:SetNoDraw(false);
		
			if (target:GetActiveWeapon()) then
				target:GetActiveWeapon():SetNoDraw(false);
			end;
		
			target:SetNotSolid(false);
			target:SetColor(255, 255, 255, 255);
			target.observer = false;

			openAura.player:NotifyAll(player:Name().." un-cloaked '"..target:Name().."'.");
		end;
	else
		openAura.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

openAura.command:Register(COMMAND, "Cloak");

-- Let's you toggle Freeze a player.
COMMAND = openAura.command:New();
COMMAND.tip = "Freeze or Unfreeze a player.";
COMMAND.text = "<string Name>";
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	local isfrozen = target:GetSharedVar("frozen");
	
	if (target) then
		if (isfrozen == true) then
			target:Freeze(false);
			target:SetSharedVar( "frozen", false );
			target:SetMoveType(MOVETYPE_WALK);
			openAura.player:NotifyAll(player:Name().." has unfrozen "..target:Name()..".");
		else
			target:Freeze(true);
			target:SetSharedVar( "frozen", true );
			target:SetMoveType(MOVETYPE_NONE);
			openAura.player:NotifyAll(player:Name().." has frozen "..target:Name()..".");
		end;
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "PlyFreeze");

-- Let's an Admin bring a player to there current location.
COMMAND = openAura.command:New();
COMMAND.tip = "Brings a player to you.";
COMMAND.text = "<string Name>";
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	
	if (target) then
		openAura.player:SetSafePosition( target, player:GetPos() );
		openAura.player:NotifyAll(target:Name().." has been brought to "..player:Name().."'s location.");
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "PlyBring");

-- Let's a Admin set a players Armor.
COMMAND = openAura.command:New();
COMMAND.tip = "Set a character's armor.";
COMMAND.text = "<string Name> [number Amount]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	local amount = arguments[2];
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		openAura.player:NotifyAll(player:Name().." has set "..target:Name().."'s armor to "..amount..".");
		
		target:SetArmor(amount);
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "PlySetArmor");

-- Let's an Admin give a player tool flags.
COMMAND = openAura.command:New();
COMMAND.tip = "Give or take ToolTrust(t flag).";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	
	if (target) then
		if (!openAura.player:HasFlags(target, "t")) then
			openAura.player:NotifyAll(target:Name().." gave ToolTrust to "..player:Name()..".");
			openAura.player:GiveFlags(target, "t")
			target:SetData("tooltrust", 1)
			openAura.player:LightSpawn(target, true, true);
		else
			openAura.player:NotifyAll(target:Name().." took ToolTrust from "..player:Name()..".");
			openAura.player:TakeFlags(target, "t")
			target:SetData("tooltrust", 0)
			openAura.player:LightSpawn(target, true, true);
		end
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "ToolTrust");

-- Let's an Admin give a player All flags.(Good for giving an admin flags)
COMMAND = openAura.command:New();
COMMAND.tip = "Give or take All Flags.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	
	if (target) then
		if (!openAura.player:HasFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")) then
			openAura.player:NotifyAll(player:Name().." gave AllFlags to "..target:Name()..".");
			openAura.player:GiveFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")
			target:SetData("allflags", 1)
			openAura.player:LightSpawn(target, true, true);
		else
			openAura.player:NotifyAll(player:Name().." took AllFlags to "..target:Name()..".");
			openAura.player:TakeFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")
			target:SetData("allflags", 0)
			openAura.player:LightSpawn(target, true, true);
		end
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "AllFlags");

-- Let's an Admin give a player Physgun and prop flags.
COMMAND = openAura.command:New();
COMMAND.tip = "Give or take PhysgunTrust.(pe Flags)";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	
	if (target) then
		if (!openAura.player:HasFlags(target, "pe")) then
			openAura.player:NotifyAll(player:Name().." gave PhysgunTrust to "..target:Name()..".");
			openAura.player:GiveFlags(target, "pe")
			target:SetData("phystrust", 1)
			openAura.player:LightSpawn(target, true, true);
		else
			openAura.player:NotifyAll(player:Name().." took PhysgunTrust to "..target:Name()..".");
			openAura.player:TakeFlags(target, "pe")
			target:SetData("phystrust", 0)
			openAura.player:LightSpawn(target, true, true);
		end
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "PhysgunTrust");

-- Let's an Admin give pet Flags.
COMMAND = openAura.command:New();
COMMAND.tip = "Give or take ToolTrust and PhysGunTrust(pet Flags).";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	
	if (target) then
		if (!openAura.player:HasFlags(target, "pet")) then
			openAura.player:NotifyAll(player:Name().." gave AllTrusts to "..target:Name()..".");
			openAura.player:GiveFlags(target, "pet")
			target:SetData("phystrust", 1)
			target:SetData("tooltrust", 1)
			openAura.player:LightSpawn(target, true, true);
		else
			openAura.player:NotifyAll(player:Name().." gave AllTrusts to "..target:Name()..".");
			openAura.player:TakeFlags(target, "pet")
			target:SetData("phystrust", 0)
			target:SetData("tooltrust", 0)
			openAura.player:LightSpawn(target, true, true);
		end
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "AllTrusts");