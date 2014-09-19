local PLUGIN = PLUGIN;

-- Called when the HUD should be painted.
function openAura.schema:HUDPaint()
	local colorWhite = openAura.option:GetColor("white");
	local curTime = CurTime();
	local info = {
		alpha = 255 - openAura:GetBlackFadeAlpha(),
		x = ScrW() - 208,
		y = 8
	};
	
	if (openAura.inventory:HasItem("heartbeat_implant") and info.alpha > 0) then
		if ( openAura.Client:GetSharedVar("implant") ) then
			local aimVector = openAura.Client:GetAimVector();
			local position = openAura.Client:GetPos();
			local curTime = UnPredictedCurTime();

			self.heartbeatOverlay:SetMaterialFloat( "$alpha", math.min(0.5, (info.alpha / 255) * 0.5) );
			
			surface.SetDrawColor( 255, 255, 255, math.min(150, info.alpha / 2) );
				surface.SetMaterial(self.heartbeatOverlay);
			surface.DrawTexturedRect(info.x, info.y, 200, 200);
			
			surface.SetDrawColor(0, 200, 0, info.alpha);
				surface.SetMaterial(self.heartbeatPoint);
			surface.DrawTexturedRect(info.x + 84, info.y + 84, 32, 32);
			
			if (self.heartbeatScan) then
				local scanAlpha = math.min( 255 * math.max(self.heartbeatScan.fadeOutTime - curTime, 0), info.alpha );
				local y = self.heartbeatScan.y + ( (184 / 255) * (255 - scanAlpha) );
				
				if (scanAlpha > 0) then
					surface.SetDrawColor(100, 0, 0, scanAlpha * 0.5);
						surface.SetMaterial(self.heartbeatGradient);
					surface.DrawTexturedRect(self.heartbeatScan.x, y, self.heartbeatScan.width, self.heartbeatScan.height);
				else
					self.heartbeatScan = nil;
				end;
			end;
			
			if (curTime >= self.nextHeartbeatCheck) then
				self.nextHeartbeatCheck = curTime + 1;
				self.oldHeartbeatPoints = self.heartbeatPoints;
				self.heartbeatPoints = {};
				self.heartbeatScan = {
					fadeOutTime = curTime + 1,
					height = 16,
					width = 200,
					y = info.y,
					x = info.x
				};
				
				local centerY = info.y + 100;
				local centerX = info.x + 100;
				
				for k, v in ipairs( ents.FindInSphere(position, 768) ) do
					if ( v:IsPlayer() and v:Alive() and v:HasInitialized() ) then
						if ( openAura.Client != v and !openAura.player:IsNoClipping(v) ) then
							if ( v:Health() >= (v:GetMaxHealth() / 3) ) then
								if ( !v:GetSharedVar("ghostheart") ) then
									local playerPosition = v:GetPos();
									local difference = playerPosition - position;
									local pointX = (difference.x / 768);
									local pointY = (difference.y / 768);
									local pointZ = math.sqrt(pointX * pointX + pointY * pointY);
									local color = Color(200, 0, 0, 255);
									local phi = math.Deg2Rad(math.Rad2Deg( math.atan2(pointX, pointY) ) - math.Rad2Deg( math.atan2(aimVector.x, aimVector.y) ) - 90);
									pointX = math.cos(phi) * pointZ;
									pointY = math.sin(phi) * pointZ;
									
									if ( openAura.Client:GetAlliance() == v:GetAlliance() ) then
										color = Color(0, 0, 200, 255);
									end;
									
									self.heartbeatPoints[#self.heartbeatPoints + 1] = {
										fadeInTime = curTime + 1,
										height = 32,
										width = 32,
										color = color,
										x = centerX + (pointX * 100) - 16,
										y = centerY + (pointY * 100) - 16
									};
								end;
							end;
						end;
					end;
				end;
				
				if (self.lastHeartbeatAmount > #self.heartbeatPoints) then
					openAura.Client:EmitSound("items/flashlight1.wav", 25);
				end;
				
				for k, v in ipairs(self.oldHeartbeatPoints) do
					v.fadeOutTime = curTime + 1;
					v.fadeInTime = nil;
				end;
				
				self.lastHeartbeatAmount = #self.heartbeatPoints;
			end;
			
			for k, v in ipairs(self.oldHeartbeatPoints) do
				local pointAlpha = 255 * math.max(v.fadeOutTime - curTime, 0);
				local pointX = math.Clamp(v.x, info.x, (info.x + 200) - 32);
				local pointY = math.Clamp(v.y, info.y, (info.y + 200) - 32);
				
				surface.SetDrawColor( v.color.r, v.color.g, v.color.b, math.min(pointAlpha, info.alpha) );
					surface.SetMaterial(self.heartbeatPoint);
				surface.DrawTexturedRect(pointX, pointY, v.width, v.height);
			end;
			
			for k, v in ipairs(self.heartbeatPoints) do
				local pointAlpha = 255 - ( 255 * math.max(v.fadeInTime - curTime, 0) );
				local pointX = math.Clamp(v.x, info.x, (info.x + 200) - 32);
				local pointY = math.Clamp(v.y, info.y, (info.y + 200) - 32);
				
				surface.SetDrawColor( v.color.r, v.color.g, v.color.b, math.min(pointAlpha, info.alpha) );
					surface.SetMaterial(self.heartbeatPoint);
				surface.DrawTexturedRect(pointX, pointY, v.width, v.height);
			end;
			
			info.y = info.y + 212;
		end;
	end;
	
	if ( openAura.Client:GetSharedVar("tied") ) then
		local scrH = ScrH();
		local scrW = ScrW();
		
		local y = openAura:DrawInfo("YOU DROP EVERYTHING ON YOU IF YOU LEAVE WHILE TIED!", scrW, scrH, colorWhite, 255, true, function(x, y, width, height)
			return x - width - 8, y - (height * 2) - 16;
		end);
		
		openAura:DrawInfo("THIS INCLUDES ANY CLOTHING YOU ARE WEARING!", scrW, y, colorWhite, 255, true, function(x, y, width, height)
			return x - width - 8, y;
		end);
	else
		local nextDC = openAura.Client:GetSharedVar("nextDC");
		local scrH = ScrH();
		local scrW = ScrW();
		
		if (nextDC > curTime) then
			local y = openAura:DrawInfo("YOU DROP EVERYTHING ON YOU IF YOU LEAVE WITHIN "..math.ceil(nextDC - curTime).." SECOND(s)!", scrW, scrH, colorWhite, 255, true, function(x, y, width, height)
				return x - width - 8, y - (height * 2) - 16;
			end);
			
			openAura:DrawInfo("THIS INCLUDES ANY CLOTHING YOU ARE WEARING!", scrW, y, colorWhite, 255, true, function(x, y, width, height)
				return x - width - 8, y;
			end);
		end;
	end;
end;