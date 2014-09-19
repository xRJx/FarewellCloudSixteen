local FACTION = Clockwork.faction:New("Global Military Coalition");

FACTION.isCombineFaction = false;
FACTION.isHumanFaction = true;
FACTION.isVortigauntFaction = false;
FACTION.whitelist = true;
FACTION.useFullName = true;
FACTION.material = "hlc/factions/gmc";

FACTION.models = {
	female = {
		"models/betacz/group02/female_01.mdl",
		"models/betacz/group02/female_02.mdl",
		"models/betacz/group02/female_03.mdl",
		"models/betacz/group02/female_04.mdl",
		"models/betacz/group02/female_06.mdl",
		"models/betacz/group02/female_07.mdl"
	},
	male = {
		"models/betacz/group02/male_01.mdl",
		"models/betacz/group02/male_02.mdl",
		"models/betacz/group02/male_03.mdl",
		"models/betacz/group02/male_04.mdl",
		"models/betacz/group02/male_05.mdl",
		"models/betacz/group02/male_06.mdl",
		"models/betacz/group02/male_06.mdl",
		"models/betacz/group02/male_07.mdl",
		"models/betacz/group02/male_08.mdl",
		"models/betacz/group02/male_09.mdl"
	}
};

--[[ Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local unitID = math.random(1, 99999);
	
	return character.name.."-RCT";
end;]]--

-- A function to get the model name.
function FACTION:GetModelName(player, group)
	local modelName = nil;
	
	if (!player) then
		player = Clockwork.Client;
	end;
	
	if (group) then
		modelName = string.gsub(string.lower(Clockwork.player:GetDefaultModel(player)), "^.-/.-/", "");
	else
		modelName = string.gsub(string.lower(Clockwork.player:GetDefaultModel(player)), "^.-/.-/.-/", "");
	end;
	
	if (!string.find(modelName, "male") and !string.find(modelName, "female")) then
		if (group) then
			group = "group05/";
		else
			group = "";
		end;
		
		if (SERVER) then
			if (player:GetGender() == GENDER_FEMALE) then
				return group.."female_04.mdl";
			else
				return group.."male_05.mdl";
			end;
		elseif (player:GetGender() == GENDER_FEMALE) then
			return group.."female_04.mdl";
		else
			return group.."male_05.mdl";
		end;
	else
		return modelName;
	end;
end;

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction)
	local name = player:QueryCharacter("name");
	
	if (player:QueryCharacter("gender") == GENDER_MALE) then
		player:SetCharacterData("model", "models/betacz/group02/"..self:GetModelName(player), true);
	else
		player:SetCharacterData("model", "models/betacz/group02/"..self:GetModelName(player), true);
	end;
	
	Clockwork.player:SetName(player, "Pvt. "..name);
	
	player:GiveItem(Clockwork.item:CreateInstance("masked_uniform"));
end;

FACTION_GMC = FACTION:Register();