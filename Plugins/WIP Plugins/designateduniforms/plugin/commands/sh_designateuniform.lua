local COMMAND = Clockwork.command:New("DesignateUniform");

COMMAND.tip = "Assign a uniform its tagline and ID.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 2;

function COMMAND:OnRun(player, arguments)
	if (player:HasItemByID("designator")) then
		local uniform = player:FindItemByID("civil_protection_uniform");
		
		if (uniform:GetData("designated")) then
			Clockwork.player:Notify(player, "This uniform already has a designation!");
			player:GiveItem(Clockwork.item:CreateInstance("designator"));
			return;
		end;
		
		local tagline = arguments[1];
		local id = arguments[2];
		
		if (tagline == "" or id == "") then
			Clockwork.player:Notify(player, "You are missing data!");
			return;
		end;
		
		uniform:SetData("designated", true);
		uniform:SetData("description", "A civil protection uniform. Its designation is "..tagline.."-"..id);
		uniform:SetData("tagline", tagline);
		uniform:SetData("id", id);
		
		player:TakeItem(player:FindItemByID("designator"));
		Clockwork.player:Notify(player, "You have designated a uniform. It's designation is "..tagline.."-"..id..".");
	else
		Clockwork.player:Notify(player, "You need a designator to do this!");
	end;
end;

COMMAND:Register();