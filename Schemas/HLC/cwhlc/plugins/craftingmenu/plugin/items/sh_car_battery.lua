local ITEM = Clockwork.item:New();

ITEM.name = "Car Battery";
ITEM.model = "models/items/car_battery01.mdl";
ITEM.weight = 0.5;
ITEM.category = "Materials";
ITEM.description = "A battery that used to be in a car.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();