--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:OpenAuraInitPostEntity() self:LoadSurfaceTexts(); end;

-- Called when a player's data stream info should be sent.
function PLUGIN:PlayerSendDataStreamInfo(player)
	openAura:StartDataStream(player, "SurfaceTexts2", self.surfaceTexts);
end;