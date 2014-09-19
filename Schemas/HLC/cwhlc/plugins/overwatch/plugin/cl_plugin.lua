local PLUGIN = PLUGIN;

Clockwork.directory:AddCategory("Overwatch", "Voices");

Clockwork.chatBox:RegisterClass("overwatch_eavesdrop", "ic", function(info)
	if (info.shouldHear) then
		Clockwork.chatBox:Add(info.filtered, nil, Color(75, 150, 50, 255), "Overwatch dispatches \""..info.text.."\"");
	end;
end);

Clockwork.chatBox:RegisterClass("overwatch", "ic", function(info)
	Clockwork.chatBox:Add(info.filtered, nil, Color(75, 150, 50, 255), "Overwatch dispatches \""..info.text.."\"");
end);