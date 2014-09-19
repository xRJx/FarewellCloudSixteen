local PLUGIN = PLUGIN;

-- Called when the local player's crafting is rebuilt.
function PLUGIN:PlayerCraftingRebuilt(panel, categories)
	local craftingName = Clockwork.option:GetKey("name_crafting", true);
	
	if (!self.craftingPanel) then
		self.craftingPanel = panel;
	end;
	
	if (Clockwork.config:Get("schemes"):Get() and Clockwork.Client:GetFaction() == FACTION_CITIZEN) then
		local schemes = {};
		
		for k, v in pairs(Clockwork.item:GetAll()) do
			if (v("cost") and v("access") and !Clockwork.kernel:HasObjectAccess(Clockwork.Client, v)) then
				if (string.find(v("access"), "1")) then
					schemes.generalGoods = (schemes.generalGoods or 0) + (v.cost * v.batch);
				else
					for k2, v2 in pairs(PLUGIN.customSchemes) do
						if (string.find(v("access"), v2.flag)) then
							schemes[v2.key] = (schemes[v2.key] or 0) + (v.cost * v.batch);
							
							break;
						end;
					end;
				end;
			end;
		end;
		
		if (table.Count(schemes) > 0) then
			local panelList = vgui.Create("DPanelList", panel);
			
			panel.schemesForm = vgui.Create("DForm");
			panel.schemesForm:SetName("Schemes");
			panel.schemesForm:SetPadding(4);
			
			panelList:SetAutoSize(true);
			panelList:SetPadding(4);
			panelList:SetSpacing(4);
			
			if (Clockwork.player:HasFlags(Clockwork.Client, "x")) then
				for k, v in pairs(schemes) do
					panel.customData = {information = v};
					
					if (k == "generalGoods") then
						panel.customData.description = "Purchase a scheme to add general goods to your "..craftingName..".";
						panel.customData.Callback = function()
							Clockwork.kernel:RunCommand("SchemeBuy", "generalgoods");
						end;
						panel.customData.model = "models/props_junk/cardboard_box004a.mdl";
						panel.customData.name = "General Goods";
					else
						for k2, v2 in pairs(PLUGIN.customSchemes) do
							if (v2.key == k) then
								panel.customData.description = "Purchase a scheme to add "..string.lower(v2.name).." to your "..craftingName..".";
								panel.customData.Callback = function()
									Clockwork.kernel:RunCommand("SchemeBuy", k2);
								end;
								panel.customData.model = v2.model;
								panel.customData.name = v2.name;
								
								break;
							end;
						end;
					end;
					
					panelList:AddItem( vgui.Create("cwCraftingCustom", panel) );
				end;
			else
				panel.customData = {
					description = "Create a "..craftingName.." which allows you to purchase schemes.",
					information = Clockwork.config:Get("crafting_cost"):Get(),
					Callback = function()
						Clockwork.kernel:RunCommand("SchemeBuy", "crafting");
					end,
					model = "models/props_c17/briefcase001a.mdl",
					name = "Create "..Clockwork.option:GetKey("name_crafting")
				};
				
				panelList:AddItem( vgui.Create("cwCraftingCustom", panel) );
			end;
			
			panel.schemesForm:AddItem(panelList);
			panel.panelList:AddItem(panel.schemesForm);
		end;
	end;
end;

-- Called to check if a player does have an flag.
function PLUGIN:PlayerDoesHaveFlag(player, flag)
	if (!Clockwork.config:Get("schemes"):Get()) then
		if (flag == "x" or flag == "1") then
			return false;
		end;
		
		for k, v in pairs(self.customSchemes) do
			if (v.flag == flag) then
				return false;
			end;
		end;
	end;
end;