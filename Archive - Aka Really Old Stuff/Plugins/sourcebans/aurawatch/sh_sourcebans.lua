--[[
Name: "sh_unban.lua".
Author: Snazzy.
--]]

AURAWATCH = openAura.aurawatch:New();
AURAWATCH.name = "SourceBans";
AURAWATCH.toolTip = "Loads the sourcebans web page for you.";
AURAWATCH.doesCreateForm = true;

-- Called to get whether the local player has access to the moderator.
function AURAWATCH:HasAccess()
	local unbanTable = openAura.command:Get("SourceBanName");
	
	if ( unbanTable and openAura.player:HasFlags(openAura.Client, unbanTable.access) ) then
		return true;
	end;
end;

-- Called when the moderator should be displayed.
function AURAWATCH:OnDisplay(moderatorPanel, moderatorForm)
	local htmlPanel = vgui.Create("HTML");				
	htmlPanel:OpenURL("http://forum.avoxgaming.com/bans/");
	htmlPanel:SetTall(ScrH() / 2);

	moderatorForm:AddItem(htmlPanel);
end;

openAura.aurawatch:Register(AURAWATCH);