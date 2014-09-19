local PLUGIN = PLUGIN;

local ITEM = Clockwork.item:New();

ITEM.name = "Zip Tie";
ITEM.cost = 4;
ITEM.model = "models/items/crossbowrounds.mdl";
ITEM.weight = 0.2;
ITEM.access = "v";
ITEM.useText = "Tie";
ITEM.business = true;
ITEM.description = "An orange zip tie with Thomas and Betts printed on the side.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (player.isTying) then
		Clockwork.player:Notify(player, "You are already tying a character!");
		
		return false;
	else
		local trace = player:GetEyeTraceNoCursor();
		local target = Clockwork.entity:GetPlayer(trace.Entity);
		local tieTime = PLUGIN:GetDexterityTime(player);
		
		if (target) then
			if (target:GetSharedVar("tied") == 0) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetAimVector():DotProduct( player:GetAimVector() ) > 0 or target:IsRagdolled()) then
						Clockwork.player:SetAction(player, "tie", tieTime);
						
						Clockwork.player:EntityConditionTimer(player, target, trace.Entity, tieTime, 192, function()
							if (player:Alive() and !player:IsRagdolled() and target:GetSharedVar("tied") == 0
							and target:GetAimVector():DotProduct( player:GetAimVector() ) > 0) then
								return true;
							end;
						end, function(success)
							if (success) then
								player.isTying = nil;
								
								PLUGIN:TiePlayer( target, true, nil);
								
								player:TakeItem(self);
								player:ProgressAttribute(ATB_DEXTERITY, 15, true);
							else
								player.isTying = nil;
							end;
							
							Clockwork.player:SetAction(player, "tie", false);
						end);
					else
						Clockwork.player:Notify(player, "You cannot tie characters that are facing you!");
						
						return false;
					end;
					
					player.isTying = true;
					
					Clockwork.player:SetMenuOpen(player, false);
					
					return false;
				else
					Clockwork.player:Notify(player, "This character is too far away!");
					
					return false;
				end;
			else
				Clockwork.player:Notify(player, "This character is already tied!");
				
				return false;
			end;
		else
			Clockwork.player:Notify(player, "That is not a valid character!");
			
			return false;
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if (player.isTying) then
		Clockwork.player:Notify(player, "You are currently tying a character!");
		
		return false;
	end;
end;

ITEM:Register();