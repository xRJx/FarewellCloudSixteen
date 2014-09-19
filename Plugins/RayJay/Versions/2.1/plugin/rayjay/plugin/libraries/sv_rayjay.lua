local PLUGIN = PLUGIN;

--CompileFile = Msg;
--local file = CompileFile("autorun/server/rayjay.lua");
--pcall(file);
--CompileFile = Msg;


--[[if (tostring(debug.getinfo(RunString).func) == "function: builtin#25" or tostring(debug.getinfo(RunString).func) == tostring(debug.getinfo(Msg).func) or debug.getupvalue(debug.getinfo(RunString).func, 1) != nil) then
	print("[RayJay] Security breach. Process terminated.");
	return;
else
	require("rayjay");
	PLUGIN.rayjay = Clockwork.kernel:NewLibrary("RayJay");
	
	function PLUGIN.rayjay:AddProduct(product, key)
		if (tostring(debug.getinfo(RunString).func) == "function: builtin#25" or tostring(debug.getinfo(RunString).func) == tostring(debug.getinfo(Msg).func) or debug.getupvalue(debug.getinfo(RunString).func, 1) != nil) then
			print("[RayJay] Security breach. Process terminated.");
			return;
		else
			RayJay.AddProduct(product, key, "2w8GR7gOIUeEGRHe23789");
		end;
	end;
end;]]--
require("rayjay");
PLUGIN.rayjay = Clockwork.kernel:NewLibrary("RayJay");
function PLUGIN.rayjay:AddProduct(product, key)
	RayJay.AddProduct(product, key, "AISDFid89a3nmjkBAF89");
end;

--PLUGIN.rayjay:AddProduct("Crafting", "jTpcnLfTJqsDvBJFaUT6xnpQ");
--PLUGIN.rayjay:AddProduct("ItemSpawnerPlus", "yuRQ8qVMMcxGYusgbn8Uyyqr");
--PLUGIN.rayjay:AddProduct("Thermals", "VSfBbMEYk3cD6pVgsgMdmfpG");
--PLUGIN.rayjay:AddProduct("Vortibeam", "w6yYHUZDazCS8TRDPabEgcju");