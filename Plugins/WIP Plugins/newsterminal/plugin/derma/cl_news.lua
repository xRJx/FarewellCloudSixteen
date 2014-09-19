local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(true);
	self:SetDeleteOnClose(false);
	self:SetTitle("<:: News Terminal ::>");
	
	-- Called when the button is clicked.
	function self.btnClose.DoClick(button)
		self:Close(); self:Remove();
		
		gui.EnableScreenClicker(false);
	end;
	
	self.news = vgui.Create("cwPanelList", self);
 	self.news:SetPadding(2);
 	self.news:SetSpacing(3);
 	self.news:SizeToContents();
	self.news:EnableVerticalScrollbar();
end;

-- Called each frame.
function PANEL:Think()
	local scrW = ScrW();
	local scrH = ScrH();
	
	self:SetSize(512, 256);
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) );
end;

-- A function to populate the panel.
function PANEL:Populate()
	self.news:Clear();
	
	local article = vgui.Create("DHTML");
	
	article:OpenURL("http://exiguous-productions.com/apexgamingrp/article.html");
	article:SetHeight(220);
	
	self.news:AddItem(article);
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.news:StretchToParent(4, 28, 4, 4);
	
	DFrame.PerformLayout(self);
end;

vgui.Register("cwNews", PANEL, "DFrame");