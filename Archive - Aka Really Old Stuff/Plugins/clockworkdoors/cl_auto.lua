--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN;
GRADIENT_CENTER = surface.GetTextureID("gui/center_gradient");

-- Called just after the translucent renderables have been drawn.
function PLUGIN:PostDrawTranslucentRenderables(bDrawingDepth, bDrawingSkybox)
	
	local colorWhite = openAura.option:GetColor("white");
	local colorInfo = openAura.option:GetColor("information");
	local doorFont = openAura.option:GetFont("large_3d_2d");
	local eyeAngles = EyeAngles();
	local eyePos = EyePos();
	
	if (!openAura:IsChoosingCharacter()) then
		cam.Start3D(eyePos, eyeAngles);
			local entities = ents.FindInSphere(eyePos, 256);
			
			for k, v in pairs(entities) do
				if (IsValid(v) and openAura.entity:IsDoor(v)) then
					self:DrawDoorText(v, eyePos, eyeAngles, doorFont, colorInfo, colorWhite);
				end;
			end;
		cam.End3D();
	end;

	openAura:PostDrawOpaqueRenderables()	-- Yeah, just redreaw the text... kinda sucks I geuss, but it's the best I could do without modifying OA
											-- Also the text would render behind the gradients if it wasn't like this and that's worse.
end;

-- A function to draw some door text.
function PLUGIN:DrawDoorText(entity, eyePos, eyeAngles, font, nameColor, textColor)
	local r, g, b, a = entity:GetColor();
	
	if (a <= 0 or entity:IsEffectActive(EF_NODRAW)) then
		return;
	end;
	
	local doorData = openAura.entity:CalculateDoorTextPosition(entity);
	
	if (!doorData.hitWorld) then
		local frontY = -26;
		local backY = -26;
		local alpha = openAura:CalculateAlphaFromDistance(256, eyePos, entity:GetPos());
		
		if (alpha <= 0) then
			return;
		end;
		
		local owner = openAura.entity:GetOwner(entity);
		local name = openAura.plugin:Call("GetDoorInfo", entity, DOOR_INFO_NAME);
		local text = openAura.plugin:Call("GetDoorInfo", entity, DOOR_INFO_TEXT);
		
		if (name or text) then
			local nameWidth, nameHeight = openAura:GetCachedTextSize(font, name or "");
			local textWidth, textHeight = openAura:GetCachedTextSize(font, text or "");
			local longWidth = nameWidth;
			local boxAlpha = math.min(alpha, 150);
			
			if (textWidth > longWidth) then
				longWidth = textWidth;
			end;
			
			local scale = math.abs((doorData.width * 0.75) / longWidth);
			local nameScale = math.min(scale, 0.05);
			local textScale = math.min(scale, 0.03);
			local longHeight = nameHeight + textHeight + 8;
			
			cam.Start3D2D(doorData.position, doorData.angles, nameScale);
				surface.SetDrawColor(100, 100, 100, boxAlpha);
				surface.SetTexture(GRADIENT_CENTER);
				surface.DrawTexturedRect(-(longWidth / 2) - 128, frontY - 8, longWidth + 256, longHeight);
			cam.End3D2D();
			
			cam.Start3D2D(doorData.positionBack, doorData.anglesBack, nameScale);
				surface.SetDrawColor(100, 100, 100, boxAlpha);
				surface.SetTexture(GRADIENT_CENTER);
				surface.DrawTexturedRect(-(longWidth / 2) - 128, frontY - 8, longWidth + 256, longHeight);
			cam.End3D2D();
		end;
	end;
end;