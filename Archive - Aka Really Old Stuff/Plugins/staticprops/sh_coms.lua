--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

COMMAND = openAura.command:New();
COMMAND.tip = "Add a static prop at your target position.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity;
	
	if ( IsValid(target) ) then
		--if ( openAura.entity:IsPhysicsEntity(target) ) then
		for k, v in pairs(PLUGIN.staticProps) do
			if (target == v) then
				openAura.player:Notify(player, "This prop is already static!");
				
				return;
			end;
		end;
		
		PLUGIN.staticProps[#PLUGIN.staticProps + 1] = target;
		PLUGIN:SaveStaticProps();
		
		openAura.player:Notify(player, "You have added a static prop.");
		--else
		--openAura.player:Notify(player, "This entity is not a physics entity!");
		--end;
	else
		openAura.player:Notify(player, "You must look at a valid entity!");
	end;
end;

openAura.command:Register(COMMAND, "StaticPropAdd");

COMMAND = openAura.command:New();
COMMAND.tip = "Remove static props at your target position.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity;
	
	if ( IsValid(target) ) then
		--if ( openAura.entity:IsPhysicsEntity(target) ) then
			for k, v in pairs(PLUGIN.staticProps) do
				if (target == v) then
					PLUGIN.staticProps[k] = nil;
					PLUGIN:SaveStaticProps();
					
					openAura.player:Notify(player, "You have removed a static prop.");
					
					return;
				end;
			end;
		--else
			--openAura.player:Notify(player, "This entity is not a physics entity!");
		--end;
	else
		openAura.player:Notify(player, "You must look at a valid entity!");
	end;
end;

openAura.command:Register(COMMAND, "StaticPropRemove");