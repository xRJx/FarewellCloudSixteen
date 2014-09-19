--[[
	Name: sh_info.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;
local radiationSounds = {
"/avoxgaming/geiger/geiger_1.wav",
"/avoxgaming/geiger/geiger_2.wav",
"/avoxgaming/geiger/geiger_3.wav",
"/avoxgaming/geiger/geiger_4.wav",
"/avoxgaming/geiger/geiger_5.wav",
"/avoxgaming/geiger/geiger_6.wav"
};




-- Called when OpenAura has loaded all of the entities.
function PLUGIN:OpenAuraInitPostEntity() self:LoadRadiationAreas(); end;

-- Called each tick.
function PLUGIN:Tick()
	if( !self.NextCheck or self.NextCheck < CurTime() )then
		self.NextCheck = CurTime() + 3;
		
		for k,v in pairs(_player.GetAll())do
			if(v.observerMode or !v:Alive())then continue; end;
			local plyInZone = false;
			local hasIncreased = false;
	
			for k2, v2 in pairs(self.radiationZones) do
				if (openAura.entity:IsInBox(v, v2.minimum, v2.maximum) ) then
					local clothes = v:GetCharacterData("clothes");
					local HasMask = v:GetSharedVar("wearingRespirator");
					local increase = 1;
					
					-- reduce the increase based on their clothes.
					if (clothes) then
						local itemTable = openAura.item:Get(clothes);
						
						if (itemTable and itemTable.radiationProtection) then
							increase = math.Clamp(increase - itemTable.radProtection,0,1);
						end;
					end;
					
					-- Reduce the increased based on their mask, and reduce the filter quality.
					if ( HasMask ) then
						local filterQuality = v:GetSharedVar("filterQuality") or 0;
						
						if ( filterQuality >= 1 ) then
							v:SetCharacterData( "filterQuality", filterQuality - 1 );
							v:SetSharedVar( "filterQuality", filterQuality -1 );
							increase = increase / 2;
						end;
					end;
					
					v:SetCharacterData("radiation", v:GetCharacterData("radiation") + increase);
					hasIncreased = true;
					plyInZone = true;
					
					break;
				end;
			end;
			
			if(!plyInZone)then
				if(v:GetCharacterData("radiation") > 25)then
					v:SetCharacterData("radiation", v:GetCharacterData("radiation") + .5);
					hasIncreased = true;
				elseif(v:GetCharacterData("radiation") > 0)then
					v:SetCharacterData("radiation", v:GetCharacterData("radiation") - .2);
				end;
			end;
			
			if(hasIncreased)then
				v:EmitSound(table.Random(radiationSounds));
			end;
		end;
	end;
end;

-- Called when a player's character data should be saved.
function PLUGIN:PlayerSaveCharacterData(player, data)
	if ( data["radiation"] ) then
		data["radiation"] = math.Round( data["radiation"] );
	end;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	data["radiation"] = data["radiation"] or 0;
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!firstSpawn and !lightSpawn) then
		player:SetCharacterData("radiation", 0);
	end;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar( "radiation", math.Round( player:GetCharacterData("radiation") ) );
end;