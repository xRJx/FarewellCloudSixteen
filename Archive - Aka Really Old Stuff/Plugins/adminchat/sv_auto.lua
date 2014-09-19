--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN

-- This just adds a nice tag so the developer (me, Spencer) can see if you're using the script, I like to see who uses my stuff. All it does is add a tag to the server.
function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end
	
	if (!string.find(GetConVarString('sv_tags'), "sf_adminchat")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_adminchat");
	end
end

-- Called when a player chats
function PLUGIN:PlayerSay(player, text, public)
	if (string.sub(text, 1, 1) == "@") then
		text = string.Trim(string.sub(text, 2))

		if (text != "") then
			if (player:IsAdmin() or player:IsUserGroup("operator")) then
				openAura.chatBox:Add(self:AdminList(), player, "adminchat", text)
				return ""
			else
				-- Do nothing and let the idiots try to talk with an @ symbol
			end
		end
	end
end

-- A quick utility function to get a list of all the admins on the server
function PLUGIN:AdminList()
	local admins = {}
	for k, v in pairs(_player.GetAll()) do
		if (v:IsAdmin() or v:IsUserGroup("operator")) then table.insert(admins, v) end
	end
	return admins
end