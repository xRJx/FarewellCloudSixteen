local COMMAND = Clockwork.command:New("SchemeBuy");
COMMAND.tip = "Purchase a scheme for your character.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Clockwork.config:Get("schemes"):Get()) then
		if (player:GetFaction() == FACTION_CITIZEN) then
			if (Clockwork.player:HasFlags(player, "x")) then
				local schemes = {};
				local scheme = string.lower( arguments[1] );
				
				for k, v in pairs( Clockwork.item:GetAll() ) do
					if (v.cost and v.access and !Clockwork.kernel:HasObjectAccess(player, v)) then
						if (string.find(v.access, "1")) then
							schemes.generalGoods = (schemes.generalGoods or 0) + (v.cost * v.batch);
						else
							for k2, v2 in pairs(PLUGIN.customSchemes) do
								if (string.find(v.access, v2.flag)) then
									schemes[v2.key] = (schemes[v2.key] or 0) + (v.cost * v.batch);
									
									break;
								end;
							end;
						end;
					end;
				end;
				
				if (table.Count(schemes) > 0) then
					for k, v in pairs(schemes) do
						if (string.lower(k) == scheme) then
							local cost = v;
							
							if (Clockwork.player:CanAfford(player, cost)) then
								if (scheme == "generalgoods") then
									Clockwork.player:GiveCash(player, -cost, "buying general goods scheme");
									Clockwork.player:GiveFlags(player, "1");
								else
									local schemeTable = PLUGIN.customSchemes[scheme];
									
									if (schemeTable) then
										Clockwork.player:GiveCash(player, -cost, "buying "..string.lower(schemeTable.name).." scheme");
										Clockwork.player:GiveFlags(player, schemeTable.flag);
									end;
								end;
								
								timer.Simple(0.5, function()
									if (IsValid(player)) then
										Clockwork.datastream:Start(player, "RebuildCrafting", true);
									end;
								end);
							else
								local amount = cost - player:QueryCharacter("cash");
								Clockwork.player:Notify(player, "You need another "..Clockwork.kernel:FormatCash(amount, nil, true).."!");
							end;
							
							return;
						end;
					end;
					
					if (scheme == "generalgoods" or PLUGIN.customSchemes[scheme]) then
						Clockwork.player:Notify(player, "You already have this scheme!");
					else
						Clockwork.player:Notify(player, "This is not a valid scheme!");
					end;
				else
					Clockwork.player:Notify(player, "You already have this scheme!");
				end;
			elseif (string.lower( arguments[1] ) == "crafting") then
				local cost = Clockwork.config:Get("crafting_cost"):Get();
				
				if (Clockwork.player:CanAfford(player, cost)) then
					Clockwork.player:GiveCash(player, -cost, "buying crafting scheme");
					Clockwork.player:GiveFlags(player, "x");
					
					timer.Simple(0.25, function()
						if (IsValid(player)) then
							Clockwork.datastream:Start(player, "RebuildCrafting", true);
						end;
					end);
				else
					local amount = cost - player:QueryCharacter("cash");
					Clockwork.player:Notify(player, "You need another "..Clockwork.kernel:FormatCash(amount, nil, true).."!");
				end;
			else
				Clockwork.player:Notify(player, "This is not a valid scheme!");
			end;
		else
			Clockwork.player:Notify(player, "You are not a citizen!");
		end;
	else
		Clockwork.player:Notify(player, "The scheme system has not been enabled!");
	end;
end;

COMMAND:Register();