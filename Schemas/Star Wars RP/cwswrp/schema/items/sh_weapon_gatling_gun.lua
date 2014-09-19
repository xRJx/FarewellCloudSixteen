local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Gatling Gun";
ITEM.cost = 800;
ITEM.model = "models/weapons/w_mach_m248para.mdl";
ITEM.weight = 6;
ITEM.access = "V";
ITEM.uniqueID = "cw_gatling_gun";
ITEM.business = false;
ITEM.description = "A large weapon capable of shooting lasers at a high rate of fire.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);

ITEM:Register();