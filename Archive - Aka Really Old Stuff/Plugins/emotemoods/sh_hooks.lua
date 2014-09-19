--[[
	© 2012 Slidefuse LLC
	This plugin is released under the MIT license. Do whatever!
--]]

local PLUGIN = PLUGIN

hook.Add("CalcMainActivity", "OverrideOACrapHooks", function(player, velocity)
	self = PLUGIN
	if (self:GetPlayerMood(player) and self:GetPlayerMood(player) != "Default") then

		local mood = self:GetPlayerMood(player)
		local moodTable = self.LookupTable[mood]
		local model = player:GetModel()	
		player.CalcIdeal = openAura.animation:GetForModel(model, "stand_idle")
		player.CalcSeqOverride = -1
		if (!openAura:HandlePlayerDriving(player)
		and !openAura:HandlePlayerJumping(player)
		and !openAura:HandlePlayerDucking(player, velocity)
		and !openAura:HandlePlayerSwimming(player)) then
			if (velocity:Length2D() < 0.5) then
				player.CalcSeqOverride = moodTable["idle"]
			elseif (velocity:Length2D() >= 0.5 and !player:IsJogging() and !player:IsRunning()) then
				if (moodTable["walk"] != nil) then
					player.CalcSeqOverride = moodTable["walk"]
				end
			end
		end

		if (player.CalcSeqOverride != -1) then
			player.CalcSeqOverride = player:LookupSequence(player.CalcSeqOverride)
			return player.CalcIdeal, player.CalcSeqOverride
		end
	end

end)