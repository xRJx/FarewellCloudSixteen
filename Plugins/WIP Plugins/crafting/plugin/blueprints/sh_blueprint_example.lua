/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Example"; -- The name of the blueprint.
ITEM.model = "directory/directory/model.mdl"; -- The model of the blueprint image.
ITEM.weight = 1; -- Used to "represent" the weight of the item to be crafted.
ITEM.category = "Example" -- The catagory the blueprint will belong to.
ITEM.crafting = true; -- Whether or not this item is used for crafting.
ITEM.description = "Requirements: \nx1 Brain \nx2 Hands"; -- Can be anything but it's a good idea to use this for the requirements. Use \n for a new line.

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	-- For each new item added, an 'and' must be followed at the end.
	
	-- To check for more than one item, use 'table.Count(#player:GetItemsByID("glass") >= 2)' 
	-- as seen in the example where the number 2 can be replaced with the amount of items you 
	-- want required to craft the item. Be sure to put the entire line for checking for the item
	-- in brackets.
	
	return (
		(player:HasItemByID("item_id1") and table.Count(player:GetItemsByID("item_id1")) >= 2) and
		player:HasItemByID("item_id2") and
		player:HasItemByID("item_id3")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	-- Not all items that are requirements need to be taken and you can take as much as the same
	-- item as you wish.
	
	return (
		player:TakeItem(player:FindItemByID("item_id1")) and
		player:TakeItem(player:FindItemByID("item_id1")) and
		player:TakeItem(player:FindItemByID("item_id2"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	-- You can give as many items as you want after the player has crafted. You can even give
	-- the same items twice if you want to give more than one of the same item.
	
	return (
		player:GiveItem(Clockwork.item:CreateInstance("item_id4")) and 
		player:GiveItem(Clockwork.item:CreateInstance("item_id4")) and
		player:GiveItem(Clockwork.item:CreateInstance("item_id5"))
	)
end;

ITEM:Register();
**/