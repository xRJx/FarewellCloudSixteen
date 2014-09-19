local PLUGIN = PLUGIN;

-- Called to get whether a player's target ID should be drawn.
function PLUGIN:ShouldDrawPlayerTargetID(player)
	if (player:GetMaterial() == "Models/effects/vol_light001") then
		return false;
	end;
end;

-- Called when screen space effects should be rendered.
function PLUGIN:RenderScreenspaceEffects()
	local visionImplant = Clockwork.Client:GetSharedVar("vision");
	local thermalImplant = Clockwork.Client:GetSharedVar("thermal");
	local modulation = {1, 1, 1};
	
	if (visionImplant) then
		modulation = {0, 1, 0};
		
		local colorModify = {};
			colorModify["$pp_colour_brightness"] = 0.1;
			colorModify["$pp_colour_contrast"] = 0.9;
			colorModify["$pp_colour_colour"] = 0.1;
			colorModify["$pp_colour_addr"] = -0.05;
			colorModify["$pp_colour_addg"] = 0.1;
			colorModify["$pp_colour_addb"] = -0.05;
			colorModify["$pp_colour_mulr"] = 0;
			colorModify["$pp_colour_mulg"] = 5;
			colorModify["$pp_colour_mulb"] = 0;
		DrawColorModify(colorModify);
	end;
	
	if (thermalImplant) then
		modulation = {0.5, 0.5, 0.5};
		
		local colorModify = {};
			colorModify["$pp_colour_brightness"] = 0.1;
			colorModify["$pp_colour_contrast"] = 0.2;
			colorModify["$pp_colour_colour"] = 0;
			colorModify["$pp_colour_addr"] = 0;
			colorModify["$pp_colour_addg"] = 0;
			colorModify["$pp_colour_addb"] = 0;
			colorModify["$pp_colour_mulr"] = 0;
			colorModify["$pp_colour_mulg"] = 0;
			colorModify["$pp_colour_mulb"] = 0;
		DrawColorModify(colorModify);
	end;
	--[[
	if (thermalImplant) then
		modulation = {0.5, 0.5, 0.5};
		
		local colorModify = {};
			colorModify["$pp_colour_brightness"] = 0.1;
			colorModify["$pp_colour_contrast"] = 1;
			colorModify["$pp_colour_colour"] = 0.1;
			colorModify["$pp_colour_addr"] = -0.15;
			colorModify["$pp_colour_addg"] = -0.15;
			colorModify["$pp_colour_addb"] = -0.15;
			colorModify["$pp_colour_mulr"] = 0;
			colorModify["$pp_colour_mulg"] = 0;
			colorModify["$pp_colour_mulb"] = 0;
		DrawColorModify(colorModify);
	end;
	]]--
	cam.Start3D( EyePos(), EyeAngles() );
		for k, v in ipairs( _player.GetAll() ) do
			if (v:Alive() and !v:IsRagdolled() and v:GetMoveType() == MOVETYPE_WALK) then
				if ( v:HasInitialized() ) then
					if ( thermalImplant or (v:GetMaterial() == "sprites/heatwave" and v:GetVelocity():Length() > 1) ) then
						local material = PLUGIN.heatwaveMaterial;
						
						if (thermalImplant) then
							material = PLUGIN.shinyMaterial;
						end;
						
						render.SuppressEngineLighting(true);
						render.SetColorModulation( unpack(modulation) );
						
						render.MaterialOverride(material);
							v:DrawModel();
						render.MaterialOverride(false)
						
						render.SetColorModulation(1, 1, 1);
						render.SuppressEngineLighting(false);
					end;
				end;
			end;
		end;
		
		for k, v in ipairs( ents.FindByClass("npc_*") ) do
			if (thermalImplant) then
				local material = PLUGIN.heatwaveMaterial;
				
				if (thermalImplant) then
					material = PLUGIN.shinyMaterial;
				end;
				
				render.SuppressEngineLighting(true);
				render.SetColorModulation( unpack(modulation) );
				
				render.MaterialOverride(material);
					v:DrawModel();
				render.MaterialOverride(false)
				
				render.SetColorModulation(1, 1, 1);
				render.SuppressEngineLighting(false);
			end;
		end;
	cam.End3D();
end;