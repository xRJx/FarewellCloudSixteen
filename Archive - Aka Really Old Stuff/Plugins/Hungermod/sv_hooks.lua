-- Called when a player's character data should be restored.
function openAura.schema:PlayerRestoreCharacterData(player, data)
	
	if ( !data["hunger"] ) then
		data["hunger"] = 0;
	end;

end;

-- Called when a player's shared variables should be set.
function openAura.schema:PlayerSetSharedVars(player, curTime)
	local clothesTable = openAura.item:Get( player:GetCharacterData("clothes", "") );
	player:SetSharedVar( "hunger", math.Round( player:GetCharacterData("hunger") ) );
	player:SetSharedVar( "customClass", player:GetCharacterData("customclass", "") );
	local position = player:GetPos();
	
	if (clothesTable) then
		player:SetSharedVar("clothes", clothesTable.index);
	else
		player:SetSharedVar("clothes", 0);
	end;
	
	
	if (player:Alive() and !player:IsRagdolled() and player:GetVelocity():Length() > 0) then
		local inventoryWeight = openAura.inventory:GetWeight(player);
		
		if (inventoryWeight >= openAura.inventory:GetMaximumWeight(player) / 4) then
			player:ProgressAttribute(ATB_STRENGTH, inventoryWeight / 400, true);
		end;
		if (player:GetCharacterData("thirst") == 100) then
			player:BoostAttribute("Thirst", ATB_ACROBATICS, -50);
			player:BoostAttribute("Thirst", ATB_ENDURANCE, -50);
			player:BoostAttribute("Thirst", ATB_STRENGTH, -50);
			player:BoostAttribute("Thirst", ATB_AGILITY, -50);
			player:BoostAttribute("Thirst", ATB_DEXTERITY, -50);
			player:BoostAttribute("Thirst", ATB_MEDICAL, -50);
		else
			player:BoostAttribute("Thirst", ATB_ACROBATICS, false);
			player:BoostAttribute("Thirst", ATB_ENDURANCE, false);
			player:BoostAttribute("Thirst", ATB_STRENGTH, false);
			player:BoostAttribute("Thirst", ATB_AGILITY, false);
			player:BoostAttribute("Thirst", ATB_DEXTERITY, false);
			player:BoostAttribute("Thirst", ATB_MEDICAL, false);
		end;
	end;
end;

-- Called at an interval while a player is connected.
function openAura.schema:PlayerThink(player, curTime, infoTable)
	local ragdolled = player:IsRagdolled();
	local clothes = player:GetCharacterData("clothes");
	local alive = player:Alive();
	
	if (alive and !ragdolled) then
		if (!player:InVehicle() and player:GetMoveType() == MOVETYPE_WALK) then
			if ( player:IsInWorld() ) then
				if ( !player:IsOnGround() ) then
					player:ProgressAttribute(ATB_ACROBATICS, 0.25, true);
				elseif (infoTable.running) then
					player:ProgressAttribute(ATB_AGILITY, 0.125, true);
				elseif (infoTable.jogging) then
					player:ProgressAttribute(ATB_AGILITY, 0.0625, true);
				end;
			end;
		end;
	end;
	
	if ( player:Alive() ) then
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 0.002, 0, 100) );
	end;
	
	local acrobatics = openAura.attributes:Fraction(player, ATB_ACROBATICS, 100, 50);
	local strength = openAura.attributes:Fraction(player, ATB_STRENGTH, 8, 4);
	local agility = openAura.attributes:Fraction(player, ATB_AGILITY, 50, 25);
	
	if (clothes != "") then
		local itemTable = openAura.item:Get(clothes);
		
		if (itemTable and itemTable.pocketSpace) then
			infoTable.inventoryWeight = infoTable.inventoryWeight + itemTable.pocketSpace;
		end;
	end;
	
	infoTable.inventoryWeight = infoTable.inventoryWeight + strength;
	infoTable.jumpPower = infoTable.jumpPower + acrobatics;
	infoTable.runSpeed = infoTable.runSpeed + agility;
end;