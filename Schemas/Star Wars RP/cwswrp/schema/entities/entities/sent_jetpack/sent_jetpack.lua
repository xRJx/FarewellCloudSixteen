AddCSLuaFile();

ENT.Type = "anim";
ENT.PrintName = "Jetpack";
ENT.Author = "Chessnut";
ENT.Information = "A jetpack that allows you to fly.";
ENT.Category = "Transportation";
ENT.AdminSpawnable = false;
ENT.Spawnable = false;

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Thrust");
	self:NetworkVar("Int", 1, "DamageAmount");
end;

function ENT:SpawnFunction(client, trace)
	if (!trace.Hit) then
		return;
	end;

	if ( (client.nextJetPack or 0) < CurTime() ) then
		if ( IsValid(client.jetpack) ) then
			client.jetpack:Remove();
		end;

		local entity = ents.Create(self.ClassName);
		entity:SetPos( client:LocalToWorld( client:OBBCenter() ) );
		entity:SetOwner(client);
		entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
		entity:Spawn();
		entity:Activate();

		client.jetpack = entity;
		client.nextJetPack = CurTime() + 60;
		return entity;
	else
		client:ChatPrint("You cannot get another jetpack yet!");
	end;
end;

if (SERVER) then
	function ENT:OnTakeDamage(damageInfo)
		local damage = damageInfo:GetDamage() / 4;

		self:SetDamageAmount( math.Clamp(self:GetDamageAmount() + damage, 0, 100) );
		self:SetThrust( math.Clamp(self:GetThrust() - 25, 0, 100) );
	end;		
end;

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/props_c17/trappropeller_engine.mdl");
		self:SetSolid(SOLID_VPHYSICS);
		self:SetMoveType(MOVETYPE_VPHYSICS);
		self:PhysicsInit(SOLID_VPHYSICS);
		self:SetUseType(SIMPLE_USE);
		self:SetThrust(0);
		self:SetDamageAmount(0);

		local physicsObject = self:GetPhysicsObject();

		if ( IsValid(physicsObject) ) then
			physicsObject:Wake();
			physicsObject:EnableMotion(true);
		end;
	end;
end;

function ENT:Think()
	local owner = self:GetOwner();

	if ( !IsValid(owner) ) then
		self:Remove();

		return;
	end;

	local bone = owner:LookupBone("ValveBiped.Bip01_Spine2");

	if (bone) then
		local position, angles = owner:GetBonePosition(bone);

		angles:RotateAroundAxis(angles:Forward(), 90);
		angles:RotateAroundAxis(angles:Right(), 270);
		angles:RotateAroundAxis(angles:Up(), 0);

		self:SetPos( position + (angles:Up() * -2) + (angles:Forward() * -8) );
		self:SetModelScale(0.7, 0);
		self:SetAngles(angles);

		if (CLIENT) then
			if ( (self.nextPart or 0) < CurTime() ) then
				local emitter = ParticleEmitter( self:GetPos() );

				for i = 1, 2 do
					local particle = emitter:Add( "particles/flamelet"..math.random(1, 5), position + (angles:Forward() * -8) );
					particle:SetColor(255, 255, 255, 255);
					particle:SetVelocity( Vector( math.Rand(-20, 20), math.Rand(-1, 1), -(self:GetThrust() * 2.56) ) );
					particle:SetDieTime(0.5  * (self:GetThrust() / 100) );
					particle:SetLifeTime( 0.25 * (self:GetThrust() / 100) );
					particle:SetStartSize(7);
					particle:SetEndSize(2);
				end;

				for i = 1, 5 do
					local particle = emitter:Add( "particle/smokestack", position + (angles:Forward() * -13.1) + (angles:Right() * 7.5) + (angles:Up() * 4) );
					particle:SetColor(255, 255, 255, 255);
					particle:SetVelocity( Vector(12 + math.Rand(5, 10), 2, 25  * (self:GetThrust() / 100) + 10) );
					particle:SetDieTime(1.25);
					particle:SetLifeTime(1);
					particle:SetStartSize(0.3);
					particle:SetEndSize(1);
				end;

				emitter:Finish();

				self.nextPart = CurTime() + 0.05;
			end;
		end;
	end;

	if (SERVER) then
		if ( IsValid(owner) and owner:IsPlayer() ) then
			if (owner:KeyDown(IN_JUMP) and self:WaterLevel() == 0) then
				self:SetThrust( math.Clamp(self:GetThrust() + 12, 0, 100) - self:GetDamageAmount() );

				owner:SetVelocity( owner:GetAimVector() * ( (self:GetThrust() / 100) * 24 ) + Vector(0, 0, self:GetThrust() * 1.125) );

				if (self:GetThrust() == 20) then
					self:EmitSound("ambient/fire/ignite.wav");
				end;
			else
				if ( (self:GetThrust() - 2.5) == 7.5 ) then
					self:EmitSound("ambient/fire/mtov_flame2.wav");
				end;

				self:SetThrust( math.Clamp(self:GetThrust() - 2.5, 0, 100) - self:GetDamageAmount() );
			end;
		end;
	else
		local amount = self:GetThrust() / 100;

		if (!self.sound) then
			self.sound = CreateSound(self, "ambient/gas/cannister_loop.wav");
		end;

		if (!self.bgNoise) then
			self.bgNoise = CreateSound(self, "vehicles/diesel_loop2.wav");
		end;

		if ( !self.bgNoise:IsPlaying() ) then
			self.bgNoise:Play();
			self.bgNoise:ChangeVolume(0.9, 0);
		end;

		if (!self.sound:IsPlaying() and amount > 0) then
			self.sound:Play();
		end;

		self.sound:ChangeVolume(amount * 1.5, 0);
		self.sound:ChangePitch(100 + (50 * amount), 0);

		self.bgNoise:ChangePitch(100 + amount, 0);

		local owner = self:GetOwner();

		local data = {};
		data.start = self:GetPos();
		data.endpos = self:GetPos() - Vector(0, 0, 480);
		data.filter = self;

		if ( IsValid(owner) ) then
			data.filter = {owner, self};
		end;

		local trace = util.TraceLine(data);

		if (trace.HitWorld or trace.HitNonWorld) then
			if ( (self.nextFloorPart or 0) < CurTime() ) then
				local emitter = ParticleEmitter( self:GetPos() );

				for i = 1, 20 do
					local range = 256 * amount;

					local particle = emitter:Add("particle/smokestack", trace.HitPos + (trace.HitNormal * -2) );
					particle:SetColor(200, 200, 200);
					particle:SetStartAlpha(0);
					particle:SetEndAlpha(50);
					particle:SetGravity( Vector(math.random(-range, range), math.random(-range, range), 48) );
					particle:SetDieTime(1.25 * amount);
					particle:SetLifeTime(0.5 * amount);
					particle:SetStartSize(0);
					particle:SetEndSize(8);
				end;

				emitter:Finish();

				self.nextFloorPart = CurTime() + 0.1;
			end;
		end;

		if (self:GetDamageAmount() > 0) then
			if (!self.nextDmgPart) then
				self.nextDmgPart = 0;
			end;

			if ( self.nextDmgPart < CurTime() ) then
				local position = self:GetPos();
				local emitter = ParticleEmitter(position);

				for i = 1, math.floor( 20 * (self:GetDamageAmount() / 100) ) do
					local grey = math.random(50, 150);
					local particle = emitter:Add("particle/smokestack", position);
					particle:SetColor(grey, grey, grey, 255);
					particle:SetVelocity( Vector( math.random(-50, 50), math.random(-50, 50), math.random(-100, 100) ) );
					particle:SetDieTime(1);
					particle:SetLifeTime(0.5);
					particle:SetStartSize( math.Rand(10, 15) );
					particle:SetEndSize(0);
				end;

				emitter:Finish();

				self.nextDmgPart = CurTime() + ( ( 115 - self:GetDamageAmount() ) / 100 );
			end;
		end;
	end;
end;

if (CLIENT) then
	function ENT:Draw()
		local owner = self:GetOwner();

		if ( IsValid(self) and IsValid(owner) ) then
			if ( owner == LocalPlayer() ) then
				local position, angles = owner:GetPos(), EyeAngles();

				angles:RotateAroundAxis(angles:Right(), 90);
				angles:RotateAroundAxis(angles:Up(), 89);

				position = position + (angles:Up() * -50) + (angles:Forward() * 10) + (angles:Right() * 75);
			end;

			if ( owner != LocalPlayer() or !LocalPlayer():Alive() or LocalPlayer():ShouldDrawLocalPlayer() ) then
				self:DrawModel();
			end;
		end;
	end;

	function ENT:OnRemove()
		self.sound:Stop();
		self.sound = nil;

		self.bgNoise:Stop();
		self.bgNoise = nil;
	end;
end;