-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS years;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS titles;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE publishers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  publisher_name TEXT
);

CREATE TABLE years (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  year_date INTEGER
);

CREATE TABLE ratings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rating_des TEXT
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT
  character_id INTEGER
);

CREATE TABLE titles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title_name TEXT,
  year_id INTEGER,
  rating_id INTEGER,
  publisher_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO publishers (publisher_name)
VALUES ("Warner Bros.");

INSERT INTO years (year_date) VALUES (2005);
INSERT INTO years (year_date) VALUES (2008);
INSERT INTO years (year_date) VALUES (2012);

INSERT INTO ratings (rating_des)
VALUES ("PG-13");

INSERT INTO characters (character_name) VALUES ("Bruce Wayne");
INSERT INTO characters (character_name) VALUES ("Alfred");
INSERT INTO characters (character_name) VALUES ("Ra's Al Ghul");
INSERT INTO characters (character_name) VALUES ("Rachel Dawes");
INSERT INTO characters (character_name) VALUES ("Commissioner Gordon");
INSERT INTO characters (character_name) VALUES ("Joker");
INSERT INTO characters (character_name) VALUES ("Harvey Dent");
INSERT INTO characters (character_name) VALUES ("Bane");
INSERT INTO characters (character_name) VALUES ("John Blake");
INSERT INTO characters (character_name) VALUES ("Selina Kyle");

INSERT INTO actors (actor_name, character_id) VALUES ("Christian Bale",1);
INSERT INTO actors (actor_name, character_id) VALUES ("Michael Caine",2);
INSERT INTO actors (actor_name, character_id) VALUES ("Liam Neeson",3);
INSERT INTO actors (actor_name, character_id) VALUES ("Katie Holmes",4);
INSERT INTO actors (actor_name, character_id) VALUES ("Gary Oldman",5);
INSERT INTO actors (actor_name, character_id) VALUES ("Heath Ledger",6);
INSERT INTO actors (actor_name, character_id) VALUES ("Aaron Eckhart",7);
INSERT INTO actors (actor_name, character_id) VALUES ("Maggie Gyllenhaal",4);
INSERT INTO actors (actor_name, character_id) VALUES ("Tom Hardy",8);
INSERT INTO actors (actor_name, character_id) VALUES ("Joseph Gordon-Levitt",9);
INSERT INTO actors (actor_name, character_id) VALUES ("Anne Hathaway",10);

INSERT INTO titles (title_name, year_id, rating_id, publisher_id) VALUES ("Batman Begins",1,1,1);
INSERT INTO titles (title_name, year_id, rating_id, publisher_id) VALUES ("The Dark Knight",2,1,1);
INSERT INTO titles (title_name, year_id, rating_id, publisher_id) VALUES ("The Dark Knight Rises",3,1,1);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
SELECT titles.title_name, years.year_date, ratings.rating_des, publishers.publisher_name FROM titles
INNER JOIN years ON titles.year_id = years.id
INNER JOIN ratings ON titles.rating_id = ratings.id
INNER JOIN publishers ON titles.publisher_id = publishers.id
GROUP BY titles.title_name;

-- Prints a header for the cast output
--.print ""
--.print "Top Cast"
--.print "========"
--.print ""


-- The SQL statement for the cast output
-- TODO!
