local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
    self:LoadFields();
end;

-- Called when data should be saved.
function PLUGIN:PostSaveData()
	self:SaveFields();
end;