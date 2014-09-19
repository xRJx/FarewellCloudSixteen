--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Sledgehammer";
ITEM.model = "models/weapons/w_sledgehammer.mdl";
ITEM.weight = 2.5;
ITEM.uniqueID = "cw_sledgehammer";
ITEM.category = "Melee";
ITEM.description = "This beast can tear through anything.";
ITEM.meleeWeapon = true;
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-12, 2, 0);
ITEM.loweredAngles = Angle(-25, 15, -80);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 255, 0);
ITEM.attachmentOffsetVector = Vector(5, 5, -8);

Clockwork.item:Register(ITEM);