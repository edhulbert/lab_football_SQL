-- Find all the matches from 2017.
--SELECT * FROM matches WHERE season = 2017;

-- Find all the matches featuring Barcelona.
--SELECT * FROM matches WHERE hometeam = 'Barcelona' OR awayteam = 'Barcelona';

-- What are the names of the Scottish divisions included?
--SELECT name FROM divisions WHERE country = 'Scotland';

--Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
--SELECT COUNT(*) FROM matches WHERE division_code = (SELECT code FROM divisions WHERE name = 'Bundesliga') AND (hometeam='Freiburg' OR awayteam='Freiburg');

--Find the unique names of the teams which include the word "City" in their name (as entered in the database)
--SELECT hometeam FROM matches WHERE hometeam ILIKE '%city%' UNION SELECT awayteam FROM matches WHERE awayteam ILIKE '%city%';

--How many different teams have played in matches recorded in a French division?
--SELECT COUNT(*) FROM (SELECT hometeam FROM matches WHERE division_code IN (SELECT code FROM divisions WHERE country = 'France') UNION SELECT awayteam FROM matches WHERE division_code IN (SELECT code FROM divisions WHERE country = 'France')) AS french_teams;

--Have Huddersfield played Swansea in the period covered?
--SELECT COUNT(*) FROM matches WHERE hometeam = 'Huddersfield' AND awayteam = 'Swansea' OR hometeam = 'Swansea' AND awayteam = 'Huddersfield';

--How many draws were there in the Eredivisie between 2010 and 2015?
--SELECT COUNT(*) FROM matches WHERE ftr = 'D' AND division_code = 'N1' AND season >= 2010 AND season <= 2015;

--Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
--SELECT * FROM matches WHERE division_code = 'E0' ORDER BY (fthg + ftag) DESC, fthg DESC;

--In which division and which season were the most goals scored?
--SELECT division_code, season, SUM(fthg + ftag) AS sum_scores FROM matches GROUP BY division_code, season ORDER BY sum_scores DESC FETCH FIRST 1 ROW ONLY;