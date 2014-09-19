--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Baseball Bat";
ITEM.model = "models/weapons/w_basball.mdl";
ITEM.weight = 1.5;
ITEM.uniqueID = "cw_baseballbat";
ITEM.category = "Melee";
ITEM.description = "A fairly large baseball bat - it isn't shiny anymore.";
ITEM.meleeWeapon = true;
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-12, 2, 0);
ITEM.loweredAngles = Angle(-25, 15, -80);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(90, 180, 20);
ITEM.attachmentOffsetVector = Vector(0, 7, 0);

Clockwork.item:Register(ITEM);