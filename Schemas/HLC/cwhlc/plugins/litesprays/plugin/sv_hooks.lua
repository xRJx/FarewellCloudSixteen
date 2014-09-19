local PLUGIN = PLUGIN;

-- Called when a player attempts to spray their tag.
function PLUGIN:PlayerSpray(player)
	if (!player:HasItemByID("spray_can") or player:GetSharedVar("tied") != 0) then
		return true;
	end;
end;