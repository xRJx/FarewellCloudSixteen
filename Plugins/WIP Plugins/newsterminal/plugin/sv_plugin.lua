local PLUGIN = PLUGIN;

-- A function to load the Combine locks.
function PLUGIN:LoadNewsTerminals()
	local news = Clockwork.kernel:RestoreSchemaData( "plugins/news/"..game.GetMap() );
	
	for k, v in pairs(news) do
		local entity = ents.Create("cw_news_terminal");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetAngles(v.angles);
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if (IsValid(physicsObject)) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the Combine locks.
function PLUGIN:SaveNewsTerminals()
	local news = {};
	
	for k, v in pairs( ents.FindByClass("cw_news_terminal") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		news[#news + 1] = {
			angles = v:GetAngles(),
			moveable = moveable,
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/news/"..game.GetMap(), news);
end;