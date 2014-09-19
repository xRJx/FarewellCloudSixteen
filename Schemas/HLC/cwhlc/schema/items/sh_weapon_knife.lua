--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Knife";
ITEM.model = "models/weapons/w_knife_t.mdl";
ITEM.plural = "Knives";
ITEM.weight = 0.75;
ITEM.business = true;
ITEM.category = "Melee";
ITEM.weaponClass = "cw_knife";
ITEM.description = "A compact metal knife good for jibbing up humans.";
ITEM.meleeWeapon = true;
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-18, -5, 5);
ITEM.loweredAngles = Angle(-10, 10, -80);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(20, 0, -90);
ITEM.attachmentOffsetVector = Vector(2, -2, 8);

Clockwork.item:Register(ITEM);