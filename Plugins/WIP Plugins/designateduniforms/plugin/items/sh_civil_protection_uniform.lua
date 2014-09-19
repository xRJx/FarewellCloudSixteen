local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Civil Protection Uniform";
ITEM.category = "Uniforms";
ITEM.weight = 4;
ITEM.business = false;
ITEM.protection = 0.2;
ITEM.description = "An unbranded civil protection uniform.";
ITEM.replacement = "models/dpfilms/metropolice/c08cop.mdl";

-- Basic info.
ITEM:AddData("description", "An unbranded civil protection uniform.", true);
ITEM:AddQueryProxy("description", "description");

-- Name change info.
ITEM:AddData("tagline", "NIL", true);
ITEM:AddQueryProxy("tagline", "tagline");
ITEM:AddData("id", "00", true);
ITEM:AddQueryProxy("id", "id");

-- Designation info.
ITEM:AddData("designated", false);
ITEM:AddQueryProxy("designated", "designated");

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local faction = player:GetFaction();
	
	if ((faction == FACTION_CITIZEN or faction == FACTON_MPF) and Clockwork.player:IsWhitelisted(player, FACTION_MPF)) then
		player:SetClothesData(self);
		return true;
	end;
	
	Clockwork.player:Notify(player, "The uniform doesn't fit.");
	return false;
end;

-- Called when a player changes clothes.
function ITEM:OnChangeClothes(player, bIsWearing)
	local charID = Clockwork.player:GetCharacterID(player);
	local pos = player:GetPos();
	local angs = player:GetAngles();
	local eyeAngs = player:EyeAngles();
	
	if (bIsWearing) then
		local uniform = player:FindItemByID("civil_protection_uniform");
		
		self:SaveLegacies(player, false);
		player:SetCharacterData("Faction", "Civil Protection", true); -- KEEP AN EYE ON DIS
		Clockwork.player:LoadCharacter(player, charID);
		self:RestoreLegacies(player);
		Clockwork.player:SetName(player, "c8:i4."..uniform:GetData("tagline").."-"..uniform:GetData("id"));
		player:SetCharacterData("Model", ITEM.replacement, true);
		self:RestorePosition(player,pos, angs, eyeAngs);
	else
		self:SaveLegacies(player, true);
		player:SetCharacterData("Faction", "Citizen", true);
		Clockwork.player:LoadCharacter(player, charID);
		self:LoadLegacies(player);
		self:RestorePosition(player, pos, angs, eyeAngs);
	end;
end;

function ITEM:SaveLegacies(player, reverted)
	if (!reverted) then
		legacy = {
			name = player:GetName(),
			model = player:GetModel(),
			description = player:GetSharedVar("PhysDesc")
		};
	else
		legacy = {
			name = player:GetCharacter("legacyname"),
			model = player:GetCharacter("legacymodel"),
			description = player:GetSharedVar("legacydescription")
		};
	end;
end;

function ITEM:LoadLegacies(player)
	local legacyname = player:GetCharacterData("legacyname");
	local lagacymodel = player:GetCharacterData("legacymodel");
	local lagacydescription = player:GetCharacterData("legacydescription");
	
	Clockwork.player:SetName(player, legacyname);
	
	player:SetCharacterData("Model", lagacymodel, true);
	player:SetModel(lagacymodel);
	player:SetCharacterData("PhysDesc", lagacydescription);
end;

function ITEM:RestoreLegacies(player)
	player:SetCharacterData("legacyname", legacy.name);
	player:SetCharacterData("legacymodel", legacy.model);
	player:SetCharacterData("legacymodel", legacy.description);
end;

function ITEM:RestorePosition(player, pos, angs, eyeAngs)
	player:Spawn();
	player:SetPos(pos);
	player:SetAngles(angs);
	player:SetEyeAngles(eyeAngs);
end;

ITEM:Register();