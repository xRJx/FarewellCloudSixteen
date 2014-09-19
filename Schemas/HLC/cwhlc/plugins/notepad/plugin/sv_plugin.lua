--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

Clockwork.datastream:Hook("EditNotepad", function(player, data)
	if (IsValid( data[1] )) then
		if (data[1]:GetClass() == "cw_notepad") then
			if (player:GetPos():Distance( data[1]:GetPos() ) <= 192 and player:GetEyeTraceNoCursor().Entity == data[1]) then
				if (string.len( data[2] ) > 0) then
					data[1]:SetText( string.sub(data[2], 0, 500) );
				end;
			end;
		end;
	end;
end);

-- A function to load the notepads.
function PLUGIN:LoadNotepad()
	local notepad = Clockwork.kernel:RestoreSchemaData( "plugins/notepad/"..game.GetMap() );
	
	for k, v in pairs(notepad) do
		local entity = ents.Create("cw_notepad");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetText(v.text);
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if (IsValid(physicsObject)) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the notepads.
function PLUGIN:SaveNotepad()
	local notepad = {};
	
	for k, v in pairs( ents.FindByClass("cw_notepad") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		notepad[#notepad + 1] = {
			key = Clockwork.entity:QueryProperty(v, "key"),
			text = v.text,
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/notepad/"..game.GetMap(), notepad);
end;