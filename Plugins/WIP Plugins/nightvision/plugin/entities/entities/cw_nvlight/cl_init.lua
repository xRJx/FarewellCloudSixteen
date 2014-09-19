include("shared.lua");

function ENT:Think()
	local dlight = DynamicLight( self:EntIndex() );
	local visionImplant = Clockwork.Client:GetSharedVar("vision");
	
	cam.Start3D( EyePos(), EyeAngles() );
		for k, v in ipairs( player.GetAll() ) do
			if (v:Alive() and !v:IsRagdolled()) then
				if ( v:HasInitialized() ) then
					if ( dlight and v == self.Owner  ) then
						local r, g, b, a = self:GetColor();
						dlight.Pos = self:GetPos();
						dlight.r = 255;
						dlight.g = 255;
						dlight.b = 255;
						dlight.Brightness = 0;
						dlight.Size = 400;
						dlight.Decay = 5;
						dlight.DieTime = CurTime() + 0.1;
					end;
				end;
			end;
		end;
	cam.End3D();
end;