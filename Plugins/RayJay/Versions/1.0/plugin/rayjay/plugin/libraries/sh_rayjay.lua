local PLUGIN = PLUGIN;

-- BEGIN ENCRYPTED
if (SERVER) then require("rayjay"); end;

PLUGIN.rayjay = Clockwork.kernel:NewLibrary("RayJay");

function PLUGIN.rayjay:AddProduct(product, key)
	RayJay.AddProduct(product, key, "3w69nhawihrkjlfed");
end;
-- END ENCRYPTED

PLUGIN.rayjay:AddProduct("Crafting", "jTpcnLfTJqsDvBJFaUT6xnpQ");