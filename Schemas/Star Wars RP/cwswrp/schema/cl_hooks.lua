-- Called when the cinematic intro info is needed.
function Schema:GetCinematicIntroInfo()
	return {
		credits = "Designed and developed by "..self:GetAuthor()..".",
		title = Clockwork.config:Get("intro_text_big"):Get(),
		text = Clockwork.config:Get("intro_text_small"):Get()
	};
end;

-- Called when the scoreboard's class players should be sorted.
function Schema:ScoreboardSortClassPlayers(class, a, b)
	if (class == "Clones") then
		local rankA = self:GetPlayerCloneRank(a);
		local rankB = self:GetPlayerCloneRank(b);
		
		if (rankA == rankB) then
			return a:Name() < b:Name();
		else
			return rankA > rankB;
		end;
	end;
end;