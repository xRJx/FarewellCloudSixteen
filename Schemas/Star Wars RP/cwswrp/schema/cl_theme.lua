local THEME = Clockwork.theme:Begin();

-- Called when fonts should be created.
function THEME:CreateFonts()
	--[[ Create the fonts here using the Clockwork.fonts library. --]]
end;

-- Called when to initialize the theme.
function THEME:Initialize()
	-- Set the fonts and colors here.
end;

THEME.skin.frameBorder = Color(255, 255, 255, 255);
THEME.skin.frameTitle = Color(255, 255, 255, 255);

THEME.skin.bgColorBright = Color(255, 255, 255, 255);
THEME.skin.bgColorSleep = Color(70, 70, 70, 255);
THEME.skin.bgColorDark = Color(50, 50, 50, 255);
THEME.skin.bgColor = Color(40, 40, 40, 225);

THEME.skin.controlColorHighlight = Color(70, 70, 70, 255);
THEME.skin.controlColorActive = Color(175, 175, 175, 255);
THEME.skin.controlColorBright = Color(100, 100, 100, 255);
THEME.skin.controlColorDark = Color(30, 30, 30, 255);
THEME.skin.controlColor = Color(60, 60, 60, 255);

THEME.skin.colTabTextInactive = Color(255, 255, 255, 255);
THEME.skin.colPropertySheet = Color(255, 255, 255, 255);
THEME.skin.colTabInactive = Color(0, 0, 0, 255);
THEME.skin.colTabShadow = Color(0, 0, 0, 170);
THEME.skin.colTabText = Color(0, 0, 0, 255);
THEME.skin.colTab = Color(255, 255, 255, 255);

THEME.skin.fontCategoryHeader = "hl2_ThickArial";
THEME.skin.fontMenuOption = "hl2_ThickArial";
THEME.skin.fontFormLabel = "hl2_ThickArial";
THEME.skin.fontButton = "hl2_ThickArial";
THEME.skin.fontFrame = "hl2_ThickArial";
THEME.skin.fontTab = "hl2_ThickArial";

-- A function to draw a generic background.
function THEME.skin:DrawGenericBackground(x, y, w, h, color)
	surface.SetDrawColor(color);
	surface.DrawRect(x, y, w, h);
end;

-- Called when a frame is layed out.
function THEME.skin:LayoutFrame(panel)
	panel.lblTitle:SetFont(self.fontFrame);
	panel.lblTitle:SetText(panel.lblTitle:GetText():upper());
	panel.lblTitle:SetTextColor(Color(0, 0, 0, 255));
	panel.lblTitle:SizeToContents();
	panel.lblTitle:SetExpensiveShadow(nil);
	
	panel.btnClose:SetDrawBackground(true);
	panel.btnClose:SetPos(panel:GetWide() - 22, 2);
	panel.btnClose:SetSize(18, 18);
	panel.lblTitle:SetPos(8, 2);
	panel.lblTitle:SetSize(panel:GetWide() - 25, 20);
end;

-- Called when a form is schemed.
function THEME.skin:SchemeForm(panel)
	panel.Label:SetFont(self.fontFormLabel);
	panel.Label:SetText(panel.Label:GetText():upper());
	panel.Label:SetTextColor(Color(255, 255, 255, 255));
	panel.Label:SetExpensiveShadow(1, Color(0, 0, 0, 200));
end;

-- Called when a tab is painted.
function THEME.skin:PaintTab(panel)
	if (panel:GetPropertySheet():GetActiveTab() == panel) then
		self:DrawGenericBackground(1, 1, panel:GetWide() - 2, panel:GetTall() + 8, self.colTab);
	else
		self:DrawGenericBackground(1, 2, panel:GetWide() - 2, panel:GetTall() + 8, self.colTabInactive);
	end;
end;

-- Called when a list view is painted.
function THEME.skin:PaintListView(panel)
	if (panel.m_bBackground) then
		surface.SetDrawColor(255, 255, 255, 255);
		panel:DrawFilledRect();
	end;
end;
	
-- Called when a list view line is painted.
function THEME.skin:PaintListViewLine(panel)
	local color = Color(50, 50, 50, 255);
	local textColor = Color(255, 255, 255, 255);
	
	if (panel:IsSelected()) then
		color = Color(255, 255, 255, 255);
		textColor = Color(0, 0, 0, 255);
	elseif (panel.Hovered) then
		color = Color(100, 100, 100, 255);
	elseif (panel.m_bAlt) then
		color = Color(75, 75, 75, 255);
	end;
	
	for k, v in pairs(panel.Columns) do
		v:SetTextColor(textColor);
	end;
 
	surface.SetDrawColor(color.r, color.g, color.b, color.a);
	surface.DrawRect(0, 0, panel:GetWide(), panel:GetTall());
end;

-- Called when a list view label is schemed.
function THEME.skin:SchemeListViewLabel(panel)
	panel:SetTextInset(3);
	panel:SetTextColor(Color(255, 255, 255, 255));
end;

-- Called when a menu is painted.
function THEME.skin:PaintMenu(panel)
	surface.SetDrawColor(Color(0, 0, 0, 255));
	panel:DrawFilledRect(0, 0, w, h);
end;

-- Called when a menu is painted over.
function THEME.skin:PaintOverMenu(panel) end;

-- Called when a menu option is schemed.
function THEME.skin:SchemeMenuOption(panel)
	panel:SetFGColor(255, 255, 255, 255);
end;

-- Called when a menu option is painted.
function THEME.skin:PaintMenuOption(panel)
	local textColor = Color(255, 255, 255, 255);
	
	if (panel.m_bBackground and panel.Hovered) then
		local color = nil;

		if (panel.Depressed) then
			color = Color(225, 225, 225, 255);
		else
			color = Color(255, 255, 255, 255);
		end;

		surface.SetDrawColor(color.r, color.g, color.b, color.a);
		surface.DrawRect(0, 0, panel:GetWide(), panel:GetTall());
		
		textColor = Color(0, 0, 0, 255);
	end;
	
	panel:SetFGColor(textColor);
end;

-- Called when a menu option is layed out.
function THEME.skin:LayoutMenuOption(panel)
	panel:SetFont(self.fontMenuOption);
	panel:SizeToContents();
	panel:SetWide(panel:GetWide() + 30);
	panel:SetSize(math.max(panel:GetParent():GetWide(), panel:GetWide()), 18);
	
	if (panel.SubMenuArrow) then
		panel.SubMenuArrow:SetSize(panel:GetTall(), panel:GetTall());
		panel.SubMenuArrow:CenterVertical();
		panel.SubMenuArrow:AlignRight();
	end;
end;

-- Called when a button is painted.
function THEME.skin:PaintButton(panel)
	local w, h = panel:GetSize();
	local textColor = Color(255, 255, 255, 255);
	
	if (panel.m_bBackground) then
		local color = Color(0, 0, 0, 255);
		local borderColor = Color(255, 255, 255, 255);
		
		if (panel:GetDisabled()) then
			color = self.controlColorDark;
		elseif (panel.Depressed or panel:GetSelected()) then
			color = Color(255, 255, 255, 255);
			textColor = Color(0, 0, 0, 255);
		elseif (panel.Hovered) then
			color = self.controlColorHighlight;
		end;

		self:DrawGenericBackground(0, 0, w, h, borderColor);
		self:DrawGenericBackground(1, 1, w - 2, h - 2, color);
	end;
	
	panel:SetFGColor(textColor);
end;

-- Called when a scroll bar grip is painted.
function THEME.skin:PaintScrollBarGrip(panel)
	local w, h = panel:GetSize();
	local color = Color(255, 255, 255, 255);

	self:DrawGenericBackground(0, 0, w, h, color);
	self:DrawGenericBackground(2, 2, w - 4, h - 4, Color(0, 0, 0, 255));
end;

Clockwork.theme:Finish(THEME);