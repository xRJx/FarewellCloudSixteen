local PLUGIN = PLUGIN;

local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleRadioJammer()
	local radioJammer = self:GetWeapon("cw_radio_jammer");
	
	if (IsValid(radioJammer) and radioJammer:IsActivated() and self:Alive()) then
		self:SetSharedVar("jammed", 1);
		self:SetSharedVar("jammerActive", 1);
		print(self:Name() .. " was jammed.");
	else
		self:SetSharedVar("jammerActive", 0);
		
		for k, v in pairs(ents.FindInSphere(self:GetPos(), Clockwork.kernel:GetSharedVar("jammingDistance"))) do
			if (v:IsPlayer()) then
				if (v:GetSharedVar("jammerActive") != 1) then
					v:SetSharedVar("jammed", 0);
					print(v:Name() .. " was unjammed.");
				end;
			end;
		end;
	end;
end;