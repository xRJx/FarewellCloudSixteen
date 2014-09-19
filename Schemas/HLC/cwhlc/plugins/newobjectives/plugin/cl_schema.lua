--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("EditObjectives", function(data)
	if (PLUGIN.objectivesPanel and PLUGIN.objectivesPanel:IsValid()) then
		PLUGIN.objectivesPanel:Close();
		PLUGIN.objectivesPanel:Remove();
	end;
	
	PLUGIN.objectivesPanel = vgui.Create("cwEditObjectives");
	PLUGIN.objectivesPanel:Populate(data or "");
	PLUGIN.objectivesPanel:MakePopup();
	
	gui.EnableScreenClicker(true);
end);

Clockwork.datastream:Hook("ViewObjectives", function(data)
	if (PLUGIN.objectivesPanel and PLUGIN.objectivesPanel:IsValid()) then
		PLUGIN.objectivesPanel:Close();
		PLUGIN.objectivesPanel:Remove();
	end;
	
	PLUGIN.objectivesPanel = vgui.Create("cwViewObjectives");
	PLUGIN.objectivesPanel:Populate(data or "");
	PLUGIN.objectivesPanel:MakePopup();
	
	gui.EnableScreenClicker(true);
end);