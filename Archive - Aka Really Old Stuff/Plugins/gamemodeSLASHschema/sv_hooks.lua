-- Called when an entity takes damage.
function openAura.schema:EntityTakeDamage(entity, inflictor, attacker, amount, damageInfo)
	local curTime = CurTime();
	local player = openAura.entity:GetPlayer(entity);
	
	if (player) then
		if (!player.nextEnduranceTime or CurTime() > player.nextEnduranceTime) then
			player:ProgressAttribute(ATB_ENDURANCE, math.Clamp(damageInfo:GetDamage(), 0, 75) / 10, true);
			
			player.nextEnduranceTime = CurTime() + 2;
		end;
	end;
	
	if ( attacker:IsPlayer() ) then
		local strength = openAura.attributes:Fraction(attacker, ATB_STRENGTH, 1, 0.5);
		local weapon = openAura.player:GetWeaponClass(attacker);
		
		if ( damageInfo:IsDamageType(DMG_CLUB) or damageInfo:IsDamageType(DMG_SLASH) ) then
			damageInfo:ScaleDamage(1 + strength);
		end;
		
		if (weapon == "weapon_crowbar") then
			if ( entity:IsPlayer() ) then
				damageInfo:ScaleDamage(0.1);
			else
				damageInfo:ScaleDamage(0.8);
			end;
		end;
	end;
	
	-- Shoot 2 miss function
	if entity:IsPlayer() and attacker:IsPlayer() then
		if attacker.S2M then
			damageInfo:ScaleDamage( 0 );
		end;
	end;
end;