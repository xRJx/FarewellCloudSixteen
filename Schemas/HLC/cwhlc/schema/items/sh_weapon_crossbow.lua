local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Crossbow";
ITEM.cost = 400;
ITEM.model = "models/weapons/w_crossbow.mdl";
ITEM.weight = 5;
ITEM.access = "V";
ITEM.uniqueID = "weapon_crossbow";
ITEM.business = false;
ITEM.description = "A weapon constructed from various scrap materials.";
ITEM.isAttachment = true;
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentOffsetAngles = Angle(270, 0, 0);
ITEM.attachmentOffsetVector = Vector(3, 7, -3);

ITEM:Register();