local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("Crafting cost", "crafting_cost", "The amount that it costs to start a crafting.");
Clockwork.config:AddToSystem("Crafting menu enabled", "craftingMenu", "Whether or not craftingMenu are enabled.");

Clockwork.datastream:Hook("RebuildCrafting", function(data)
	if (Clockwork.menu:GetOpen() and IsValid(PLUGIN.craftingPanel)) then
		if (Clockwork.menu:GetActivePanel() == PLUGIN.craftingPanel) then
			PLUGIN.craftingPanel:Rebuild();
		end;
	end;
end);

Clockwork.datastream:Hook("CraftTime", function(data)
	Clockwork.CraftCooldown = data;
	
	local activePanel = Clockwork.menu:GetActivePanel();
	
	if (activePanel and activePanel:GetPanelName() == Clockwork.option:GetKey("name_crafting")) then
		activePanel:Rebuild();
	end;
end);

-- Called when the local player's crafting is rebuilt.
function PLUGIN:PlayerCraftingRebuilt(panel, categories) end;

-- Called when the local player attempts to see a crafting item.
function PLUGIN:PlayerCanSeeCraftingItem(itemTable) return true; end;

-- Called when the menu's items should be adjusted.
function PLUGIN:MenuItemsAdd(menuItems)
	local craftingName = Clockwork.option:GetKey("name_crafting");
	
	menuItems:Add(craftingName, "cwCrafting", Clockwork.option:GetKey("description_crafting"));
end;

-- Called when the local player's crafting item should be adjusted.
function PLUGIN:PlayerAdjustCraftingItemTable(itemTable) end;