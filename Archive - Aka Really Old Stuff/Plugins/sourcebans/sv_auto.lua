--[[
Name: "sv_auto.lua".
Author: Snazzy.
--]]

require("sourcebans");

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- A function to add a ban.
function PLUGIN:AddSourceBan(steamid, ip, ply, duration, reason, admin, displayName, callback)
	-- Set a default ban reason
	if (!reason) then
		reason = "Banned for an unspecified reason.";
	end;
		
	-- Ban the player by their object
	if( ply )then
		-- Check if this is a player
		if !IsValid(ply) then
			if (callback) then
				callback("player name", displayName or ply, duration, reason);
			end;
		end;
		
		-- Store the variables for later
		local steamid = ply:SteamID();
		local name = ply:Name();
		local steamName = ply:SteamName();
		
		-- Kick the player
		ply:Kick(reason);
		
		-- Ban the player by their steamid
		sourcebans.BanPlayerBySteamID(steamid, duration, reason, admin, name .. " (".. steamName ..")", function(success, err)
			if( success )then
				if (callback) then
					callback("steamid", displayName or steamid, duration, reason);
				end;
			end;
		end);
	
	-- Ban the player by their steamid
	elseif( steamid and string.find(steamid, "STEAM")  )then
		sourcebans.BanPlayerBySteamID(steamid, duration, reason, admin, displayName or steamid, function(success, err)
			if( success )then
				if (callback) then
					callback("steamid", displayName or steamid, duration, reason);
				end;
			end;
		end);
		
	-- Ban the player by their ip
	elseif( ip and string.find(ip, "%d+%.%d+%.%d+%.%d+") )then
		sourcebans.BanPlayerByIP(ip, duration, reason, admin, displayName or ip, function(success, err)
			if( success )then
				if (callback) then
					callback("ip address", displayName or ip, duration, reason);
				end;
			end;
		end);
	else
		callback("identifier");
		
		return;
	end;
end;