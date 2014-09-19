--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Plank";
ITEM.model = "models/weapons/w_plank.mdl";
ITEM.weight = 1;
ITEM.uniqueID = "cw_plank";
ITEM.category = "Melee";
ITEM.description = "A heavy wooden plank with some nails in the end.";
ITEM.meleeWeapon = true;
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-12, 2, 0);
ITEM.loweredAngles = Angle(-25, 15, -80);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 255, -90);
ITEM.attachmentOffsetVector = Vector(5, 5, -8);

Clockwork.item:Register(ITEM);