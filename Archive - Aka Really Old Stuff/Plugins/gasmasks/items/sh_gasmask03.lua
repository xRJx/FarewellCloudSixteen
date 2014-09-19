ITEM = openAura.item:New();
ITEM.name = "Gas Mask 3";
ITEM.model = "models/maver1k_XVII/stcop_helm_exo.mdl";
ITEM.weight = 0.25;
ITEM.batch = 1;
ITEM.business = true;
ITEM.category = "Clothing";
ITEM.description = "A gas mask that keeps you breathing.";
ITEM.isAttachment = true;
ITEM.attachmentBone = "ValveBiped.Bip01_Head1";
ITEM.attachmentOffsetAngles = Angle(-90, -83.67, 0);
ITEM.attachmentOffsetVector = Vector(0, 1, 2.1);
ITEM.access = "y";
ITEM.cost = 1;

-- Called when the attachment offset info should be adjusted.
function ITEM:AdjustAttachmentOffsetInfo(player, entity, info)
	if ( string.find(player:GetModel(), "female") ) then
		info.offsetVector = Vector(0, 0, 0);
	end;
end;

-- A function to get whether the attachment is visible.
function ITEM:GetAttachmentVisible(player, entity)
	if ( player:GetSharedVar("gasmask3") ) then
		return true;
	end;
end;

-- Called when the item's local amount is needed.
function ITEM:GetLocalAmount(amount)
	if ( openAura.Client:GetSharedVar("gasmask3") ) then
		return amount - 1;
	else
		return amount;
	end;
end;

-- Called to get whether a player has the item equipped.
function ITEM:HasPlayerEquipped(player, arguments)
	return player:GetSharedVar("gasmask3");
end;

-- Called when a player has unequipped the item.
function ITEM:OnPlayerUnequipped(player, arguments)
	local skullMaskGear = openAura.player:GetGear(player, "gasmask3");
	
	if ( player:GetSharedVar("gasmask3") and IsValid(skullMaskGear) ) then
		player:SetCharacterData("gasmask3", nil);
		player:SetSharedVar("gasmask3", false);
		
		if ( IsValid(gasmask3Gear) ) then
			gasmask3Gear:Remove();
		end;
	end;
	
	player:UpdateInventory(self.uniqueID);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if (player:GetSharedVar("gasmask3") and player:HasItem(self.uniqueID) == 1) then
		openAura.player:Notify(player, "You cannot drop this while you are wearing it!");
		
		return false;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if ( player:Alive() and !player:IsRagdolled() ) then
		openAura.player:CreateGear(player, "gasmask3", self);
		
		player:SetCharacterData("gasmask3", true);
		player:SetSharedVar("gasmask3", true);
		player:UpdateInventory(self.uniqueID);
		
		if (itemEntity) then
			return true;
		end;
	else
		openAura.player:Notify(player, "You don't have permission to do this right now!");
	end;
	
	return false;
end;

openAura.item:Register(ITEM);