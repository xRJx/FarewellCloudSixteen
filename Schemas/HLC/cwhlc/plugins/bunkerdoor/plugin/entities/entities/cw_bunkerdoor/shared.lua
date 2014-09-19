DEFINE_BASECLASS("base_gmodentity");

ENT.Type = "anim";
ENT.Author = "RJ";
ENT.PrintName = "Bunker Door";
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

-- Called when the datatables are setup.
function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "LinkedEnt");
	self:NetworkVar("String", 0, "LinkedFaction");
end;