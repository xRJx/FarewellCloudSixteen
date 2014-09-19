--[[
	Name: cl_auto.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- Called when the bars are needed.
function PLUGIN:GetBars(bars)
	local radiation = openAura.Client:GetSharedVar("radiation");
	
	if (!self.radiation) then
		self.radiation = radiation;
	else
		self.radiation = math.Approach(self.radiation, radiation, 1);
	end;
	
	bars:Add("RADIATION", Color(182, 216, 0, 255), "Radiation", self.radiation, 100, self.radiation > 25);
end;

-- Called when screen space effects should be rendered.
function PLUGIN:RenderScreenspaceEffects()
	local radiation = openAura.Client:GetSharedVar("radiation");
	
	if(radiation)then
		if(radiation >= 75 and radiation < 85)then
			DrawMotionBlur(0.8, 0.79, 0.05);
		elseif(radiation > 85)then
			DrawMotionBlur(0.1, 0.79, 0.05);
		end;
	end;
end;