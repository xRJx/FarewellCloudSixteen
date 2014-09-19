local PLUGIN = PLUGIN;

-- An awful function for checking if an entity is a designated furniture entity.
function PLUGIN:isFurniture(entity)
	local class = entity:GetClass();
	
	return
	(
		class == "cw_furniture_beige_seat" || 
		class == "cw_furniture_blue_couch" || 
		class == "cw_furniture_cabinet" || 
		class == "cw_furniture_cafe_bench" || 
		class == "cw_furniture_cafe_table" || 
		class == "cw_furniture_circular_table" || 
		class == "cw_furniture_coffee_table" || 
		class == "cw_furniture_dining_chair" || 
		class == "cw_furniture_dresser" || 
		class == "cw_furniture_foldable_chair" || 
		class == "cw_furniture_garden_bench" || 
		class == "cw_furniture_green_couch" || 
		class == "cw_furniture_leather_seat" || 
		class == "cw_furniture_metal_chair" || 
		class == "cw_furniture_metal_desk" || 
		class == "cw_furniture_office_chair" || 
		class == "cw_furniture_outdoor_bench" || 
		class == "cw_furniture_park_bench" || 
		class == "cw_furniture_perch_bench" || 
		class == "cw_furniture_rectangular_table" || 
		class == "cw_furniture_red_couch" || 
		class == "cw_furniture_shelf" || 
		class == "cw_furniture_stool" || 
		class == "cw_furniture_wooden_chair" || 
		class == "cw_furniture_wooden_desk"
	)
end;