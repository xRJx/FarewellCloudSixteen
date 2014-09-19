--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

-- Called just after the opaque renderables have been drawn.
function PLUGIN:PostDrawOpaqueRenderables(drawingDepth, drawingSkybox)
	if (drawingSkybox or drawingDepth) then
		return;
	end;
	
	local colorWhite = openAura.option:GetColor("red");
	local eyeAngles = EyeAngles();
	local eyePos = EyePos();
	local font = openAura.option:GetFont("large_3d_2d");
	
	openAura:OverrideMainFont(font);
		cam.Start3D(eyePos, eyeAngles);
			for k, v in pairs(self.surfaceTexts) do
				local alpha = math.Clamp(openAura:CalculateAlphaFromDistance(512, eyePos, v.position) * 1.5, 0, 255);
				
				if (alpha > 0) then
					local text = string.Explode("|", v.text);
					local y = 0;
					
					cam.Start3D2D(v.position, v.angles, (v.scale or 0.25) * 0.2);
						for k2, v2 in ipairs(text) do
							y = openAura:DrawInfo(v2, 0, y, colorWhite, alpha, nil, function(x, y, width, height)
								return x, y - (height / 2);
							end, 3);
						end;
					cam.End3D2D();
				end;
			end;
		cam.End3D();
	openAura:OverrideMainFont(false);
end;