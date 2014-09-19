local PLUGIN = PLUGIN;

--The further down the list you go, the more unlikely it is to spawn.
--Rarities List:
--Abundant
--Common
--Uncommon
--Valuable
--Rare
--Legendary

PLUGIN.rarities = Clockwork.kernel:NewLibrary("Rarities");
ispRarities = {};

function PLUGIN.rarities:AddRarity(item, value)
	ispRarities[#ispRarities + 1] = {
		item = item,
		rarity = value
	};
end;

-- Guns
PLUGIN.rarities:AddRarity("crossbow", 		"Legendary");
PLUGIN.rarities:AddRarity(".357 magnum", 	"Rare");
PLUGIN.rarities:AddRarity("grenade", 		"Rare");
PLUGIN.rarities:AddRarity("shotgun", 		"Rare");
PLUGIN.rarities:AddRarity("mp7", 			"Valuable");
PLUGIN.rarities:AddRarity("9mm pistol", 	"Valuable");

-- Melee
PLUGIN.rarities:AddRarity("knife", 			"Valuable");
PLUGIN.rarities:AddRarity("woodaxe", 		"Valuable");
PLUGIN.rarities:AddRarity("sledgehammer", 	"Uncommon");
PLUGIN.rarities:AddRarity("baseball bat", 	"Uncommon");
PLUGIN.rarities:AddRarity("metal shovel", 	"Uncommon");
PLUGIN.rarities:AddRarity("plank", 			"Common");

-- Ammo
PLUGIN.rarities:AddRarity("crossbow bolts", 		"Rare");
PLUGIN.rarities:AddRarity(".357 magnum bullets", 	"Valuable");
PLUGIN.rarities:AddRarity("mp7 grenade", 			"Uncommon");
PLUGIN.rarities:AddRarity("shotgun shells", 		"Uncommon");
PLUGIN.rarities:AddRarity("smg bullets", 			"Common");
PLUGIN.rarities:AddRarity("9mm pistol bullets", 	"Common");

-- Clothes
PLUGIN.rarities:AddRarity("masked uniform", 		"Rare");
PLUGIN.rarities:AddRarity("resistance uniform", 	"Valuable");
PLUGIN.rarities:AddRarity("medic uniform", 			"Rare");

-- Food
PLUGIN.rarities:AddRarity("metropolice supplements", 	"Legendary");
PLUGIN.rarities:AddRarity("citizen supplements", 		"Legendary");
PLUGIN.rarities:AddRarity("melon", 						"Legendary");
PLUGIN.rarities:AddRarity("milk jug", 					"Rare");
PLUGIN.rarities:AddRarity("milk carton", 				"Rare");
PLUGIN.rarities:AddRarity("whiskey", 					"Rare");
PLUGIN.rarities:AddRarity("beer", 						"Rare");
PLUGIN.rarities:AddRarity("yellow soda", 				"Uncommon");
PLUGIN.rarities:AddRarity("red soda", 					"Uncommon");
PLUGIN.rarities:AddRarity("blue soda", 					"Uncommon");
PLUGIN.rarities:AddRarity("large soda", 				"Common");
PLUGIN.rarities:AddRarity("bleach", 					"Common");
PLUGIN.rarities:AddRarity("vegetable oil", 				"Common");
PLUGIN.rarities:AddRarity("chinese takeout", 			"Abundant");

-- Garbage
PLUGIN.rarities:AddRarity("empty jar", 				"Abundant");
PLUGIN.rarities:AddRarity("empty bagged bottle", 	"Abundant");
PLUGIN.rarities:AddRarity("empty bottle", 			"Abundant");
PLUGIN.rarities:AddRarity("empty bleach jug", 		"Abundant");
PLUGIN.rarities:AddRarity("empty yellow can", 		"Abundant");
PLUGIN.rarities:AddRarity("empty red can", 			"Abundant");
PLUGIN.rarities:AddRarity("empty blue can", 		"Abundant");
PLUGIN.rarities:AddRarity("eaten melon", 			"Abundant");
PLUGIN.rarities:AddRarity("empty milk jug", 		"Abundant");
PLUGIN.rarities:AddRarity("empty milk carton", 		"Abundant");
PLUGIN.rarities:AddRarity("empty soda bottle", 		"Abundant");
PLUGIN.rarities:AddRarity("empty vegetable oil", 	"Abundant");
PLUGIN.rarities:AddRarity("empty takeout carton", 	"Abundant");

-- Medical
PLUGIN.rarities:AddRarity("health kit", 	"Rare");
PLUGIN.rarities:AddRarity("health vial", 	"Valuable");
PLUGIN.rarities:AddRarity("bandage", 		"Uncommon");

-- Misc
PLUGIN.rarities:AddRarity("breach", 			"Rare");
PLUGIN.rarities:AddRarity("stationary radio", 	"Rare");
PLUGIN.rarities:AddRarity("handheld radio", 	"Rare");
PLUGIN.rarities:AddRarity("tinder box", 		"Valuable");
PLUGIN.rarities:AddRarity("boxed backpack", 	"Valuable");
PLUGIN.rarities:AddRarity("boxed bag", 			"Uncommon");
PLUGIN.rarities:AddRarity("spray can", 			"Uncommon");
PLUGIN.rarities:AddRarity("flashlight", 		"Uncommon");
PLUGIN.rarities:AddRarity("zip tie", 			"Uncommon");
PLUGIN.rarities:AddRarity("notepad", 			"Uncommon");
PLUGIN.rarities:AddRarity("paper", 				"Common");

-- Crafting Materials
PLUGIN.rarities:AddRarity("broken 357 magnum", 		"Valuable");
PLUGIN.rarities:AddRarity("broken shotgun", 		"Valuable");
PLUGIN.rarities:AddRarity("broken mp7", 			"Uncommon");
PLUGIN.rarities:AddRarity("broken 9mm pistol", 		"Uncommon");

PLUGIN.rarities:AddRarity("refined electronics", 	"Rare");
PLUGIN.rarities:AddRarity("refined metal", 			"Rare");
PLUGIN.rarities:AddRarity("reclaimed metal", 		"Valuable");
PLUGIN.rarities:AddRarity("scrap electronics", 		"Common");
PLUGIN.rarities:AddRarity("scrap metal", 			"Common");

PLUGIN.rarities:AddRarity("gunpowder", 				"Uncommon");
PLUGIN.rarities:AddRarity("bullet casings", 		"Uncommon");

PLUGIN.rarities:AddRarity("cutting knife", 			"Valuable");
PLUGIN.rarities:AddRarity("screw driver", 			"Uncommon");
PLUGIN.rarities:AddRarity("wrench", 				"Uncommon");

PLUGIN.rarities:AddRarity("bottle", 				"Common");
PLUGIN.rarities:AddRarity("box of bolts", 			"Uncommon");
PLUGIN.rarities:AddRarity("box of screws", 			"Uncommon");
PLUGIN.rarities:AddRarity("cables", 				"Common");
PLUGIN.rarities:AddRarity("car battery", 			"Uncommon");
PLUGIN.rarities:AddRarity("cloth", 					"Common");
PLUGIN.rarities:AddRarity("energy cell", 			"Valuable");
PLUGIN.rarities:AddRarity("newspaper", 				"Common");
PLUGIN.rarities:AddRarity("plastic", 				"Common");
PLUGIN.rarities:AddRarity("rock", 					"Common");
