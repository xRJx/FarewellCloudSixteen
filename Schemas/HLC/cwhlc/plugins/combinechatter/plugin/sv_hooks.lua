local PLUGIN = PLUGIN;

-- A function to load the item spawns.
function PLUGIN:EmitRandomChatter(player)
	local randomSounds = {
		"npc/combine_soldier/vo/prison_soldier_activatecentral.wav",
		"npc/combine_soldier/vo/prison_soldier_boomersinbound.wav",
		"npc/combine_soldier/vo/prison_soldier_bunker1.wav",
		"npc/combine_soldier/vo/prison_soldier_bunker2.wav",
		"npc/combine_soldier/vo/prison_soldier_bunker3.wav",
		"npc/combine_soldier/vo/prison_soldier_containD8.wav",
		"npc/combine_soldier/vo/prison_soldier_fallback_b4.wav",
		"npc/combine_soldier/vo/prison_soldier_freeman_antlions.wav",
		"npc/combine_soldier/vo/prison_soldier_fullbioticoverrun.wav",
		"npc/combine_soldier/vo/prison_soldier_leader9dead.wav",
		"npc/combine_soldier/vo/prison_soldier_negativecontainment.wav",
		"npc/combine_soldier/vo/prison_soldier_prosecuteD7.wav",
		"npc/combine_soldier/vo/prison_soldier_sundown3dead.wav",
		"npc/combine_soldier/vo/prison_soldier_tohighpoints.wav",
		"npc/combine_soldier/vo/prison_soldier_visceratorsA5.wav"
	};
	
	--[[
	
	-- Alternative sound emitter. Lowers the emitter's sound but doesn't follow the player.
	for k,v in ipairs( _player.GetAll() ) do
		if (Schema:PlayerIsCombine(v)) then
			local pos = v:GetBonePosition(10)
			sound.Play( randomSounds[ math.random(1, #randomSounds) ], pos, 300, 100, 0.4 )
		end;
	end;
	]]--
	
	local randomSound = randomSounds[ math.random(1, #randomSounds) ];
	player:EmitSound( randomSound, 60)
end;

-- Called each tick.
function PLUGIN:Tick()
	for k, v in ipairs( _player.GetAll() ) do
		if (Schema:PlayerIsCombine(v)) then
			local curTime = CurTime();
			
			if (!self.nextChatterEmit) then
				self.nextChatterEmit = curTime + math.random(30, 50);
			end;
			
			if ( (curTime >= self.nextChatterEmit) ) then
				self.nextChatterEmit = nil;
				
				PLUGIN:EmitRandomChatter(v);
			end;
		end;
	end;
end;