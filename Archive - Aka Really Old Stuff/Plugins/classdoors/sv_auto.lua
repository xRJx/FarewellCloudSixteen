--[[
	Name: sv_auto.lua.
	Author: Snazzy.
--]]

local PLUGIN = PLUGIN;
PLUGIN.classDoors = {};

openAura:IncludePrefixed("sh_auto.lua");

-- A function to get whether a player has a flashlight.
function PLUGIN:AddClassDoor(class, doorName)
	if(!self.classDoors[doorName])then
		self.classDoors[doorName] = {};
	end;
	
	table.insert(self.classDoors[doorName], class);
end;

--[[
	You can easily add a door, that can only be accessed by a certain class by doing:		
		PLUGIN:AddClassDoor(Class Enumeration, Door Name);
	As shown in the examples below
--]]
PLUGIN:AddClassDoor(CLASS_CEDA, "Supplies Room");
PLUGIN:AddClassDoor(CLASS_CEDA, "Rangers Office");
PLUGIN:AddClassDoor(CLASS_CEDA, "Rangers");
PLUGIN:AddClassDoor(CLASS_BANDIT, "Bandits");
PLUGIN:AddClassDoor(CLASS_COMMUNIST, "Communists");
PLUGIN:AddClassDoor(CLASS_NAZI, "Fourth Reich");
PLUGIN:AddClassDoor(CLASS_NAZI, "4th Reich");
PLUGIN:AddClassDoor(CLASS_NAZI, "Nazis");
PLUGIN:AddClassDoor(CLASS_STALKER, "Stalker");
PLUGIN:AddClassDoor(CLASS_STALKER, "Stalkers");