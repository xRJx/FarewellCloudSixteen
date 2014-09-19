local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("EditObjectives", function(player, data)
	if (player.editObjectivesAuthorised and type(data) == "string") then
		if (PLUGIN.combineObjectives != data) then
			Schema:AddCombineDisplayLine("Downloading recent objectives...", Color(255, 100, 255, 255));
			PLUGIN.combineObjectives = string.sub(data, 0, 500);
			
			Clockwork.kernel:SaveSchemaData("objectives", {
				text = PLUGIN.combineObjectives
			});
		end;
		
		player.editObjectivesAuthorised = nil;
	end;
end);

-- A function to load the objectives.
function PLUGIN:LoadObjectives()
	local combineObjectives = Clockwork.kernel:RestoreSchemaData("objectives");
	
	if (combineObjectives and combineObjectives.text) then
		self.combineObjectives = combineObjectives.text;
	else
		self.combineObjectives = "";
	end;
end;