--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.base = "weapon_base";
ITEM.name = "Pulse-Rifle";
ITEM.cost = 400;
ITEM.model = "models/weapons/w_irifle.mdl";
ITEM.weight = 4;
ITEM.access = "U";
ITEM.classes = {CLASS_EOW};
ITEM.uniqueID = "weapon_ar2";
ITEM.business = true;
ITEM.description = "A weapon which does not seem to have been crafted on Earth.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);

function ITEM:OnUse(player)
	if ( openAura.schema:PlayerIsCombine(player) ) then
  player:Give("weapon_ar2", 1, true);
 else
  openAura.player:Notify(player, "You are not the Combine!");
 	return false;
 end;
end;

openAura.item:Register(ITEM);