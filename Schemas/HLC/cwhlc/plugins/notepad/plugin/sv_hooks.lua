--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();
	
	local uniqueID = Clockwork.entity:QueryProperty(entity, "uniqueID");
		
	if (class == "cw_notepad") then
		if (entity.text and arguments == "cw_notepadReadOption") then
			if (!player.notepadIDs or !player.notepadIDs[entity.uniqueID]) then
				if (!player.notepadIDs) then
					player.notepadIDs = {};
				end;
				
				player.notepadIDs[entity.uniqueID] = true;
				Clockwork.datastream:Start(player, "ViewNotepad", {entity, entity.uniqueID, entity.text});
			else
				Clockwork.datastream:Start(player, "ViewNotepad", {entity, entity.uniqueID});
			end;
		elseif ( arguments == "cw_notepadEditOption" ) then
			if (uniqueID == player:UniqueID()) then
				if (!player.notepadIDs or !player.notepadIDs[entity.uniqueID]) then
					if (!player.notepadIDs) then
						player.notepadIDs = {};
					end;
					
					player.notepadIDs[entity.uniqueID] = true;
					Clockwork.datastream:Start(player, "EditNotepad", {entity, entity.uniqueID, entity.text});
				else
					Clockwork.datastream:Start(player, "EditNotepad", {entity, entity.uniqueID});
				end;
			else
				Clockwork.player:Notify(player, "You do not own this notepad!");
			end;
		else
			Clockwork.datastream:Start(player, "EditNotepad", {entity, entity.uniqueID});
		end;
	end;
end;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadNotepad();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveNotepad();
end;