--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	player:SetSharedVar("Kevlar", false);
end;

-- A function to scale damage by hit group.
function PLUGIN:PlayerScaleDamageByHitGroup(player, attacker, hitGroup, damageInfo, baseDamage)
	local Kevlar = player:GetCharacterData("Kevlar");
	
	if (damageInfo:IsBulletDamage()) then
		if (Kevlar) then
			local itemTable = player:FindItemByID("kevlar");
			
			if (itemTable and itemTable.protection) then
				if (hitGroup == HITGROUP_CHEST or hitGroup == HITGROUP_STOMACH) then
					damageInfo:ScaleDamage(1 - itemTable.protection);
				end;
			end;
		end;
	end;
end;