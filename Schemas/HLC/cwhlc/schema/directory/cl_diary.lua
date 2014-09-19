local Clockwork = Clockwork;

local DIARY = "";

local function AddText(title, bodyText)
	DIARY = DIARY..[[
		<div class="cwTitleSeperator">]]..title..[[</div>
	]];
	
	DIARY = DIARY..[[
		<div class="cwContentText">
			]]..bodyText..[[
		</div>
	]];
end;

AddText( "Written by: [Data Missing]", [[
	<p>
		<b>2020. Told through 2021.</b>
	</p>
	
	<p>
		<i>
			They said, Dr. Freeman would help us, they said that when he arrives, we will be free and everything will
			return to normal. They lied to us. In 2020 we watched with pride as Dr. Freeman broke in to the citadel... 
			But never came out. The city became quiet. Every single combine unit disappeared, we thought we had won... 
			But we were horribly wrong.
		</i>
	</p>
	<p>
		In the events of the citadel raid, Dr. freeman was captured, brutally tortured, later on: Killed on the order of 
		Dr. Breen. The combine however, never gave up. It was Summer when the city went quiet... August 11, we were scavenging 
		for supplies in the city when the citadel went quiet and dark.. It's been weeks now. Hell knows what happened, and every 
		single combine unit was pulled back. I felt it... Something horrible is about to happen, we must to leave the city 
		at once... But I was too late... We were all too late.
	</p>
	
	<p>
		3:15PM. The citadel's lights were restored. Everyone was observing what was happening... But we were fools, we should 
		have ran... But we didn't. We were boldly staring at the citadel... A portal opened at the top, we saw it... Something 
		came through but we had no idea what it could be. All of us took fighting positions in the ruins and observed the citadel... 
		But nothing happened.
	</p>
	
	<p>
		7:42PM. The citadel began to move, it was getting dark but the citadel was glowing enough to be seen. The sides of 
		it opened: Huge holes without a purpose. At least, that's what we thought. Twenty minutes later, a huge army of combine 
		dropships began to swarm out from the area carrying canisters. We didn't understood it but one thing we knew: Biological 
		weaponry... That's what came through, and that's what they're going to use on us, an alien biological weapon.
	</p>
	
	<p>
		They began to bomb the city, screams, explosions everywhere. But we survived the night... However: The thing that came 
		afterwards... Horrified us all.
	</p>
	
	<p>
		I never believed in zombies in my entire life but something happened. This, biological weapon, made our men and women  
		act like wild animals. They got sick, became blind, puked on the walls, threw their uniform away, became wild animals... 
		The color of their eyes disappeared, they drooled and attacked everyone who they saw... They were working in packs, 
		like some wolves hunting us down... Eating people alive... I couldn't believe what I saw.
	</p>
	
	<p>
		The combine managed to develop a virus, some sort of virus that crazed the people and turned our own men against us... 
		I couldn't believe what I saw. I grabbed Tiffany's hand -my wife- and began to run towards the canals... We had to get 
		out from the city... We had to... We got ambushed, they took Tifanny, killed her... I had to run, I had no other choice.
	</p>
	
	<p>
		<b>2023.</b>
	</p>
	
	<p>
		Now it's 2023, every citadel played down the signal, those who survived fled in to small, old towns. On my travels I met 
		many people, and I was glad as hell about it...
	</p>
	
	<p>
		We never thought that we still had a military, but we did. They called themselves: Conscripts, soldiers... living in cities 
		in secrecy, with their full gear spared... As the survivors escaped out to small towns the conscripts came with them, guiding 
		and protecting them.
	</p>
	
	<p>
		Humanity began to re-build itself forming colonies, getting back our old clothes, our old lives, our old jobs. Me and a lot 
		of men fled to a small town in ukraine called: Cherkasy. A wasteland, with the ruins of a big old city in the middle and a 
		small separated town...
	</p>
	
	<p>
		We're living in this small town and the city is a deadly place, and whoever goes there; dies. The infected roams the wasteland. 
		Going out is the stupidest thing. Humanity began to re-build old organisations, with new names. The conscripts formed the G.M.U: 
		Global Military Union that were responsible for the safety of the civilians.
	</p>
	
	<p>
		An old general, called: [Data Missing] has established himself in an underground bunker on the wasteland. It seemed like 
		everything got back to normal, gas mask soldiers protecting us, civilians who live their lives again. But this was not 
		like a standard horror movie... No...
	</p>
	
	<p>
		We have several enemies, us the civilians. There's the Will of Freedom... Once former proud rebels, now bandits, robbing 
		people, sometimes even shooting them if necessary. Then the remaining O.T.A forces of the combine, who are all still in 
		stasis in the citadels. None of them were seen for about 2 years now but they say that the citadels began to move again, 
		scary stuff...
	</p>
	
	<p>
		Now, my friend... Knowing where you are, and who you are... It is up to you to take a path, will you be smart and survive? 
		Or you will be a rambo who dies quickly? Everything, is up to you...
	</p>
	
	<p>
		<b>Because this is... Half-Life Consequences.</b>
	</p>
]]);

Clockwork.directory:AddCategoryPage("Diary", nil, DIARY);
Clockwork.directory:SetCategoryTip("Diary", "A story well known to all survivors.");
Clockwork.directory:AddCategory("Diary", "HLC");