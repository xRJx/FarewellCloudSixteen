ITEM = openAura.item:New(); -- Creates the item.
ITEM.base = "clothes_base"; -- DO NOT TOUCH.
ITEM.name = ""; -- Name of the item.
ITEM.weight = ; -- Weight of the item.
ITEM.iconModel = ""; -- Same as ITEM.replacement.
ITEM.description = "."; -- Item Description.
ITEM.replacement = ""; -- Model code such as models/models/model.mdl
ITEM.pocketSpace = ; -- How much more KG you should get when wearing the suit.
ITEM.batch = 1; -- How many items it should give you(Mostly for shipments)
ITEM.cost = ; -- Cost of the item.
ITEM.access = ""; -- What flag you need to see it in the trade menu.
ITEM.business = true; -- Let's you be able to buy it.
ITEM.radProtect = ; -- Goes from 0.1 to 1.0.

openAura.item:Register(ITEM); -- Registers the item.