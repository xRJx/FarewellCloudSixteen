local PLUGIN = PLUGIN;

-- BEGIN RADIO JAMMER STUFF --
local playerMeta = FindMetaTable("Player");
-- A function to handle a player's implants.
function playerMeta:HandleRadioJammer()
	local radioJammer = self:GetWeapon("cw_radio_jammer");
	
	if (IsValid(radioJammer) and radioJammer:IsActivated() and self:Alive()) then
		self:SetSharedVar("jammed", 1);
		self:SetSharedVar("jammerActive", 1);
	else
		self:SetSharedVar("jammerActive", 0);
		
		for k, v in pairs(ents.FindInSphere(self:GetPos(), Clockwork.kernel:GetSharedVar("jammingDistance"))) do
			if (v:IsPlayer()) then
				v:SetSharedVar("jammed", 0);
			end;
		end;
	end;
end;
-- END RADIO JAMMER STUFF --

-- BEGIN UED ORGANIZATION STUFF --
Clockwork.datastream:Hook("EditReport", function(player, data)
	if (player.editReportAuthorised == data[1] and type( data[2] ) == "string") then
		data[1]:SetCharacterData( "combinereport", string.sub(data[2], 0, 500) );
		
		player.editReportAuthorised = nil;
	end;
end);
-- END UED ORGANIZATION STUFF --