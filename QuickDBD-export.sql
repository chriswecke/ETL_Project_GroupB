-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "hanks_survey" (
    "Individual_Index" int   NOT NULL,
    "Selection_Index" int   NOT NULL,
    "Movie_Selection_1" varchar   NOT NULL,
    "Movie_Genre" varchar   NOT NULL,
    "Other" varchar   NOT NULL,
    "Gender" varchar   NOT NULL,
    "Birth_Year" varchar   NOT NULL
);

CREATE TABLE "hanks_TMDB" (
    "character" varchar   NOT NULL,
    "credit_id" varchar   NOT NULL,
    "id" int   NOT NULL,
    "video" varchar   NOT NULL,
    "vote_count" int   NOT NULL,
    "backdrop_path" varchar   NOT NULL,
    "genre_ids" int   NOT NULL,
    "popularity" int   NOT NULL,
    "title" varchar   NOT NULL,
    "vote_average" int   NOT NULL,
    "overview" varchar   NOT NULL
);

CREATE TABLE "hanks_OMDB" (
    "Title" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Rated" varchar   NOT NULL,
    "Released" varchar   NOT NULL,
    "Runtime" varchar   NOT NULL,
    "Genre" varchar   NOT NULL,
    "Director" varchar   NOT NULL,
    "Writer" varchar   NOT NULL,
    "Actors" varchar   NOT NULL,
    "Plot" varchar   NOT NULL,
    "Language" varchar   NOT NULL,
    "Country" varchar   NOT NULL,
    "Awards" varchar   NOT NULL,
    "Ratings" varchar   NOT NULL,
    "Metascore" int   NOT NULL,
    "imdbRating" int   NOT NULL,
    "imdbVotes" int   NOT NULL,
    "imdbID" varchar   NOT NULL,
    "Type" varchar   NOT NULL,
    "Production" varchar   NOT NULL
);

ALTER TABLE "hanks_TMDB" ADD CONSTRAINT "fk_hanks_TMDB_title" FOREIGN KEY("title")
REFERENCES "hanks_survey" ("Movie_Selection_1");

ALTER TABLE "hanks_OMDB" ADD CONSTRAINT "fk_hanks_OMDB_Title" FOREIGN KEY("Title")
REFERENCES "hanks_survey" ("Movie_Selection_1");

