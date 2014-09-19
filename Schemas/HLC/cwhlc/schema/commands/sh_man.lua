--[[local COMMAND = Clockwork.command:New("Man");

COMMAND.tip = "Gman.";
COMMAND.text = "";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	print("================");
	
	local pass = false;
	local rollCount = 0;
	
	while (pass == false) do
		local randomNum = math.random(0, 100);
		
		if (randomNum >= 99) then
			print("YOU DID EEEEEET!");
			pass = true;
		else
			rollCount = rollCount + 1;
			print("Looks like we rolled a "..randomNum.."! Increasing rollCount to "..rollCount);
		end;
	end;
	
	print("It only took "..rollCount.." tries...");
	print("================");
end;

COMMAND:Register();]]--