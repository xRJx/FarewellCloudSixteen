--How To Properly Change The Spawn Rate Interval--
--Item Spawner+ spawns an item every certain amount of time. After the item is spawned, it will randomly 
--select a new number for the amount of time required to pass until another item is spawned. This number
--is randomly selected from a range (for example, if the range is between 30-60, it will only randomly
--choose a number that is between 30 and 60). "ispIntervalStart" is the beginning of the range and
--"ispIntervalEnd" is the end of the range (see below). The range number is in seconds and by default,
--the start of the range is 1800 seconds (30 minutes) and 3600 seconds (60 minutes). If you wish to
--change the spawn rate interval, change 1800 to the start of the range and 3600 to the end of the
--range (see below).

--If you need further assistance, please contact support@exiguous-productions.com.

local PLUGIN = PLUGIN;

-- Called when the Clockwork shared variables are added.
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	globalVars:Number("ispIntervalStart");
	globalVars:Number("ispIntervalEnd");
end;

Clockwork.kernel:SetSharedVar("ispIntervalStart", 1800);
Clockwork.kernel:SetSharedVar("ispIntervalEnd", 3600);

-- Called after the schema has initialized.
function PLUGIN:ClockworkSchemaLoaded()
	for k, v in pairs(ispRarities) do
		local ITEM = Clockwork.item:FindByID(v.item);
		
		if (ITEM) then
			ITEM.value = v.rarity;
		else
			print("ItemSpawnerPlus: "..v.item.." is not a valid item!");
		end;
	end;
end;