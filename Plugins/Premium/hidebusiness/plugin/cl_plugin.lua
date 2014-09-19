local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("Business hidden", "hide_business", "Whether or not the business panel is hidden.");

-- Called when the menu's items should be adjusted.
function PLUGIN:MenuItemsAdd(menuItems)
	local businessName = Clockwork.option:GetKey("name_business");
	
	if ( Clockwork.config:Get("hide_business"):Get() ) then
		menuItems:Add(businessName, "cwBusiness", Clockwork.option:GetKey("description_business"));
	end;
end;

-- Called when the menu's items should be destroyed.
function PLUGIN:MenuItemsDestroy(menuItems)
	local businessName = Clockwork.option:GetKey("name_business");
	
	if ( Clockwork.config:Get("hide_business"):Get() ) then
		menuItems:Destroy(businessName);
	end;
end;