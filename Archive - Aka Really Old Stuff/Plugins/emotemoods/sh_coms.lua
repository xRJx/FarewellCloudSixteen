--[[
	© 2012 Slidefuse LLC
	This plugin is released under the MIT license. Do whatever!
--]]

local PLUGIN = PLUGIN

COMMAND = openAura.command:New()
COMMAND.tip = "Puts your character into a mood."
COMMAND.text = "<string moodType>"
COMMAND.flags = CMD_DEFAULT
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
		
	if (string.find(player:GetModel(), "group")) then
		if (table.HasValue(PLUGIN.PersonalityTypes, arguments[1])) then
			player:SetSharedVar("emoteMood", arguments[1])
		else
			openAura.player:Notify(player, "That is not a valid mood!")
		end
	else
		openAura.player:Notify(player, "Sorry, your model does not support moods!")
	end
end

openAura.command:Register(COMMAND, "SetMood")

if (CLIENT) then
	openAura.quickmenu:AddCommand("Set Mood", nil, "SetMood", PLUGIN.PersonalityTypes)
end