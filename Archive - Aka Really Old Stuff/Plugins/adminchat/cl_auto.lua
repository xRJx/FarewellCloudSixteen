--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN;

function PLUGIN:ChatBoxAdjustInfo(info)
	if (info.class == "adminchat") then
		openAura.chatBox:Add(info.filtered, nil, Color(180, 0, 255, 255), "[ADMIN] ", Color(222, 184, 234, 255), info.name, ": "..info.text);
	end
end