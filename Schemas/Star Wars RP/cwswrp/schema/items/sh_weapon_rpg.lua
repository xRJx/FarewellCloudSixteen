local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "RPG";
ITEM.cost = 800;
ITEM.model = "models/weapons/w_rocket_launcher.mdl";
ITEM.weight = 6;
ITEM.access = "V";
ITEM.uniqueID = "weapon_rpg";
ITEM.business = false;
ITEM.description = "A large green weapon, you'd better hope it doesn't backfire.";
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);

ITEM:Register();