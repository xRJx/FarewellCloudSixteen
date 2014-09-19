local Clockwork = Clockwork;

local CREDITS = "";

local function AddText(title, bodyText)
	CREDITS = CREDITS..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	CREDITS = CREDITS..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "", [[
	<hr>
	
	<p>
		<b>Cloudsixteen Community</b>
		<p>Inspiration & Suggestions</p>
	</p>
	
	<hr>
	
	<p>
		<b>kurozael</b>
		<p>Some HL2RP Functions</p>
	</p>
	
	<hr>
	
	<p>
		<b>RJ</b>
		<p>Main Artistry</p>
		<p>Main Development</p>
	</p>
	
	<hr>
	
	<p>
		<b>Tonў</b>
		<p>Concept & Idea</p>
		<p>Diary</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Credits", nil, CREDITS);
Clockwork.directory:SetCategoryTip("Credits", "See who has contributed to the creation of HLC.");
Clockwork.directory:AddCategory("Credits", "HLC");