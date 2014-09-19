--[[
	Name: cl_auto.lua.
	Author: LauScript.
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- Called when the bars are needed.
function PLUGIN:GetBars(bars)
	local filterQuality = openAura.Client:GetSharedVar("filterQuality");
	
	if (!self.filterQuality) then
		self.filterQuality = filterQuality;
	else
		self.filterQuality = math.Approach(self.filterQuality, filterQuality, 1);
	end;
	
	if ( openAura.Client:GetSharedVar("wearingRespirator") ) then
		local r = 200 - filterQuality / 2;
		local b = filterQuality*2;
		bars:Add("FILTER", Color(r, 0, b, 255), "Filter", self.filterQuality, 100, self.filterQuality > 25);
	end;
end;


-- Called when screen space effects should be rendered.
function PLUGIN:RenderScreenspaceEffects()
	local hasMask = openAura.Client:GetSharedVar("wearingRespirator");
	if ( hasMask ) then
		local health = LocalPlayer():Health();
		
		if ( health <= 20 ) then
			DrawMaterialOverlay( "effects/gasmask_screen_4.vmt", 0.1 );
		elseif( health <= 30 ) then
			DrawMaterialOverlay( "effects/gasmask_screen_3.vmt", 0.1 );
		elseif( health <= 60 ) then
			DrawMaterialOverlay( "effects/gasmask_screen_2.vmt", 0.1 );
		elseif( health <= 90 ) then
			DrawMaterialOverlay( "effects/gasmask_screen_1.vmt", 0.1 );
		else
			DrawMaterialOverlay( "effects/gasmask_screen.vmt", 0.1 );
		end;
	end;
end;
