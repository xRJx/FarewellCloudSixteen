local PLUGIN = PLUGIN;

Clockwork.hint:Add("F3 Hotkey", "Press F3 while looking at a character to use a zip tie.");
Clockwork.hint:Add("F4 Hotkey", "Press F3 while looking at a tied character to search them.");

-- A function to get a player's dexterity time.
function PLUGIN:GetDexterityTime(player)
	return 7 - Clockwork.attributes:Fraction(player, ATB_DEXTERITY, 5, 5);
end;

-- A function to tie or untie a player.
function PLUGIN:TiePlayer(player, isTied, reset)
	if (isTied) then
		player:SetSharedVar("tied", 1);
	else
		player:SetSharedVar("tied", 0);
	end;
	
	if (isTied) then
		Clockwork.player:DropWeapons(player);
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been tied.");
		
		player:Flashlight(false);
		player:StripWeapons();
	elseif (!reset) then
		if (player:Alive() and !player:IsRagdolled()) then 
			Clockwork.player:LightSpawn(player, true, true);
		end;
		
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been untied.");
	end;
end;