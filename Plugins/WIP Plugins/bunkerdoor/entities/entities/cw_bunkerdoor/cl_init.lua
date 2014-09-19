local Clockwork = Clockwork;

include("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
end;

-- Called when the entity should draw.
function ENT:Draw()
	self.Entity:DrawModel()
end;

function ENT:Think()
end;

local Alpha = 0;
hook.Add("HUDPaint", "FadeIn", function()
	if ( LocalPlayer():GetNWBool( "sFadeIn" ) ) then
		Alpha = math.min( Alpha + 15, 255 );
	else
		Alpha = math.max( Alpha - 5, 0 );
	end

	if ( Alpha == 0 ) then return end

	surface.SetDrawColor( 0, 0, 0, Alpha );
	surface.DrawRect( 0, 0, ScrW(), ScrH() );
end)

--[[function ENT:FadeIn()
	self:SetNetworkedBool(self:EntIndex().."sFadeIn", false);
	print("Screen is fading to black!");
	local alpha = 0;
	
	timer.Create("FadeInTimer - "..self:EntIndex(), 0.01, 0, function()
		if (alpha < 255) then
			alpha = alpha + 15;
			draw.RoundedBox( 2, 50, 50, 500, 500, Color(0, 0, 0, alpha) );
			print("Alpha set to "..alpha);
		else
			timer.Destroy("FadeInTimer - "..self:EntIndex());
			print("Timer destroyed.");
		end;
	end);
end;
hook.Add("HUDPaint", "FadeIn", FadeIn)

function ENT:FadeOut()
	self:SetNetworkedBool(self:EntIndex().."sFadeOut", false);
	print("Screen is fading to clear!");
	local alpha = 255;
	
	timer.Create("FadeOutTimer - "..self:EntIndex(), 0.01, 0, function()
		if (alpha > 0) then
			alpha = alpha - 15;
			draw.RoundedBox( 2, 0, 0, ScrW(), ScrH(), Color(0, 0, 0, alpha) );
			print("Alpha set to "..alpha);
		else
			timer.Destroy("FadeOutTimer - "..self:EntIndex());
			print("Timer destroyed.");
		end;
	end);
end;
hook.Add("HUDPaint", "FadeOut", FadeOut)]]--