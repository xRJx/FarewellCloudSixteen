--[[
	Name: sv_hooks.lua.
	Author: LauScript.
--]]

local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:OpenAuraInitPostEntity() self:LoadSurfaceZones(); end;


local painSounds = {
};

-- Called each tick.
function PLUGIN:Tick()
	if( !self.NextSCheck or self.NextSCheck < CurTime() )then
		self.NextSCheck = CurTime() + 3;
		
		for k,v in pairs(_player.GetAll())do
			if( v.observerMode or !v:Alive() )then continue; end;
			for k2, v2 in pairs(self.surfaceZones) do
				if (openAura.entity:IsInBox(v, v2.minimum, v2.maximum) ) then
					local hasMask = v:GetSharedVar("wearingRespirator");
					local health = v:Health();
					local damage = 2;
					local filter;
					
					if ( hasMask ) then
						filter = v:GetSharedVar("filterQuality");
						
						if ( filter >= 1 ) then
							
							local newQuality = filter - 1;
							
							v:SetSharedVar("filterQuality", newQuality);
							v:SetCharacterData( "filterQuality", newQuality);
							
							damage = 0;
						end;
					end;
					
					if ( damage > 0 ) then
						if( !v.LastPainSound or v.LastPainSound < CurTime() )then
							v.LastPainSound = CurTime() + 6;
							v:EmitSound("avoxgaming/health_sound/breath/outdoor_whitout_mask_die.wav", 50, 100 );
						end;
					
					
						if ( health >= 1 ) then
							v:SetHealth( health - damage );
						else
							v:Kill();
						end;
					end;
					break;
				end;
			end;
		end;
	end;
end;
