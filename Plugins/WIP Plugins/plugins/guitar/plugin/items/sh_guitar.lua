local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Guitar";
ITEM.cost = 999999;
ITEM.model = "models/acoustic guitar/acousticguitar.mdl";
ITEM.weight = 4;
ITEM.uniqueID = "cw_guitar";
ITEM.isMeleeWeapon = true;
ITEM.business = true;
ITEM.description = "A wooden acoustic guitar in a somewhat good condition.";
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-12, 2, 0);
ITEM.loweredAngles = Angle(-25, 15, -80);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(90, -10, 0);
ITEM.attachmentOffsetVector = Vector(-4.5, -2, 2);

-- Called when a player attempts to drop the weapon.
function ITEM:CanDropWeapon(player, attacker, bNoMsg)
	if (player:GetActiveWeapon().Song != nil) then
		if (player:GetActiveWeapon().Song:IsPlaying()) then
			Clockwork.player:Notify(player, "You cannot drop this while playing a song!");
			
			return false;
		end;
	end;
	
	return true;
end;

-- Called when a player attempts to holster the weapon.
function ITEM:CanHolsterWeapon(player, forceHolster, bNoMsg)
	if (player:GetActiveWeapon().Song != nil) then
		if (player:GetActiveWeapon().Song:IsPlaying()) then
			Clockwork.player:Notify(player, "You cannot switch this while playing a song!");
			
			return false;
		end;
	end;
	
	return true;
end;



ITEM:Register();