local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("ViewNews", function(data)
	if (PLUGIN.newsPanel and PLUGIN.newsPanel:IsValid()) then
		PLUGIN.newsPanel:Close();
		PLUGIN.newsPanel:Remove();
	end;
	
	PLUGIN.newsPanel = vgui.Create("cwNews");
	PLUGIN.newsPanel:Populate();
	PLUGIN.newsPanel:MakePopup();
	
	gui.EnableScreenClicker(true);
end);