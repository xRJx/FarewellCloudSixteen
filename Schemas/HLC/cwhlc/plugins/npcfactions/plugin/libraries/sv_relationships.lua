local PLUGIN = PLUGIN;

function SetNpcFaction(player, npc)
	cl = npc:GetClass()
	if (
		cl == "npc_metropolice" || 
		cl == "npc_combine_s" || 
		cl == "npc_manhack" || 
		cl == "npc_scanner" || 
		cl == "combine_mine" || 
		cl == "npc_combinegunship" || 
		cl == "npc_combinedropship" || 
		cl == "npc_strider" || 
		cl == "npc_rollermine" || 
		cl == "npc_cscanner" || 
		cl == "npc_turret_floor"
	) then
		npc:Fire("setrelationship", "f_human d_ht 99", 0)
		npc:Fire("setrelationship", "f_zombie d_ht 98", 0)
		npc:Fire("setrelationship", "f_combine d_li 97", 0)
	elseif (
		cl == "npc_alyx" || 
		cl == "npc_kleiner" || 
		cl == "npc_eli" || 
		cl == "npc_barney" || 
		cl == "npc_citizen" || 
		cl == "npc_mossman" || 
		cl == "npc_monk" || 
		cl == "npc_vortiguant" || 
		cl == "npc_dog"
	) then
		npc:Fire("setrelationship", "f_combine d_ht 99", 0)
		npc:Fire("setrelationship", "f_zombie d_ht 98", 0)
		npc:Fire("setrelationship", "f_human d_li 97", 0)
	end;
end;
hook.Add("PlayerSpawnedNPC", "SetNpcFaction", SetNpcFaction)