local Clockwork = Clockwork;

local TIMELINE = "";

local function AddText(title, bodyText)
	TIMELINE = TIMELINE..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	TIMELINE = TIMELINE..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "From 2010 to 2023", [[
	<hr>
	
	<p>
		<b>2010</b>
		<p>7 Hour War</p>
	</p>
	
	<hr>
	
	<p>
		<b>2020</b>
		<p>Combine Overthrow</p>
		<p>Gordon Freeman's Death</p>
		<p>Biological Bombings</p>
		<p>Combine Evacuation</p>
		<p>G.M.C. Revelation</p>
	</p>
	
	<hr>
	
	<p>
		<b>2021</b>
		<p>G.M.C. Established as Earth's Protectorate</p>
		<p>WoF Founded</p>
		<p>G.M.C. Begins Recruiting</p>
	</p>
	
	<hr>
	
	<p>
		<b>2022</b>
		<p>Citadel Tremors</p>
		<p>Overwatch Sightings</p>
	</p>
	
	<hr>
	
	<p>
		<b>2023 (Present)</b>
		<p>Post-Bio Bombs</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Timeline", nil, TIMELINE);
Clockwork.directory:SetCategoryTip("Timeline", "Contains important dates before and after the Bio Bombs.");
Clockwork.directory:AddCategory("Timeline", "HLC");