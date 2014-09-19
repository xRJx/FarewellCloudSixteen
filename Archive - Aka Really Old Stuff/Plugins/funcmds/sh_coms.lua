--[[
Name: "sh_coms.lua".
Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;


COMMAND = openAura.command:New();
COMMAND.tip = "Get your character up from the floor.";
COMMAND.text = "<string Name>";
COMMAND.access = "a";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (SERVER) then
		local target = openAura.player:Get( arguments[1] );

		if( target:GetNWInt( "faggot" ) == 1 ) then 
			target:SetNWInt( "faggot", 0 ); 
			target:SetColor( 255, 255, 255, 255 );
			return; end

			if( target:IsPlayer() ) then
				openAura.player:NotifyAll( "Attention. ".. target:Name() .. ", Is A MURDERER,GET HIM.");
				for k, v in ipairs( _player.GetAll() ) do

				v:ConCommand("play music/HL2_song25_Teleporter.mp3");
				timer.Simple(25, function() v:ConCommand("stopsounds") end)
			end
		target:SetNWInt( "faggot", 1 );
		target:SetColor( 255, 0, 228, 255 )
		end
	end	
end;

openAura.command:Register(COMMAND, "ws_lol_faggot");

COMMAND = openAura.command:New();
COMMAND.tip = "Start The Rave.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (SERVER) then
		AllNightLong = 1;
		
		for k, v in ipairs( _player.GetAll() ) do
			openAura.player:NotifyAll( "Time To Chill out and Relax after long Roleplay....");
			local function PlaySong()
			v:ConCommand("play /hgn/stalker/music/russianrapdisco.mp3");
		end

		timer.Simple(1, function() PlaySong() end )
		timer.Simple(249, function() PlaySong() end )
		v:SetNWInt( "rave", 1 )
		
		local function RaveColorBaby()

		v:SetColor( math.random(1,255), math.random(1,255), math.random(1,255), math.random(200,255) )

			if(AllNightLong == 1) then
				timer.Simple(0.2, function() RaveColorBaby() end )
			end
		end
		timer.Simple(0.2, function() RaveColorBaby() end )
		end
	end	
end;

openAura.command:Register(COMMAND, "ws_lol_rave");

COMMAND = openAura.command:New();
COMMAND.tip = "End The Rave.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
if (SERVER) then
	for k, v in ipairs( _player.GetAll() ) do

		v:SetNWInt( "rave", 0 )
		timer.Simple(2, function() v:SetColor( 255, 255, 255, 255 ) end);
		v:ConCommand( "stopsounds" );
		AllNightLong = 0;
		end
	end
end;

openAura.command:Register(COMMAND, "ws_lol_raveover");