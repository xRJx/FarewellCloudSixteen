local PLUGIN = PLUGIN;

-- Called when the client initializes.
function PLUGIN:Initialize()
	CW_CONVAR_ITEMSPAWNESP = Clockwork.kernel:CreateClientConVar("cwItemSpawnESP", 0, false, true);
end;

-- Called when a PLUGIN ConVar has changed.
function PLUGIN:ClockworkConVarChanged()
	local mat = CreateMaterial("GARGAMEL!!!", "UnlitGeneric", {["$basetexture"] = "models/debug/debugwhite"})
	
	if (CW_CONVAR_ITEMSPAWNESP:GetInt() == 1) then
		hook.Add("PostDrawOpaqueRenderables", "itemSpawnESP", function()
			render.ClearStencil()
			render.SetStencilEnable(true)

			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
			render.SetStencilPassOperation(STENCILOPERATION_REPLACE) --If the pixel is visible, do nothing
			render.SetStencilFailOperation(STENCILOPERATION_REPLACE) --If the pixel fails the comparison, do nothing
			render.SetStencilZFailOperation(STENCILOPERATION_REPLACE) --If the pixel is behind something we replace it's value with th reference value (1)
			render.SetStencilReferenceValue(1)

			render.SetBlend(.5) --Blend = alpha, we want the model to be trnaslucent or the pixels will fail on the model itself, and we'll get random white areas we dont want

			for _, v in pairs( ents.FindByClass("cw_spawnmarker") ) do
				v:DrawModel() --Draw to stencil
			end

			render.SetBlend(1) --Full alpha again

			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL) --Only render the pixels who's value equals the reference value (1)
			render.SetMaterial(mat)
			render.DrawScreenQuad() --Draw a white rect covering the screen. This will only cover npcs that are behind something though, since we're using the stencilbuffer.

			render.SetStencilEnable(false)
		end)
	else
		hook.Remove("PostDrawOpaqueRenderables", "itemSpawnESP")
	end;
end;