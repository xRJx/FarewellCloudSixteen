local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Radio Jammer";
ITEM.description = "A small device with a semi-dish on its side.";
ITEM.business = true;
ITEM.classes = {CLASS_EMP};
ITEM.cost = 300;
ITEM.isMeleeWeapon = true;
ITEM.model = "models/gibs/manhack_gib03.mdl";
ITEM.uniqueID = "cw_radio_jammer";
ITEM.weight = 0.5;

ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(180, 0, 0);
ITEM.attachmentOffsetVector = Vector(5, 4.7, 4);

ITEM:Register();