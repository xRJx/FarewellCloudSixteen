local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("Frequency", function(data)
	Derma_StringRequest("Frequency", "What would you like to set the frequency to?", data, function(text)
		Clockwork.kernel:RunCommand("SetFreq", text);
		
		if (!Clockwork.menu:GetOpen()) then
			gui.EnableScreenClicker(false);
		end;
	end);
	
	if (!Clockwork.menu:GetOpen()) then
		gui.EnableScreenClicker(true);
	end;
end);