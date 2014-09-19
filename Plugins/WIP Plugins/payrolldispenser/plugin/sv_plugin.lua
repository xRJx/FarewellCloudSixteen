local PLUGIN = PLUGIN;

Clockwork.config:Add("payroll_interval", 302400);

-- A function to load the payroll dispensers.
function PLUGIN:LoadPayrollDispensers()
	local payrolls = Clockwork.kernel:RestoreSchemaData( "plugins/payrolls/"..game.GetMap() );
	
	for k, v in pairs(payrolls) do
		local entity = ents.Create("cw_payroll_dispenser");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetAngles(v.angles);
		end;
	end;
end;

-- A function to save the payroll dispensers.
function PLUGIN:SavePayrollDispensers()
	local payrolls = {};
	
	for k, v in pairs(ents.FindByClass("cw_payroll_dispenser")) do
		payrolls[#payrolls + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/payrolls/"..game.GetMap(), payrolls);
end;