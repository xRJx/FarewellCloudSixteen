-- Let's you ignite an object.
COMMAND = openAura.command:New();
COMMAND.tip = "Attempt to ignite a object"
COMMAND.text = ""
 
-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
 
	local ent = player:GetEyeTrace().Entity
	if ent:IsValid() and not ent:IsWorld() and not ent:IsPlayer() and not ent:IsNPC() and openAura.player:GetInventory(player)["ammo_smg1"]  then
	if player:GetPos():Distance(player:GetEyeTrace().HitPos) < 70 and ent:GetPhysicsObject():IsValid() and string.find(ent:GetPhysicsObject():GetMaterial(),"wood") then
 player:EmitSound("physics/metal/weapon_impact_soft1.wav")
 local t =  math.Max(100 - (openAura.schema:GetDexterityTime(player) * 3)  ,0)
 if math.random(1,5) == 2 then
 timer.Simple(2, function()
 ent:Ignite(t ,40)
 ent:EmitSound("ambient/fire/mtov_flame2.wav",70,100)
 end)
 end
 else
 	openAura.player:Notify(player, "The object you are trying to ignite is too far away");
 end
else
		openAura.player:Notify(player, "The object you are trying to ignite is not valid, or you do not have a lighter!");
			
end
 end;

openAura.command:Register(COMMAND, "Ignite");

-- Let's you toggle shoot-to-miss.
COMMAND = openAura.command:New();
COMMAND.tip = "Toggle shoot-to-miss";
COMMAND.text = "<Bool>";
-- Called when the command has been run.


function COMMAND:OnRun(player, arguments)

	if player.S2M then
		
		player.S2M = false
		openAura.player:Notify(player, "Turned shoot-to-miss on");
	else

		player.S2M = true
		openAura.player:Notify(player, "Turned shoot-to-miss off");
			end
	end;
	
openAura.command:Register(COMMAND, "ToggleS2M");

-- Half-Life 2 Only!

-- An Apply commands for citizens.
COMMAND = openAura.command:New();
COMMAND.tip = "Apply, simple as that.";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local citizenID = player:GetSharedVar("citizenID");
	local name = player:Name()
	local faction = player:QueryCharacter("faction");

	if ( faction == FACTION_CITIZEN or faction == FACTION_CWU or faction == FACTION_VORT ) then
		openAura:PlayerSay(player, name..", "..citizenID..".", public)

		if ( openAura.config:Get("recognise_system"):Get() ) then
			local talkRadius = openAura.config:Get("talk_radius"):Get();
			local position = player:GetPos();
				
			for k, v in ipairs( _player.GetAll() ) do
				if (v:HasInitialized() and player != v and !openAura.player:IsNoClipping(v) ) then
					local distance = v:GetPos():Distance(position);
					local recognise = false;
						
					if (distance <= talkRadius) then
						recognise = true;
					end;
						
					if (recognise) then
						openAura.player:SetRecognises(v, player, RECOGNISE_SAVE);
					end;
				end;
			end;
		end;
	else
		openAura.player:Notify(player, "You don't have a CID!");
	end;
end;

openAura.command:Register(COMMAND, "Apply");
-- End of Half-Life 2 only.


-- Let's an Admin set a players health.
COMMAND = openAura.command:New();
COMMAND.tip = "Set a players health.";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] );
	local amount = arguments[2];
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		openAura.player:NotifyAll(player:Name().." has set "..target:Name().."'s health to "..amount..".");
		
		target:SetHealth(amount);
	else
		openAura.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

openAura.command:Register(COMMAND, "PlySetHealth");

-- Let's you report a player.
COMMAND = openAura.command:New();
COMMAND.tip = "Report a player you don't like.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.optionalArguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity;
	if (target and target:IsPlayer()) then
		if (player != target) then
			local listeners = {};
			for _, v in pairs(_player.GetAll()) do
				if (openAura.player:IsAdmin(v) or v:IsSuperAdmin() or v:IsAdmin()) then
					table.insert(listeners, v);
				end;
			end;
			if (table.Count(listeners) > 0) then
				openAura.chatBox:Add(listeners, player, "report", target:Name());
			else
				openAura.player:Notify(player, "We're sorry - No admins are online to hear your cries!");
			end;
		else
			openAura.player:Notify(player, "You cannot report yourself!");
		end;
	else
		openAura.player:Notify(player, "You must be looking at a character!");
	end;
end;

openAura.command:Register(COMMAND, "PlyReport");

-- Let's an Admin reward a player cash for good roleplay or other.
COMMAND = openAura.command:New();
COMMAND.tip = "Reward a player with money.";
COMMAND.text = "<string Name> <amount>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = openAura.player:Get( arguments[1] )
	local cashName = openAura.option:GetKey("name_cash");
	local reward = arguments[2]

	if (target) then
		openAura.player:GiveCash(target, reward, "money from admin");
		openAura.player:Notify(target, "You have been given "..reward.." "..cashName.." by an admin!");
	else
		openAura.player:Notify(target, "Invalid player!");
	end;
end;

openAura.command:Register(COMMAND, "PlyReward");