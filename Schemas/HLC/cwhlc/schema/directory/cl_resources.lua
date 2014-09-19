local Clockwork = Clockwork;

local RESOURCES = "";

local function AddText(title, bodyText)
	RESOURCES = RESOURCES..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	RESOURCES = RESOURCES..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "Earth's Resources", [[
	<hr>
	
	<p>
		<p>In just 10 years, the Combine have stripped most (if not all) of Earth's non-renewable resources. The details on how 
		they amassed enough labour to do such a task is unknown, but perhaps they didn't kill as many people as everyone has been 
		led to believe? From this point on, the chance of humanity ever accomplishing anything is very slim without Earth's resources 
		and there will be no chance of getting them back as all of the resources have been transported off Earth. Select locations 
		around the globe house grand excavation machines as rumoured by some survivors and they have also said that sightings of 
		those machines are confirmed. They were left behind most likely because of the sheer size of them being too large to be 
		transported off of Earth.</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Earth's Resources", nil, RESOURCES);
Clockwork.directory:SetCategoryTip("Earth's Resources", "What really happened to Earth.");
Clockwork.directory:AddCategory("Earth's Resources", "HLC");