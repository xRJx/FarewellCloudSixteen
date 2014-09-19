local PLUGIN = PLUGIN;

PLUGIN.requirements = Clockwork.kernel:NewLibrary("Requirements");

PLUGIN.requirements.overrode = {};

for k, v in pairs(Clockwork.item:GetAll()) do
	if (v.crafting == true and !v.isBaseItem and !v.overrideDesc or v.overrideDesc == false) then
		PLUGIN.requirements.overrode[#PLUGIN.requirements.overrode + 1] = v;
	end;
end;

function PLUGIN.requirements:SetupRequirements(items)
	for k, v in pairs(items) do
		local BLUEPRINT = Clockwork.item:FindByID(v("uniqueID"));
		local requirements = BLUEPRINT:HasMaterials();
		local requirement = "Requirements:\n";
		
		for k2, v2 in ipairs(requirements) do
			local amount = requirements[k2][2];
			
			requirement = requirement.."x"..amount.." "..requirements[k2][1].."\n";
		end;
		
		requirement = requirement.." ";
		requirement = string.gsub(requirement, "\n ", "");
		
		BLUEPRINT.description = requirement;
	end;
end;

PLUGIN.requirements:SetupRequirements(PLUGIN.requirements.overrode);