local ITEM = Clockwork.item:New("furniture_base");

ITEM.name = "Park Bench";
ITEM.model = "models/props_junk/wood_crate002a.mdl";
ITEM.weight = 1;
ITEM.access = "1";
ITEM.business = true;
ITEM.description = "";

-- Called when a player uses the item.
function ITEM:GetEntityName()
	return "cw_furniture_bench_park"
end;

ITEM:Register();