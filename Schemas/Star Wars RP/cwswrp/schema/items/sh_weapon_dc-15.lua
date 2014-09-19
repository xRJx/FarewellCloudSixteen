local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "DC-15";
ITEM.cost = 400;
ITEM.model = "models/weapons/w_rif_famas.mdl";
ITEM.weight = 3;
ITEM.business = true;
ITEM.uniqueID = "cw_weapon_dc-15";
ITEM.description = "The main rifle available in advanced laser weaponry.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredAngles = Angle(0, 50, -30);
ITEM.loweredOrigin = Vector(0, 0, -6);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);

ITEM:Register();