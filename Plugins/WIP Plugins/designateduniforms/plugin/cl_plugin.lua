local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("DesignateUniform", function(data)
	gui.EnableScreenClicker(true);
	
	local frame = vgui.Create("DFrame");
	frame:SetSize(180, 110);
	frame:Center();
	frame:SetTitle("Designator");
	frame:MakePopup();
	
	local tagline = vgui.Create("DTextEntry", frame);
	tagline:SetPos(40, 30);
	tagline:SetSize(100, 25);
	tagline:SetText("TAGLINE");
	
	local id = vgui.Create("DTextEntry", frame);
	id:SetPos(40, 55);
	id:SetSize(100, 25);
	id:SetText("ID");
	
	local button = vgui.Create("DButton", frame);
	button:SetPos(40, 80);
	button:SetSize(100, 20);
	button:SetText("Designate");
	
	button.DoClick = function()
		gui.EnableScreenClicker(false);
		Clockwork.kernel:RunCommand("DesignateUniform", tostring(tagline:GetValue()), tostring(id:GetValue()));
		frame:Close(); frame:Remove();
	end;
end);