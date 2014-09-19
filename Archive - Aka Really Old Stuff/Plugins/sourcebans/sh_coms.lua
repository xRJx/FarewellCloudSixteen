--[[
Name: "sh_coms.lua".
Author: Snazzy.
--]]

local PLUGIN = PLUGIN;

COMMAND = openAura.command:New();
COMMAND.tip = "Ban a player from the server by their name.";
COMMAND.text = "<string Name> <number Minutes> [string Reason]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local playerGet = openAura.player:Get(arguments[1]);
	local duration = tonumber( arguments[2] );
	local reason = table.concat(arguments, " ", 3);
	
	if (!reason or reason == "") then
		reason = nil;
	end;
	
	if (playerGet) then
		if (duration) then
			PLUGIN:AddSourceBan(nil, nil, playerGet, duration * 60, reason, player, playerGet:SteamName(), function(identifier, steamName, duration, reason)
				if ( IsValid(player) ) then
					if (steamName) then
						if (duration > 0) then
							local hours = math.Round(duration / 3600);
							
							if (hours >= 1) then
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..hours.." hour(s) ("..reason..").");
							else
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..math.Round(duration / 60).." minute(s) ("..reason..").");
							end;
						else
							openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' permanently ("..reason..").");
						end;
					else
						openAura.player:Notify(player, "This is not a valid ".. identifier .."!");
					end;
				end;
			end);
		else
			openAura.player:Notify(player, "This is not a valid duration!");
		end;
	else
		openAura.player:Notify(player, "This is not a valid player!");
		
		return;
	end;
end;
openAura.command:Register(COMMAND, "SourceBanName");

COMMAND = openAura.command:New();
COMMAND.tip = "Ban a player from the server by their steamid.";
COMMAND.text = "<string SteamID> <number Minutes> <string PlayerName> [string Reason]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 3;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local steamid = arguments[1];
	local duration = tonumber( arguments[2] );
	local name = arguments[3];
	local reason = table.concat(arguments, " ", 4);
	
	if (!reason or reason == "") then
		reason = nil;
	end;
	
	if (steamid) then
		if (duration) then
			PLUGIN:AddSourceBan(steamid, nil, nil, duration * 60, reason, player, name, function(identifier, steamName, duration, reason)
				if ( IsValid(player) ) then
					if (steamName) then
						if (duration > 0) then
							local hours = math.Round(duration / 3600);
							
							if (hours >= 1) then
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..hours.." hour(s) ("..reason..").");
							else
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..math.Round(duration / 60).." minute(s) ("..reason..").");
							end;
						else
							openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' permanently ("..reason..").");
						end;
					else
						openAura.player:Notify(player, "This is not a valid ".. identifier .."!");
					end;
				end;
			end);
		else
			openAura.player:Notify(player, "This is not a valid duration!");
		end;
	else
		openAura.player:Notify(player, "This is not a valid steamid!");
		
		return;
	end;
end;
openAura.command:Register(COMMAND, "SourceBanSteamID");

COMMAND = openAura.command:New();
COMMAND.tip = "Ban a player from the server by their ip.";
COMMAND.text = "<string IpAddress> <number Minutes> <string PlayerName> [string Reason]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 3;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local ip = arguments[1];
	local duration = tonumber( arguments[2] );
	local name = arguments[3];
	local reason = table.concat(arguments, " ", 4);
	
	if (!reason or reason == "") then
		reason = nil;
	end;
	
	if (ip) then
		if (duration) then
			PLUGIN:AddSourceBan(ip, nil, nil, duration * 60, reason, player, name, function(identifier, steamName, duration, reason)
				if ( IsValid(player) ) then
					if (steamName) then
						if (duration > 0) then
							local hours = math.Round(duration / 3600);
							
							if (hours >= 1) then
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..hours.." hour(s) ("..reason..").");
							else
								openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' for "..math.Round(duration / 60).." minute(s) ("..reason..").");
							end;
						else
							openAura.player:NotifyAll(player:Name().." has banned '"..steamName.."' permanently ("..reason..").");
						end;
					else
						openAura.player:Notify(player, "This is not a valid ".. identifier .."!");
					end;
				end;
			end);
		else
			openAura.player:Notify(player, "This is not a valid duration!");
		end;
	else
		openAura.player:Notify(player, "This is not a valid ip!");
		
		return;
	end;
end;
openAura.command:Register(COMMAND, "SourceBanIP");

COMMAND = openAura.command:New();
COMMAND.tip = "Unban a player from the server by their ip.";
COMMAND.text = "<string IpAddress> [string Reason]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local ip = arguments[1];
	local reason = table.concat(arguments, " ", 2);
	
	if (!reason or reason == "") then
		reason = nil;
	end;
	
	UnbanPlayerByIPAddress(ip, reason, player)
end;
openAura.command:Register(COMMAND, "SourceUnBanIP");

COMMAND = openAura.command:New();
COMMAND.tip = "Unban a player from the server by their steamid.";
COMMAND.text = "<string SteamID> [string Reason]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local steamid = arguments[1];
	local reason = table.concat(arguments, " ", 2);
	
	if (!reason or reason == "") then
		reason = nil;
	end;
	
	UnbanPlayerBySteamID(steamid, reason, player)
end;
openAura.command:Register(COMMAND, "SourceUnBanSteamID");