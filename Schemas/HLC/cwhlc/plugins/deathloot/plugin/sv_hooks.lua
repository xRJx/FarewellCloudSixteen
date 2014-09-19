local PLUGIN = PLUGIN;


function PLUGIN:PlayerDeath(player, inflictor, attacker, damageInfo)
	local ragdoll = player:GetRagdollEntity();
	
	if (IsValid(ragdoll)) then
		local playerInv = openAura.player:GetInventory(player);
		local corpseInv = {};
		ragdoll.inventory = {};
		ragdoll.cash = openAura.player:GetCash(player);
		
		for k, v in pairs(playerInv) do
			local itemTable = openAura.item:Get(k);
			if (itemTable) then
				if (player:UpdateInventory(k, -v, true, true)) then
					ragdoll.inventory[k] = v;
				end;
			end;
		end;
		
		player:SetCharacterData("cash", 0, true);
		player:SaveCharacter();
	end;
end;

function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	if (entity:GetClass() == "prop_ragdoll" and arguments == "aura_loot") then
		if (!entity.inventory or !entity.cash) then
			return;
		end
		player:EmitSound("physics/body/body_medium_impact_soft"..math.random(1, 7)..".wav");
		
		openAura.player:OpenStorage(player, {
			name = "Dead Corpse",
			weight = 24,
			entity = entity,
			distance = 192,
			cash = entity.cash,
			inventory = entity.inventory,
			OnGiveCash = function(player, storageTable, cash)
				entity.cash = storageTable.cash;
			end,
			OnTakeCash = function(player, storageTable, cash)
				entity.cash = storageTable.cash;
			end
		});
	end;
end;