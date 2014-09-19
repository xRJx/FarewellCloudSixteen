Clockwork.kernel:AddFile("resource/fonts/DIRTYEGO.ttf");

Clockwork.kernel:AddDirectory("materials/hlc/");

Clockwork.config:Add("intro_text_small", "Three years after the riots...", true);
Clockwork.config:Add("intro_text_big", "THE WASTELAND, 2023.", true);

-- A function to add a human hint.
function Clockwork.hint:AddHumanHint(name, text, combine)
	Clockwork.hint:Add(name, text, function(player)
		if (player) then
			return !Schema:PlayerIsCombine(player, combine);
		end;
	end);
end;

Clockwork.hint:AddHumanHint("Life", "Your character is only human, refrain from jumping off high ledges.", false);
Clockwork.hint:AddHumanHint("Sleep", "Don't forget to sleep, your character does get tired.", false);
Clockwork.hint:AddHumanHint("Eating", "Just because you don't have to eat, it doesn't mean your character isn't hungry.", false);
Clockwork.hint:AddHumanHint("Friends", "Try to make some friends, misery loves company.", false);

Clockwork.hint:AddHumanHint("Combine", "Don't mess with the Combine, they took over Earth in 7 hours.");
Clockwork.hint:AddHumanHint("Punching", "Got that feeling you just wanna punch somebody? Don't.");
Clockwork.hint:AddHumanHint("Combine Raids", "When the Combine come knocking, get your ass out of there.");

Clockwork.hint:Add("Admins", "The admins are here to help you, please respect them.");
Clockwork.hint:Add("Action", "Action. Stop looking for it, wait until it comes to you.");
Clockwork.hint:Add("Grammar", "Try to speak correctly in-character, and don't use emoticons.");
Clockwork.hint:Add("Running", "Got somewhere to go? Fancy a run? Well don't, it's uncivilized.");
Clockwork.hint:Add("Healing", "You can heal players by using the Give command in your inventory.");
Clockwork.hint:Add("F3 Hotkey", "Press F3 while looking at a character to use a zip tie.");
Clockwork.hint:Add("F4 Hotkey", "Press F3 while looking at a tied character to search them.");
Clockwork.hint:Add("Attributes", "Whoring *(name_attributes)* is a permanant ban, we don't recommend it.");
Clockwork.hint:Add("Firefights", "When engaged in a firefight, shoot to miss to make it enjoyable.");
Clockwork.hint:Add("Metagaming", "Metagaming is when you use OOC information in-character.");
Clockwork.hint:Add("Passive RP", "If you're bored and there's no action, try some passive roleplay.");
Clockwork.hint:Add("Development", "Develop your character, give them a story to tell.");
Clockwork.hint:Add("Powergaming", "Powergaming is when you force your actions on others.");

-- A function to bust down a door.
function Schema:BustDownDoor(player, door, force)
	door.bustedDown = true;
	
	door:SetNotSolid(true);
	door:DrawShadow(false);
	door:SetNoDraw(true);
	door:EmitSound("physics/wood/wood_box_impact_hard3.wav");
	door:Fire("Unlock", "", 0);
	
	if (IsValid(door.combineLock)) then
		door.combineLock:Explode();
		door.combineLock:Remove();
	end;
	
	if (IsValid(door.breach)) then
		door.breach:BreachEntity();
	end;
	
	local fakeDoor = ents.Create("prop_physics");
	
	fakeDoor:SetCollisionGroup(COLLISION_GROUP_WORLD);
	fakeDoor:SetAngles( door:GetAngles() );
	fakeDoor:SetModel( door:GetModel() );
	fakeDoor:SetSkin( door:GetSkin() );
	fakeDoor:SetPos( door:GetPos() );
	fakeDoor:Spawn();
	
	local physicsObject = fakeDoor:GetPhysicsObject();
	
	if (IsValid(physicsObject)) then
		if (!force) then
			if (IsValid(player)) then
				physicsObject:ApplyForceCenter( (door:GetPos() - player:GetPos() ):GetNormal() * 10000 );
			end;
		else
			physicsObject:ApplyForceCenter(force);
		end;
	end;
	
	Clockwork.entity:Decay(fakeDoor, 300);
	
	Clockwork.kernel:CreateTimer("reset_door_"..door:EntIndex(), 300, 1, function()
		if (IsValid(door)) then
			door.bustedDown = nil;
			door:SetNotSolid(false);
			door:DrawShadow(true);
			door:SetNoDraw(false);
		end;
	end);
end;

-- A function to add a Combine display line.
function Schema:AddCombineDisplayLine(text, color, player, exclude)
	if (player) then
		Clockwork.datastream:Start( player, "CombineDisplayLine", {text, color} );
	else
		local players = {};
		
		for k, v in ipairs( _player.GetAll() ) do
			if (self:PlayerIsCombine(v) and v != exclude) then
				players[#players + 1] = v;
			end;
		end;
		
		Clockwork.datastream:Start(players, "CombineDisplayLine", {text, color});
	end;
end;

-- A function to get a player's location.
function Schema:PlayerGetLocation(player)
	local areaNames = Clockwork.plugin:FindByID("Area Names");
	local closest;
	
	if (areaNames) then
		for k, v in pairs(areaNames.areaNames) do
			if (Clockwork.entity:IsInBox(player, v.minimum, v.maximum)) then
				if (string.sub(string.lower(v.name), 1, 4) == "the ") then
					return string.sub(v.name, 5);
				else
					return v.name;
				end;
			else
				local distance = player:GetShootPos():Distance(v.minimum);
				
				if (!closest or distance < closest[1]) then
					closest = {distance, v.name};
				end;
			end;
		end;
		
		if (!completed) then
			if (closest) then
				if (string.sub(string.lower( closest[2] ), 1, 4) == "the ") then
					return string.sub(closest[2], 5);
				else
					return closest[2];
				end;
			end;
		end;
	end;
	
	return "unknown location";
end;

-- A function to check if a player is Combine.
function Schema:PlayerIsCombine(player, bHuman)
	if (IsValid(player) and player:GetCharacter()) then
		local faction = player:GetFaction();
		
		if (self:IsCombineFaction(faction)) then
			if (!bHuman or bHuman == true) then
				return true;
			end;
		end;
	end;
end;

-- A function to check if a player is Combine.
function Schema:PlayerIsCombine(player)
	if (IsValid(player) and player:GetCharacter()) then
		local faction = player:GetFaction();
		
		if (self:IsCombineFaction(faction)) then
			return true;
		else
			return false;
		end;
	end;
end;

-- A function to check if a player is Human.
function Schema:PlayerIsHuman(player)
	if (IsValid(player) and player:GetCharacter()) then
		local faction = player:GetFaction();
		
		if (self:IsHumanFaction(faction)) then
			return true;
		else
			return false;
		end;
	end;
end;

-- A function to check if a player is Vortigaunt.
function Schema:PlayerIsVortigaunt(player)
	if (IsValid(player) and player:GetCharacter()) then
		local faction = player:GetFaction();
		
		if (self:IsVortigauntFaction(faction)) then
			return true;
		else
			return false;
		end;
	end;
end;