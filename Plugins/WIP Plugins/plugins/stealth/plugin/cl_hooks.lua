local PLUGIN = PLUGIN;

-- Called to get whether a player's target ID should be drawn.
function PLUGIN:ShouldDrawPlayerTargetID(player)
	if (player:GetMaterial() == "Models/effects/vol_light001") then
		return false;
	end;
end;

-- Called when screen space effects should be rendered.
function PLUGIN:RenderScreenspaceEffects()
	cam.Start3D( EyePos(), EyeAngles() );
		for k, v in ipairs( _player.GetAll() ) do
			if (v:Alive() and !v:IsRagdolled() and v:GetMoveType() == MOVETYPE_WALK) then
				if ( v:HasInitialized() ) then
					if (v:GetMaterial() == "sprites/heatwave" and v:GetVelocity():Length() > 1) then
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
	cam.End3D();
end;