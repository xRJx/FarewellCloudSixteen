local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Stunstick";
ITEM.cost = 100;
ITEM.model = "models/weapons/w_stunbaton.mdl";
ITEM.weight = 0.5;
ITEM.access = "V";
ITEM.classes = {CLASS_EMP, CLASS_EOW};
ITEM.uniqueID = "cw_stunstick";
ITEM.business = true;
ITEM.description = "A short rod coated in a dark gray.";
ITEM.isMeleeWeapon = true;
ITEM.isAttachment = true;
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 100);
ITEM.attachmentOffsetVector = Vector(0, 6.55, 8.72);

ITEM:Register();