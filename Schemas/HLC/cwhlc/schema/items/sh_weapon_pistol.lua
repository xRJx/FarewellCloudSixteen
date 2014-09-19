local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "9mm Pistol";
ITEM.model = "models/weapons/w_pistol.mdl";
ITEM.weight = 1;
ITEM.access = "V";
ITEM.classes = {CLASS_OWS, CLASS_EOW, CLASS_CMD};
ITEM.uniqueID = "weapon_pistol";
ITEM.business = true;
ITEM.description = "A small pistol coated in a dull grey.";
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 90);
ITEM.attachmentOffsetVector = Vector(0, 4, -8);

ITEM:Register();