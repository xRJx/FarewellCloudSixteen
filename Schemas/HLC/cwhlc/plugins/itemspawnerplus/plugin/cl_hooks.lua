local PLUGIN = PLUGIN;

-- Called when the client initializes.
function PLUGIN:Initialize()
	CW_CONVAR_ITEMSPAWNESP = Clockwork.kernel:CreateClientConVar("cwItemSpawnESP", 0, false, true);
end;

-- Called when a PLUGIN ConVar has changed.
function PLUGIN:ClockworkConVarChanged()
	local mat = CreateMaterial("GARGAMEL!!!", "UnlitGeneric", {["$basetexture"] = "models/debug/debugwhite"});
	
	if (CW_CONVAR_ITEMSPAWNESP:GetInt() == 1) then
		hook.Add("PostDrawOpaqueRenderables", "itemSpawnESP", function()
			render.ClearStencil();
			render.SetStencilEnable(true);

			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS);
			render.SetStencilPassOperation(STENCILOPERATION_REPLACE);
			render.SetStencilFailOperation(STENCILOPERATION_REPLACE);
			render.SetStencilZFailOperation(STENCILOPERATION_REPLACE);
			render.SetStencilReferenceValue(1);

			render.SetBlend(.5);

			for _, v in pairs( ents.FindByClass("cw_spawnmarker") ) do
				v:DrawModel();
			end

			render.SetBlend(1);

			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL);
			render.SetMaterial(mat);
			render.DrawScreenQuad();

			render.SetStencilEnable(false);
		end)
	else
		hook.Remove("PostDrawOpaqueRenderables", "itemSpawnESP");
	end;
end;