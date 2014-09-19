local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "RPG Missile";
ITEM.cost = 80;
ITEM.model = "models/weapons/w_missile_launch.mdl";
ITEM.access = "V";
ITEM.weight = 2;
ITEM.uniqueID = "ammo_rpg_round";
ITEM.business = false;
ITEM.ammoClass = "rpg_round";
ITEM.ammoAmount = 1;
ITEM.description = "A orange and white colored rocket, what would happen if I dropped this?";

ITEM:Register();