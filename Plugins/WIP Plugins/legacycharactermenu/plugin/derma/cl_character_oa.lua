--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	if ( !openAura.theme:Call("PreCharacterMenuInit", self) ) then
		local smallTextFont = openAura.option:GetFont("menu_text_small");
		local tinyTextFont = openAura.option:GetFont("menu_text_tiny");
		local hugeTextFont = openAura.option:GetFont("menu_text_huge");
		local scrH = ScrH();
		local scrW = ScrW();
		
		self:SetPos(0, 0);
		self:SetSize(scrW, scrH);
		self:SetDrawOnTop(false);
		self:SetPaintBackground(false);
		self:SetMouseInputEnabled(true);
		self:SetKeyboardInputEnabled(true);
		
		self.titleLabel = vgui.Create("aura_LabelButton", self);
		self.titleLabel:SetDisabled(true);
		self.titleLabel:SetFont(hugeTextFont);
		self.titleLabel:SetText( string.upper( openAura.schema:GetName() ) );
		self.titleLabel:SetAlpha(0);
		self.titleLabel:FadeIn(0.5);
		
		self.titleLabel:SetVisible(false);
		self.titleLabel:SetSize(512, 64);
		self.titleLabel:SetPos( (scrW / 2) - (self.titleLabel:GetWide() / 2), scrH * 0.06 );
		
		local schemaLogo = openAura.option:GetKey("schema_logo");
		
		self.subLabel = vgui.Create("aura_LabelButton", self);
		self.subLabel:SetDisabled(true);
		self.subLabel:SetFont(smallTextFont);
		self.subLabel:SetText( string.upper( openAura.schema:GetDescription() ) );
		self.subLabel:SetAlpha(0);
		self.subLabel:FadeIn(0.5);
		self.subLabel:SizeToContents();
		
		if (schemaLogo != "") then
			self.subLabel:SetPos(self.titleLabel.x + (self.titleLabel:GetWide() / 2) - (self.subLabel:GetWide() / 2), self.titleLabel.y + self.titleLabel:GetTall() + 8);
		else
			self.subLabel:SetPos( (scrW / 2) - (self.subLabel:GetWide() / 2), scrH * 0.06 );
		end;
		
		self.authorLabel = vgui.Create("aura_LabelButton", self);
		self.authorLabel:SetDisabled(true);
		self.authorLabel:SetFont(tinyTextFont);
		self.authorLabel:SetText( "DEVELOPED BY "..string.upper( openAura.schema:GetAuthor() ) );
		self.authorLabel:SetAlpha(0);
		self.authorLabel:FadeIn(0.5);
		self.authorLabel:SizeToContents();
		self.authorLabel:SetPos(self.subLabel.x + ( self.subLabel:GetWide() - self.authorLabel:GetWide() ), self.subLabel.y + self.subLabel:GetTall() + 4);
		
		self.createButton = vgui.Create("aura_LabelButton", self);
		self.createButton:SetFont(smallTextFont);
		self.createButton:SetText("NEW");
		self.createButton:SetAlpha(0);
		self.createButton:FadeIn(0.5);
		self.createButton:SetCallback(function(panel)
			if ( table.Count( openAura.character:GetAll() ) >= openAura.player:GetMaximumCharacters() ) then
				openAura.character:SetFault("You cannot create any more characters!");
			else
				self:OpenPanel("aura_CharacterStageOne");
			end;
		end);
		self.createButton:SizeToContents();
		self.createButton:SetMouseInputEnabled(true);
		self.createButton:SetPos(scrW * 0.25, scrH * 0.9);
		
		self.loadButton = vgui.Create("aura_LabelButton", self);
		self.loadButton:SetFont(smallTextFont);
		self.loadButton:SetText("LOAD");
		self.loadButton:SetAlpha(0);
		self.loadButton:FadeIn(0.5);
		self.loadButton:SetCallback(function(panel)
			self:OpenPanel("aura_CharacterList", nil, function(panel)
				openAura.character:RefreshPanelList();
			end);
		end);
		self.loadButton:SizeToContents();
		self.loadButton:SetMouseInputEnabled(true);
		self.loadButton:SetPos(scrW * 0.75, scrH * 0.9);
		
		self.disconnectButton = vgui.Create("aura_LabelButton", self);
		self.disconnectButton:SetFont(smallTextFont);
		self.disconnectButton:SetText("LEAVE");
		self.disconnectButton:SetAlpha(0);
		self.disconnectButton:FadeIn(0.5);
		self.disconnectButton:SetCallback(function(panel)
			if ( openAura.Client:HasInitialized() and !openAura.character:IsMenuReset() ) then
				openAura.character:SetPanelOpen(false);
			else
				RunConsoleCommand("disconnect");
			end;
		end);
		self.disconnectButton:SizeToContents();
		self.disconnectButton:SetPos( (scrW / 2) - (self.disconnectButton:GetWide() / 2), scrH * 0.9 );
		self.disconnectButton:SetMouseInputEnabled(true);
		
		self.characterModel = vgui.Create("aura_CharacterModel", self);
		self.characterModel:SetAlpha(0);
		self.characterModel:SetModel("models/error.mdl");
		
		self.createTime = SysTime();
		
		openAura.theme:Call("PostCharacterMenuInit", self)
	end;
end;

-- A function to fade in the model panel.
function PANEL:FadeInModelPanel(model)
	local panel = openAura.character:GetActivePanel();
	local x, y = ScrW() - self.characterModel:GetWide() - 8, 16;
	
	if (panel) then
		x, y = panel.x + panel:GetWide() - 16, panel.y - 80;
	end;
	
	self.characterModel:SetPos(x, y);
	
	if ( self.characterModel:FadeIn(0.5) ) then
		self:SetModelPanelModel(model);
		
		return true;
	else
		return false;
	end;
end;

-- A function to fade out the model panel.
function PANEL:FadeOutModelPanel()
	self.characterModel:FadeOut(0.5);
end;

-- A function to set the model panel's model.
function PANEL:SetModelPanelModel(model)
	if (self.characterModel.currentModel != model) then
		self.characterModel.currentModel = model;
		self.characterModel:SetModel(model);
	end;
end;

-- A function to return to the main menu.
function PANEL:ReturnToMainMenu()
	local panel = openAura.character:GetActivePanel();
	
	if (panel) then
		panel:FadeOut(0.5, function()
			openAura.character.activePanel = nil;
			panel:Remove();
		end);
	end;
	
	self:FadeOutModelPanel();
end;

-- A function to open a panel.
function PANEL:OpenPanel(vguiName, childData, Callback)
	if ( !openAura.theme:Call("PreCharacterMenuOpenPanel", self, vguiName, childData, Callback) ) then
		local panel = openAura.character:GetActivePanel();
		
		if (panel) then
			panel:FadeOut(0.5, function()
				panel:Remove(); self.childData = childData;
				
				openAura.character.activePanel = vgui.Create(vguiName, self);
				openAura.character.activePanel:SetAlpha(0);
				openAura.character.activePanel:FadeIn(0.5);
				openAura.character.activePanel:MakePopup();
				openAura.character.activePanel:SetPos( ScrW() * 0.2, ScrH() * 0.2 );
				
				if (Callback) then
					Callback(openAura.character.activePanel);
				end;
			end);
		else
			self.childData = childData;
			
			openAura.character.activePanel = vgui.Create(vguiName, self);
			openAura.character.activePanel:SetAlpha(0);
			openAura.character.activePanel:FadeIn(0.5);
			openAura.character.activePanel:MakePopup();
			openAura.character.activePanel:SetPos( ScrW() * 0.2, ScrH() * 0.25 );
			
			if (Callback) then
				Callback(openAura.character.activePanel);
			end;
		end;
		
		openAura.theme:Call("PostCharacterMenuOpenPanel", self);
		
		self:FadeOutModelPanel();
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint()
	if ( !openAura.theme:Call("PreCharacterMenuPaint", self) ) then
		local schemaLogo = openAura.option:GetKey("schema_logo");
		
		if (schemaLogo != "") then
			if (!self.logoTextureID) then
				self.logoTextureID = surface.GetTextureID(schemaLogo);
			end;
			
			surface.SetDrawColor( 255, 255, 255, self:GetAlpha() );
			surface.SetTexture(self.logoTextureID);
			surface.DrawTexturedRect(self.titleLabel.x, self.titleLabel.y, 512, 64);
		end;
		
		openAura.theme:Call("PostCharacterMenuPaint", self)
	end;
	
	return true;
end;

-- Called each frame.
function PANEL:Think()
	if ( !openAura.theme:Call("PreCharacterMenuThink", self) ) then
		local characters = table.Count( openAura.character:GetAll() );
		local loading = openAura.character:IsPanelLoading();
		local fault = openAura.character:GetFault();
		
		if ( openAura.plugin:Call("ShouldDrawCharacterBackgroundBlur") ) then
			openAura:RegisterBackgroundBlur(self, self.createTime, 0.5);
		else
			openAura:RemoveBackgroundBlur(self);
		end;
		
		if (self.characterModel) then
			if (!self.characterModel.currentModel
			or self.characterModel.currentModel == "models/error.mdl") then
				self.characterModel:SetAlpha(0);
			end;
		end;
		
		if (characters == 0 or loading) then
			self.loadButton:SetDisabled(true);
		else
			self.loadButton:SetDisabled(false);
		end;
		
		if ( characters >= openAura.player:GetMaximumCharacters()
		or openAura.character:IsPanelLoading() ) then
			self.createButton:SetDisabled(true);
		else
			self.createButton:SetDisabled(false);
		end;
		
		if ( openAura.Client:HasInitialized() and !openAura.character:IsMenuReset() ) then
			self.disconnectButton:SetText("CANCEL");
			self.disconnectButton:SizeToContents();
		else
			self.disconnectButton:SetText("LEAVE");
			self.disconnectButton:SizeToContents();
		end;
		
		if (self.animation) then
			self.animation:Run();
		end;
		
		self:SetSize( ScrW(), ScrH() );
		
		openAura.theme:Call("PostCharacterMenuThink", self)
	end;
end;

vgui.Register("aura_CharacterMenu", PANEL, "DPanel");

hook.Add("VGUIMousePressed", "openAura.character:VGUIMousePressed", function(panel, code)
	local characterPanel = openAura.character:GetPanel();
	local activePanel = openAura.character:GetActivePanel();
	
	if (openAura.character:IsPanelOpen() and activePanel and characterPanel == panel) then
		characterPanel:ReturnToMainMenu();
	end;
end);

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self.characterForms = {};
	self.isCharacterList = true;
	
	self:SetTitle("");
	self:SetSizable(false);
	self:SetDraggable(false);
	self:ShowCloseButton(false);
	
	self.panelList = vgui.Create("DPanelList", self);
 	self.panelList:SetPadding(2);
 	self.panelList:SetSpacing(3);
 	self.panelList:SizeToContents();
 	self.panelList:SetDrawBackground(false);
	self.panelList:EnableVerticalScrollbar();
end;

-- Called when the panel is painted.
function PANEL:Paint() end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if ( self:GetAlpha() > 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha( 255 - (delta * 255) );
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("rollover");
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if ( self:GetAlpha() == 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- YOU ARE HERE

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
	
	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(0, 0, 0, 0);
	self:SetSize( math.min(openAura.character:GetListWidth(), ScrW() - 32), math.min(self.panelList.pnlCanvas:GetTall() + 8, ScrH() * 0.6) );
end;

vgui.Register("aura_CharacterList", PANEL, "DFrame");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local customData = self:GetParent().customData;
	local colorWhite = openAura.option:GetColor("white");
	local buttons = {};
	local buttonX = 76;
	
	for k, v in pairs(customData) do
		self[k] = v;
	end;
	
	self:SetSize(self:GetParent():GetWide(), 48);
	self.buttonPanels = {};
	
	self.nameLabel = vgui.Create("DLabel", self);
	self.nameLabel:SetTextColor(colorWhite);
	self.nameLabel:SetText("N/A");
	self.nameLabel:SetPos(52, 2);
	
	self.detailsLabel = vgui.Create("DLabel", self);
	self.detailsLabel:SetTextColor(colorWhite);
	self.detailsLabel:SetText("N/A");
	self.detailsLabel:SetPos(52, 2);
	
	self.spawnIcon = vgui.Create("SpawnIcon", self);
	self.spawnIcon:SetModel("");
	self.spawnIcon:SetIconSize(48);
	
	self.useButton = vgui.Create("DImageButton", self);
	self.useButton:SetToolTip("Use this character.");
	self.useButton:SetImage("gui/silkicons/check_on");
	self.useButton:SetSize(16, 16);
	self.useButton:SetPos(52, 30);
	
	self.deleteButton = vgui.Create("DImageButton", self);
	self.deleteButton:SetToolTip("Delete this character.");
	self.deleteButton:SetImage("gui/silkicons/check_off");
	self.deleteButton:SetSize(16, 16);
	self.deleteButton:SetPos(76, 30);
	
	openAura.plugin:Call("GetCustomCharacterButtons", self.characterTable, buttons);
	
	for k, v in pairs(buttons) do
		local button = vgui.Create("DImageButton", self);
			buttonX = buttonX + 20;
			button:SetToolTip(v.toolTip);
			button:SetImage(v.image);
			button:SetSize(16, 16);
			button:SetPos(buttonX, 30);
		table.insert(self.buttonPanels, button);
		
		-- Called when the button is clicked.
		function button.DoClick(button)
			local function Callback()
				openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = k} );
			end;
			
			if (!v.OnClick or v.OnClick(Callback) != false) then
				Callback();
			end;
		end;
	end;
	
	-- Called when the button is clicked.
	function self.useButton.DoClick(spawnIcon)
		openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = "use"} );
	end;
	
	-- Called when the button is clicked.
	function self.deleteButton.DoClick(spawnIcon)
		openAura:AddMenuFromData( nil, {
			["Yes"] = function()
				openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = "delete"} );
			end,
			["No"] = function() end
		} );
	end;
	
	-- Called when the spawn icon is clicked.
	function self.spawnIcon.DoClick(spawnIcon)
		local options = {};
		local panel = openAura.character:GetPanel();
		
		options["Use"] = function()
			openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = "use"} );
		end;
		
		options["Delete"] = {};
		options["Delete"]["No"] = function() end;
		options["Delete"]["Yes"] = function()
			openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = "delete"} );
		end;
		
		openAura.plugin:Call("GetCustomCharacterOptions", self.characterTable, options, menu);
		
		openAura:AddMenuFromData(nil, options, function(menu, key, value)
			menu:AddOption(key, function()
				openAura:StartDataStream( "InteractCharacter", {characterID = self.characterID, action = value} );
			end);
		end);
	end;
end;

-- Called each frame.
function PANEL:Think()
	self.spawnIcon:SetModel(self.model);
	self.spawnIcon:SetToolTip( openAura.plugin:Call("GetCharacterPanelToolTip", self, self.faction, self.characterTable) );
	
	self.nameLabel:SetText(self.name);
	self.nameLabel:SizeToContents();
	
	self.detailsLabel:SetText(self.details or "This character has no details to display.");
	self.detailsLabel:SizeToContents();
	self.detailsLabel:SetPos( 52, self.nameLabel.y + self.nameLabel:GetTall() );
	
	openAura.character:SetListWidth(self.nameLabel:GetWide() + 76);
	openAura.character:SetListWidth( (#self.buttonPanels * 20) + 76 );
	openAura.character:SetListWidth(self.detailsLabel:GetWide() + 76);
end;
	
vgui.Register("aura_CharacterPanel", PANEL, "DPanel");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local panel = openAura.character:GetActivePanel();
	local size = ScrH() * 0.5;
	
	self:SetSize(size, size);
	self:SetPaintBackground(false);
	
	self.modelPanel = vgui.Create("DModelPanel", self);
	self.modelPanel:SetPos(4, 4);
	self.modelPanel:SetSize(size, size);
	self.modelPanel:SetCamPos( Vector(122, -40, 50) );
	self.modelPanel:SetLookAt( Vector(0, 0, 40) );
	self.modelPanel:SetAmbientLight( Color(255, 255, 255, 255) );
	
	-- Called when the entity should be laid out.
	function self.modelPanel.LayoutEntity(modelPanel, entity)
		modelPanel:RunAnimation();
	end;
end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if ( self:GetAlpha() > 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha( 255 - (delta * 255) );
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("rollover");
		
		return true;
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if ( self:GetAlpha() == 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("click_release");
		self:SetVisible(true);
		
		return true;
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to set the alpha of the panel.
function PANEL:SetAlpha(alpha)
	self.modelPanel:SetColor( Color(255, 255, 255, alpha) );
end;

-- A function to get the alpha of the panel.
function PANEL:GetAlpha(alpha)
	return self.modelPanel:GetColor().a;
end;

-- Called each frame.
function PANEL:Think()
	local entity = self.modelPanel.Entity;
	
	if ( IsValid(entity) ) then
		entity:SetPos( Vector(0, 0, 0) );
	end;
	
	if (self.animation) then
		self.animation:Run();
	end;
	
	self:InvalidateLayout(true);
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	local size = ScrH() * 0.5;
	
	self:SetSize(size, size);
	self.modelPanel:SetSize(size, size);
end;

-- A function to set the model.
function PANEL:SetModel(model)
	self.modelPanel:SetModel(model);
	
	if ( IsValid(self.modelPanel.Entity) ) then
		local sequence = self.modelPanel.Entity:LookupSequence("idle");
		local menuSequence = openAura.animation:GetMenuSequence(model, true);
		
		local leanBackAnims = {"LineIdle01", "LineIdle02", "LineIdle03", "PlazaIdle1", "PlazaIdle4"};
		local leanBackAnim = self.modelPanel.Entity:LookupSequence( leanBackAnims[ math.random(1, #leanBackAnims) ] );
		
		if (leanBackAnim > 0) then
			sequence = leanBackAnim;
		end;
		
		if (menuSequence) then
			menuSequence = self.modelPanel.Entity:LookupSequence(menuSequence);
			
			if (menuSequence > 0) then
				sequence = menuSequence;
			end;
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("idle_unarmed");
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("idle1");
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("walk_all");
		end;
		
		self.modelPanel.Entity:ResetSequence(sequence);
	end;
end;
	
vgui.Register("aura_CharacterModel", PANEL, "DPanel");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local maximumPoints = openAura.config:Get("default_attribute_points"):Get();
	local smallTextFont = openAura.option:GetFont("menu_text_small");
	local factionTable = nil;
	local sliderPanels = {};
	local attributes = {};
	local parent = self:GetParent();
	
	if (parent) then
		self.info = parent.childData;
		
		if (self.info) then
			factionTable = openAura.faction:Get(self.info.faction);
		end;
	end;
	
	self:ShowCloseButton(false);
	self.lblTitle:SetVisible(false);
	
	self:SetDraggable(false);
	
	if (factionTable.attributePointsScale) then
		maximumPoints = math.Round(maximumPoints * factionTable.attributePointsScale);
	end;
	
	if (factionTable.maximumAttributePoints) then
		maximumPoints = factionTable.maximumAttributePoints;
	end;
	
	self.attributesForm = vgui.Create("DForm");
	self.attributesForm:SetName( openAura.option:GetKey("name_attributes") );
	self.attributesForm:SetPadding(4);
	
	self.panelList = vgui.Create("DPanelList", self);
 	self.panelList:SetPadding(2);
 	self.panelList:SetSpacing(3);
 	self.panelList:SizeToContents();
 	self.panelList:SetDrawBackground(false);
	self.panelList:EnableVerticalScrollbar();
	
	self.continueButton = vgui.Create("aura_LabelButton", self);
	self.continueButton:SetText("CONTINUE");
	self.continueButton:SetFont(smallTextFont);
	self.continueButton:SizeToContents();
	self.continueButton:SetMouseInputEnabled(true);
	
	-- Called when the button is clicked.
	function self.continueButton.DoClick(button)
		self.info.attributes = {};
		
		for k, v in ipairs(sliderPanels) do
			local attributeTable = v.attributeTable;
			
			if (attributeTable) then
				self.info.attributes[attributeTable.uniqueID] = v:GetValue();
			end;
		end;
		
		openAura:StartDataStream("CreateCharacter", self.info);
	end;
	
	for k, v in pairs( openAura.attribute:GetAll() ) do
		attributes[#attributes + 1] = v;
	end;
	
	table.sort(attributes, function(a, b)
		return a.name < b.name;
	end);
	
	for k, v in pairs(attributes) do
		if (v.characterScreen) then
			local numSlider = self.attributesForm:NumSlider(v.name, nil, 0, math.min(v.maximum, maximumPoints), 0);
			local index = #sliderPanels + 1;
			
			-- Called when the number wang value has changed.
			numSlider.OnValueChanged = function(numSlider, value)
				local pointsUsed = value;
				
				for k2, v2 in ipairs(sliderPanels) do
					if (v2 != numSlider) then
						pointsUsed = pointsUsed + v2:GetValue();
					end;
				end;
				
				for k2, v2 in ipairs(sliderPanels) do
					if (v2 != numSlider) then
						v2:SetMax( math.Clamp(maximumPoints - pointsUsed, 0, maximumPoints) );
					end;
				end;
			end;
			
			sliderPanels[index] = numSlider;
			sliderPanels[index]:SetToolTip(v.description);
			sliderPanels[index].attributeTable = v;
		end;
	end;
	
	self.panelList:AddItem(self.attributesForm);
	self.panelList:AddItem(self.continueButton);
end;

-- Called when the panel is painted.
function PANEL:Paint() end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if ( self:GetAlpha() > 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha( 255 - (delta * 255) );
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("rollover");
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if ( self:GetAlpha() == 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
	
	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(0, 0, 0, 0);
	self:SetSize( 512, math.min(self.panelList.pnlCanvas:GetTall() + 8, ScrH() * 0.6) );
end;

vgui.Register("aura_CharacterStageThree", PANEL, "DFrame");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = openAura.option:GetFont("menu_text_small");
	local overrideModel = nil;
	local selectModel = nil;
	local physDesc = (openAura.command:Get("CharPhysDesc") != nil);
	local parent = self:GetParent();
	local panel = openAura.character:GetPanel();
	
	self:ShowCloseButton(false);
	self.lblTitle:SetVisible(false);
	
	self:SetDraggable(false);
	
	self.panelList = vgui.Create("DPanelList", self);
 	self.panelList:SetPadding(2);
 	self.panelList:SetSpacing(3);
 	self.panelList:SizeToContents();
 	self.panelList:SetDrawBackground(false);
	self.panelList:EnableVerticalScrollbar();
	
	self.faction = parent.childData.faction;
	
	if (!openAura.faction.stored[self.faction].GetModel) then
		selectModel = true;
	end;
	
	local models = openAura.faction.stored[self.faction].models[ string.lower(parent.childData.gender) ];
	
	if (models and #models == 1) then
		selectModel = false;
		overrideModel = models[1];
		
		if ( !panel:FadeInModelPanel(overrideModel) ) then
			panel:SetModelPanelModel(overrideModel);
		end;
	end;
	
	if (!openAura.faction.stored[self.faction].GetName) then
		self.nameForm = vgui.Create("DForm");
		self.nameForm:SetPadding(4);
		self.nameForm:SetName("Name");
		
		if (openAura.faction.stored[self.faction].useFullName) then
			self.fullNameTextEntry = self.nameForm:TextEntry("Full Name");
		else
			self.forenameTextEntry = self.nameForm:TextEntry("Forename");
			self.surnameTextEntry = self.nameForm:TextEntry("Surname");
		end;
	end;
	
	if (selectModel or physDesc) then
		self.appearanceForm = vgui.Create("DForm");
		self.appearanceForm:SetPadding(4);
		self.appearanceForm:SetName("Appearance");
		
		if (physDesc and selectModel) then
			self.appearanceForm:Help("Write a physical description for your character in full English, and select an appropriate model.");
		elseif (physDesc) then
			self.appearanceForm:Help("Write a physical description for your character in full English.");
		end;
		
		if (physDesc) then
			self.physDescTextEntry = self.appearanceForm:TextEntry("Description");
		end;
		
		if (selectModel) then
			self.modelItemsList = vgui.Create("DPanelList", self);
			self.modelItemsList:SetPadding(4);
			self.modelItemsList:SetSpacing(16);
			self.modelItemsList:EnableHorizontal(true);
			self.modelItemsList:EnableVerticalScrollbar(true);
			
			self.appearanceForm:AddItem(self.modelItemsList);
		end;
	end;
	
	self.continueButton = vgui.Create("aura_LabelButton", self);
	self.continueButton:SetText("CONTINUE");
	self.continueButton:SetFont(smallTextFont);
	self.continueButton:SizeToContents();
	self.continueButton:SetMouseInputEnabled(true);
	
	-- Called when the button is clicked.
	function self.continueButton.DoClick(button)
		local minimumPhysDesc = openAura.config:Get("minimum_physdesc"):Get();
		local attributeTable = openAura.attribute:GetAll();
		local attributes = false;
		local info = {
			faction = self.faction,
			gender = self.gender,
			model = overrideModel or self.model
		};
		
		if (table.Count(attributeTable) > 0) then
			for k, v in pairs(attributeTable) do
				if (v.characterScreen) then
					attributes = true; break;
				end;
			end;
		end;
		
		if (!openAura.faction.stored[self.faction].GetName) then
			if ( IsValid(self.fullNameTextEntry) ) then
				info.fullName = self.fullNameTextEntry:GetValue();
				
				if (info.fullName == "") then
					return openAura.character:SetFault("You did not choose a name, or the name that you chose is not valid!");
				end;
			else
				info.forename = self.forenameTextEntry:GetValue();
				info.surname = self.surnameTextEntry:GetValue();
				
				if (info.forename == "" or info.surname == "") then
					return openAura.character:SetFault("You did not choose a name, or the name that you chose is not valid!");
				end;
				
				if ( string.find(info.forename, "[%p%s%d]") or string.find(info.surname, "[%p%s%d]") ) then
					return openAura.character:SetFault("Your forename and surname must not contain punctuation, spaces or digits!");
				end;
				
				if ( !string.find(info.forename, "[aeiou]") or !string.find(info.surname, "[aeiou]") ) then
					return openAura.character:SetFault("Your forename and surname must both contain at least one vowel!");
				end;
				
				if ( string.len(info.forename) < 2 or string.len(info.surname) < 2) then
					return openAura.character:SetFault( "Your forename and surname must both be at least 2 characters long!");
				end;
				
				if ( string.len(info.forename) > 16 or string.len(info.surname) > 16) then
					return openAura.character:SetFault("Your forename and surname must not be greater than 16 characters long!");
				end;
			end;
		end;
		
		if (selectModel and !info.model) then
			return openAura.character:SetFault("You did not choose a model, or the model that you chose is not valid!");
		end;
		
		if (physDesc) then
			info.physDesc = self.physDescTextEntry:GetValue();
			
			if (string.len(info.physDesc) < minimumPhysDesc) then
				return openAura.character:SetFault("The physical description must be at least "..minimumPhysDesc.." characters long!");
			end;
		end;
		
		openAura.plugin:Call("PlayerAdjustCharacterCreationInfo", self, info);
		
		if (attributes) then
			parent:OpenPanel("aura_CharacterStageThree", info);
			
			return;
		end;
		
		openAura:StartDataStream("CreateCharacter", info);
	end;
	
	if (self.nameForm) then
		self.panelList:AddItem(self.nameForm);
	end;
	
	if (self.appearanceForm) then
		self.panelList:AddItem(self.appearanceForm);
	end;
	
	openAura.plugin:Call("CharacterCreationPanelInitialized", self);
	
	self.panelList:AddItem(self.continueButton);
	
	if (parent and parent.childData) then
		self:SetInfo(parent.childData.faction, parent.childData.gender);
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint() end;

-- A function to set the information
function PANEL:SetInfo(faction, gender)
	local lowerGender = string.lower(gender);
	local spawnIcon = nil;
	local panel = openAura.character:GetPanel();
	
	for k, v in pairs(openAura.faction.stored) do
		if (v.name == faction) then
			self.faction = faction;
			self.gender = gender;
			
			if ( self.modelItemsList and v.models[lowerGender] ) then
				for k2, v2 in pairs( v.models[lowerGender] ) do
					spawnIcon = openAura:CreateColoredSpawnIcon(self);
					spawnIcon:SetModel(v2);
					
					-- Called when the spawn icon is clicked.
					function spawnIcon.DoClick(spawnIcon)
						if (self.selectedSpawnIcon) then
							self.selectedSpawnIcon:SetColor(nil);
						end;
						
						spawnIcon:SetColor( Color(255, 0, 0, 255) );
						
						if ( !panel:FadeInModelPanel(v2) ) then
							panel:SetModelPanelModel(v2);
						end;
						
						self.selectedSpawnIcon = spawnIcon;
						self.model = v2;
					end;
					
					self.modelItemsList:AddItem(spawnIcon);
				end;
			end;
		end;
	end;
end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if ( self:GetAlpha() > 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha( 255 - (delta * 255) );
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("rollover");
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if ( self:GetAlpha() == 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
	
	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(0, 0, 0, 0);
	
	if ( IsValid(self.modelItemsList) ) then
		self.modelItemsList:SetTall(256);
	end;
	
	self:SetSize( 512, math.min(self.panelList.pnlCanvas:GetTall() + 8, ScrH() * 0.6) );
end;

vgui.Register("aura_CharacterStageTwo", PANEL, "DFrame");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = openAura.option:GetFont("menu_text_small");
	local forcedFaction = nil;
	local factions = {};
	local parent = self:GetParent();
	
	for k, v in pairs(openAura.faction.stored) do
		if ( !v.whitelist or openAura.character:IsWhitelisted(v.name) ) then
			if ( !openAura.faction:HasReachedMaximum(k) ) then
				factions[#factions + 1] = v.name;
			end;
		end;
	end;
	
	table.sort(factions, function(a, b)
		return a < b;
	end);
	
	self:ShowCloseButton(false);
	self.lblTitle:SetVisible(false);
	
	self:SetDraggable(false);
	
	self.panelList = vgui.Create("DPanelList", self);
 	self.panelList:SetPadding(2);
 	self.panelList:SetSpacing(3);
 	self.panelList:SizeToContents();
 	self.panelList:SetDrawBackground(false);
	
	self.settingsForm = vgui.Create("DForm");
	self.settingsForm:SetName("Settings");
	self.settingsForm:SetPadding(4);
	
	if (#factions > 1) then
		self.settingsForm:Help("The faction defines the overall character and can most likely be unchanged.");
		self.factionMultiChoice = self.settingsForm:MultiChoice("Faction");
		self.factionMultiChoice:SetEditable(false);
		
		-- Called when an option is selected.
		self.factionMultiChoice.OnSelect = function(multiChoice, index, value, data)
			for k, v in pairs(openAura.faction.stored) do
				if (v.name == value) then
					if ( IsValid(self.genderMultiChoice) ) then
						self.genderMultiChoice:Clear();
					else
						self.genderMultiChoice = self.settingsForm:MultiChoice("Gender");
						self.genderMultiChoice:SetEditable(false);
					end;
					
					if (v.singleGender) then
						self.genderMultiChoice:AddChoice(v.singleGender);
					else
						self.genderMultiChoice:AddChoice(GENDER_FEMALE);
						self.genderMultiChoice:AddChoice(GENDER_MALE);
					end;
					
					openAura.CurrentFactionSelected = {self, value};
					
					break;
				end;
			end;
		end;
	elseif (#factions == 1) then
		for k, v in pairs(openAura.faction.stored) do
			if ( v.name == factions[1] ) then
				self.genderMultiChoice = self.settingsForm:MultiChoice("Gender");
				self.genderMultiChoice:SetEditable(false);
				
				if (v.singleGender) then
					self.genderMultiChoice:AddChoice(v.singleGender);
				else
					self.genderMultiChoice:AddChoice(GENDER_FEMALE);
					self.genderMultiChoice:AddChoice(GENDER_MALE);
				end;
				
				openAura.CurrentFactionSelected = {self, v.name};
				
				forcedFaction = v.name;
				
				break;
			end;
		end;
	end;
	
	self.continueButton = vgui.Create("aura_LabelButton", self);
	self.continueButton:SetText("CONTINUE");
	self.continueButton:SetFont(smallTextFont);
	self.continueButton:SizeToContents();
	self.continueButton:SetMouseInputEnabled(true);
	
	-- Called when the button is clicked.
	function self.continueButton.DoClick(button)
		if ( IsValid(self.genderMultiChoice) ) then
			local faction = forcedFaction;
			local gender = self.genderMultiChoice.TextEntry:GetValue();
			
			if (!faction and self.factionMultiChoice) then
				faction = self.factionMultiChoice.TextEntry:GetValue();
			end;
			
			for k, v in pairs(openAura.faction.stored) do
				if (v.name == faction) then
					if ( openAura.faction:IsGenderValid(faction, gender) ) then
						parent:OpenPanel( "aura_CharacterStageTwo", {faction = faction, gender = gender} );
					end;
					
					break;
				end;
			end;
		end;
	end;
	
	if (self.factionMultiChoice) then
		for k, v in pairs(factions) do
			self.factionMultiChoice:AddChoice(v);
		end;
	end;
	
	self.panelList:AddItem(self.settingsForm);
	self.panelList:AddItem(self.continueButton);
end;

-- Called when the panel is painted.
function PANEL:Paint() end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if ( self:GetAlpha() > 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha( 255 - (delta * 255) );
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("rollover");
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if ( self:GetAlpha() == 0 and ( !self.animation or !self.animation:Active() ) ) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		openAura.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
	
	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(0, 0, 0, 0);
	self:SetSize( 512, math.min(self.panelList.pnlCanvas:GetTall() + 8, ScrH() * 0.6) );
end;

vgui.Register("aura_CharacterStageOne", PANEL, "DFrame");

usermessage.Hook("aura_CharacterRemove", function(msg)
	local characters = openAura.character:GetAll();
	
	if (table.Count(characters) > 0) then
		local characterID = msg:ReadShort();
		
		if ( characters[characterID] ) then
			characters[characterID] = nil;
			
			if ( !openAura.character:IsPanelLoading() ) then
				openAura.character:RefreshPanelList();
			end;
			
			if ( openAura.character:GetPanelList() ) then
				if (table.Count(characters) == 0) then
					openAura.character:GetPanel():ReturnToMainMenu();
				end;
			end;
		end;
	end;
end);

openAura:HookDataStream("SetWhitelisted", function(data)
	local whitelisted = openAura.character:GetWhitelisted();
	
	for k, v in pairs(whitelisted) do
		if ( v == data[1] ) then
			if ( !data[2] ) then
				whitelisted[k] = nil;
				
				return;
			end;
		end;
	end;
	
	if ( data[2] ) then
		whitelisted[#whitelisted + 1] = data[1];
	end;
end);

openAura:HookDataStream("CharacterAdd", function(data)
	openAura.character:GetAll()[data.characterID] = data;
	
	if ( !openAura.character:IsPanelLoading() ) then
		openAura.character:RefreshPanelList();
	end;
end);

openAura:HookDataStream("CharacterMenu", function(data)
	if (data == CHARACTER_MENU_LOADED) then
		if ( openAura.character:GetPanel() ) then
			openAura.character:SetPanelLoading(false);
			openAura.character:RefreshPanelList();
		end;
	elseif (data == CHARACTER_MENU_CLOSE) then
		openAura.character:SetPanelOpen(false);
	elseif (data == CHARACTER_MENU_OPEN) then
		openAura.character:SetPanelOpen(true);
	end;
end);

usermessage.Hook("aura_CharacterOpen", function(msg)
	openAura.character:SetPanelOpen(true);
	
	if ( msg:ReadBool() ) then
		openAura.character.isMenuReset = true;
	end;
end);

usermessage.Hook("aura_CharacterFinish", function(msg)
	if ( msg:ReadBool() ) then
		openAura.character:SetPanelMainMenu();
		openAura.character:SetPanelOpen(false, true);
		openAura.character:SetFault(nil);
	else
		openAura.character:SetFault( msg:ReadString() );
	end;
end);