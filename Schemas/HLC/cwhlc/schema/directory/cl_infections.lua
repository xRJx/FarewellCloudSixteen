local Clockwork = Clockwork;

local INFECTIONS = "";

local function AddText(title, bodyText)
	INFECTIONS = INFECTIONS..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	INFECTIONS = INFECTIONS..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "Infections", [[
	<hr>
	
	<p>
		<p>The bombs used against humanity were not just any bombs... They had a twisted side effect, turning brothers and sisters 
		against each other. It was one of the farewell presents from the Universal Union, but not one of their last. No equipment 
		is available to analyse the disease (or whatever it may be) and all equipment expected to be useful in finding a cure is 
		most likely locked away in a citadel. Upon first being infected, the first symptoms is an accelerated heart rate and a 
		lower temperature in the body's core (this occurs in the first 5 minutes). After this, symptoms begin to appear at a fast 
		rate, about 2 minutes later the victim will shows signs of a fever, intense sweating and crippling seizures. After this, 
		the victim will lay dormant for 30-40 seconds before turning on any human it can find.</p>
	</p>
	
	<hr>
]]);

Clockwork.directory:AddCategoryPage("Infections", nil, INFECTIONS);
Clockwork.directory:SetCategoryTip("Infections", "Read up on causes and effects of the infection.");
Clockwork.directory:AddCategory("Infections", "HLC");