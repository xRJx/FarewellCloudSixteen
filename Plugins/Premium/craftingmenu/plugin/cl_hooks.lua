local PLUGIN = PLUGIN;

-- Called when the local player's crafting is rebuilt.
function PLUGIN:PlayerCraftingRebuilt(panel, categories)
	local craftingName = Clockwork.option:GetKey("name_crafting", true);
	
	if (!self.craftingPanel) then
		self.craftingPanel = panel;
	end;
	
	if (Clockwork.config:Get("craftingMenu"):Get()) then
		local craftingMenu = {};
		
		if (table.Count(craftingMenu) > 0) then
			local panelList = vgui.Create("DPanelList", panel);
			
			panel.craftingMenuForm = vgui.Create("DForm");
			panel.craftingMenuForm:SetName("Crafting menu");
			panel.craftingMenuForm:SetPadding(4);
			
			panelList:SetAutoSize(true);
			panelList:SetPadding(4);
			panelList:SetSpacing(4);
			
			panel.craftingMenuForm:AddItem(panelList);
			panel.panelList:AddItem(panel.craftingMenuForm);
		end;
	end;
end;