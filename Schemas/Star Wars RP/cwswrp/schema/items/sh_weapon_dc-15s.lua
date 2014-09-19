local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "DC-15s";
ITEM.cost = 100;
ITEM.model = "models/weapons/w_pist_p228.mdl";
ITEM.weight = 1.5;
ITEM.business = true;
ITEM.uniqueID = "cw_weapon_dc-15s";
ITEM.description = "The main sidearm available in advanced weaponry.";
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 90);
ITEM.attachmentOffsetVector = Vector(0, 4, -8);

ITEM:Register();