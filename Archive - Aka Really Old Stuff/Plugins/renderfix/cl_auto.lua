--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN;

-- Called every post draw opauqe renderables
hook.Add("PostDrawOpaqueRenderables", "Render Fix", function()
	openAura.plugin:Call("PostDrawOpaqueRenderables", false, false)
	return true
end)