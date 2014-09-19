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
end);