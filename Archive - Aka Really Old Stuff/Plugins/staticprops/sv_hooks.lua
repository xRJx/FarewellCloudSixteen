--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:OpenAuraInitPostEntity()
	self:LoadStaticProps();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveStaticProps();
end;