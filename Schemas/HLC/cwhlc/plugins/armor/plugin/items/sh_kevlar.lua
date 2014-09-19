--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Kevlar";
ITEM.model = "models/props_c17/BriefCase001a.mdl";
ITEM.weight = 4;
ITEM.useText = "Wear";
ITEM.category = "Armor";
ITEM.access = "V";
ITEM.business = true;
ITEM.protection = 0.9;
ITEM.description = "A kevlar vest that absorbs the impact of incoming projectiles.";

ITEM.isAttachment = true;
ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
ITEM.attachmentModel = "models/kevlarvest/kevlarlite.mdl";
ITEM.attachmentOffsetAngles = Angle(0, 270, 90);
ITEM.attachmentOffsetVector = Vector(0, -3, -56);

-- Called when the attachment offset info should be adjusted.
function ITEM:AdjustAttachmentOffsetInfo(player, entity, info)
	if ( string.find(player:GetModel(), "female") ) then
		info.offsetAngle = Angle(10, 270, 80);
		info.offsetVector = Vector(0, -1.5, -58.5);
	end;
end;

-- A function to get whether the attachment is visible.
function ITEM:GetAttachmentVisible(player, entity)
	if ( player:GetSharedVar("Kevlar") ) then
		return true;
	end;
end;

-- Called when the item's local amount is needed.
function ITEM:GetLocalAmount(amount)
	if ( Clockwork.Client:GetSharedVar("Kevlar") ) then
		return amount - 1;
	else
		return amount;
	end;
end;

-- Called to get whether a player has the item equipped.
function ITEM:HasPlayerEquipped(player, arguments)
	return player:GetSharedVar("Kevlar");
end;

-- Called when a player has unequipped the item.
function ITEM:OnPlayerUnequipped(player, arguments)
	local Kevlar = Clockwork.player:GetGear(player, "Kevlar");
	
	if ( player:GetSharedVar("Kevlar") and IsValid(Kevlar) ) then
		player:SetCharacterData("Kevlar", nil);
		player:SetSharedVar("Kevlar", false);
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if ( player:Alive() and !player:IsRagdolled() ) then
		Clockwork.player:CreateGear(player, "Kevlar", self);
		
		player:SetCharacterData("Kevlar", true);
		player:SetSharedVar("Kevlar", true);
		
		player:EmitSound("items/battery_pickup.wav");
		
		if (itemEntity) then
			return true;
		end;
	else
		Clockwork.player:Notify(player, "You don't have permission to do this right now!");
	end;
	
	return false;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if (player:GetSharedVar("Kevlar") and player:HasItem(self.uniqueID) == 1) then
		Clockwork.player:Notify(player, "You cannot drop this while you are wearing it!");
		
		return false;
	end;
end;

ITEM:Register();