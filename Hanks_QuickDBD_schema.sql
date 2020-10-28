-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "hanks_survey" (
    "Individual_Index" int   NOT NULL,
    "Selection_Index" int   NOT NULL,
    "Movie_Selection_1" varchar(255)   NOT NULL,
    "Movie_Genre" varchar(255)   NOT NULL,
    "Other" varchar(255)   NOT NULL,
    "Gender" varchar(255)   NOT NULL,
    "Birth_Year" varchar(255)   NOT NULL,
    CONSTRAINT "pk_hanks_survey" PRIMARY KEY (
        "Movie_Selection_1"
     )
);

CREATE TABLE "hanks_TMDB" (
    "character" varchar(255)   NOT NULL,
    "credit_id" varchar(255)   NOT NULL,
    "id" int   NOT NULL,
    "video" varchar(255)   NOT NULL,
    "vote_count" int   NOT NULL,
    "backdrop_path" varchar(255)   NOT NULL,
    "genre_ids" int   NOT NULL,
    "popularity" int   NOT NULL,
    "title" varchar(255)   NOT NULL,
    "vote_average" int   NOT NULL,
    "overview" varchar(255)   NOT NULL
);

CREATE TABLE "hanks_OMDB" (
    "Title" varchar(255)   NOT NULL,
    "Year" int   NOT NULL,
    "Rated" varchar(255)   NOT NULL,
    "Released" varchar(255)   NOT NULL,
    "Runtime" varchar(255)   NOT NULL,
    "Genre" varchar(255)   NOT NULL,
    "Director" varchar(255)   NOT NULL,
    "Writer" varchar(255)   NOT NULL,
    "Actors" varchar(255)   NOT NULL,
    "Plot" varchar(255)   NOT NULL,
    "Language" varchar(255)   NOT NULL,
    "Country" varchar(255)   NOT NULL,
    "Awards" varchar(255)   NOT NULL,
    "Ratings" varchar(255)   NOT NULL,
    "Metascore" int   NOT NULL,
    "imdbRating" int   NOT NULL,
    "imdbVotes" int   NOT NULL,
    "imdbID" varchar(255)   NOT NULL,
    "Type" varchar(255)   NOT NULL,
    "Production" varchar(255)   NOT NULL
);

ALTER TABLE "hanks_TMDB" ADD CONSTRAINT "fk_hanks_TMDB_title" FOREIGN KEY("title")
REFERENCES "hanks_survey" ("Movie_Selection_1");

ALTER TABLE "hanks_OMDB" ADD CONSTRAINT "fk_hanks_OMDB_Title" FOREIGN KEY("Title")
REFERENCES "hanks_survey" ("Movie_Selection_1");

