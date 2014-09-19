local Clockwork = Clockwork;

local RANKS = "";

local function AddText(title, bodyText)
	RANKS = RANKS..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	RANKS = RANKS..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "", [[
	<hr>
	
	<p>
		<b>G.M.C. (Global Military Coalition)</b>
		<p>Gen. - General</p>
		<p>Col. - Colonel</p>
		<p>Maj. - Major</p>
		<p>Cpt. - Captain</p>
		<p>Lt. - Lieutenant</p>
		<p>Sgt. - Sergeant</p>
		<p>Cpl. - Corporal</p>
		<p>Pvt. - Private</p>
	</p>
	
	<hr>
	
	<p>
		<b>Overwatch Transhuman Arm</b>
		<p>CmD - Command Director</p>
		<p>EOW - Elite Overwatch</p>
		<p>OWS - Overwatch Soldier</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Ranks", nil, RANKS);
Clockwork.directory:SetCategoryTip("Ranks", "The hierarchy of prominent factions.");
Clockwork.directory:AddCategory("Ranks", "HLC");