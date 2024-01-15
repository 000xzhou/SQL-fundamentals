
CREATE DATABASE sports_league;

\c sports_league

-- - All of the teams in the league
CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team Varchar(10) NOT NULL,
);

-- - All of the players in the league and their corresponding teams
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams ON DELETE NULL,
  ranking INTEGER ON DELETE NULL,
);

-- - All of the referees who have been part of each game
CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

-- - All of the goals scored by every player for each game
CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players ON DELETE NULL,
  goal TEXT,
  game_id INTEGER REFERENCES games ON DELETE NULL,
);

-- - All of the matches played between teams
CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  team_one_id INTEGER REFERENCES teams ON DELETE NULL,
  team_two_id INTEGER REFERENCES teams ON DELETE NULL,
  referees_id INTEGER REFERENCES referees ON DELETE NULL,
);

-- - All of the start and end dates for season that a league has
-- I don't know what that means.. but this should be fine right?
CREATE TABLE game_dates
(
  id SERIAL PRIMARY KEY,
  season_start_date DATE NOT NULL,
  season_end_date DATE NOT NULL,
);

