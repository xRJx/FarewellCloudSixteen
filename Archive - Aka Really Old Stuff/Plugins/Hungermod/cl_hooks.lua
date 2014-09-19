-- Called when the local player's motion blurs should be adjusted.
function openAura.schema:PlayerAdjustMotionBlurs(motionBlurs)
	if ( openAura.Client:HasInitialized() ) then
		local hunger = openAura.Client:GetSharedVar("hunger");
		local data = math.max(hunger);
		
		if (data >= 90) then
			motionBlurs.blurTable["needs"] = 1 - ( (0.25 / 10) * ( 10 - (100 - data) ) );
		end;
	end;
end;

-- Called when the bars are needed.
function openAura.schema:GetBars(bars)
	local hunger = openAura.Client:GetSharedVar("hunger");
	
	if (!self.hunger) then
		self.hunger = hunger;
	else
		self.hunger = math.Approach(self.hunger, hunger, 1);
	end;
	
	local text,color = "Unknown", Color(255,255,255,255);
	
	if ( hunger <= 30 ) then
		text = "Well Fed";
		color = Color(34,139,34,255); -- green
	elseif( hunger <= 50 ) then
		text = "Satisfied";
		color = Color(102,255,51,255); -- lime green
	elseif( hunger <= 70 ) then
		text = "Hungry";
		color = Color(255,255,0,255); -- yellow
	elseif( hunger <= 80 ) then
		text = "Very Hungry"; -- orange
		color = Color(255,140,0,255);
	elseif( hunger <= 100 ) then
		text = "Starving"; -- red
		color = Color(255,0,0,255);
	end;
	
	bars:Add("HUNGER", color, text, self.hunger, 100, self.hunger > 90);
end;