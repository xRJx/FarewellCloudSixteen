local Clockwork = Clockwork;

local FACTIONS = "";

local function AddText(title, bodyText)
	FACTIONS = FACTIONS..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	FACTIONS = FACTIONS..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "", [[
	<hr>
	
	<p>
		<b>G.M.C. (Global Military Coalition)</b>
		<p>Formally known as Conscripts. These are the remnants of the soldiers who foughts for Earth. They've managed to keep 
		their identities a secret until not so long ago. Once they made themselves known, they established themselves as the 
		world's new military dedicating themselves to protecting the remaining inhabitants of Earth.</p>
	</p>
	
	<hr>
	
	<p>
		<b>Overwatch Transhuman Arm</b>
		<p>Half human, half machine. These are the soldiers of the Universal Union and were once used to maintain order in times 
		of chaos. The only thought of function after being left behind for unknown reasones is to analize and observe. The OTA 
		has not been heard of for a long time but some people have reported recent sightings.</p>
	</p>
	
	<hr>
	
	<p>
		<b>Survivors</b>
		<p>The dominant and indigenous species of Earth. Everyone is a survivor, but these Survivors are the nomads that have not 
		yet claimed allegience to any known factions. The Survivors are unpredictable and can be a friend or foe. Some Survivors 
		have banded together to try and rebuild humanity while others go their own way.</p>
	</p>
	
	<hr>
	
	<p>
		<b>Traders</b>
		<p>The traders are just like the survivors, but they are dedicated to trading. These people usually wander from town to town, 
		place to place trading their goods for other goods. There is not much to say about them, other than that one will most likely 
		arrive in an area near you from time to time.</p>
	</p>
	
	<hr>
	
	<p>
		<b>Vortigaunts</b>
		<p>An alien race that went took refuge on Earth. A great amount is still unknown about the Vortigaunts but they usually 
		speak words of great wisdom. They possess the ability to take life and to restore it. Befriending a Vortigaunt will most 
		likely serve as a great benefit as opposed to making enemies of them.</p>
	</p>
	
	<hr>
	
	<p>
		<b>Will of Freedom</b>
		<p>A rebel who fought for humanity, but now robs humanity. These once proud men and women have turned to a life of violence
		and crime to be able to continue living. Be weary as they've endured the worst to fight for your freedom and although
		you may have as well, they continue to exercise their abilities which gives them an edge.</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Factions", nil, FACTIONS);
Clockwork.directory:SetCategoryTip("Factions", "Take a look at who you'll possibly encounter.");
Clockwork.directory:AddCategory("Factions", "HLC");