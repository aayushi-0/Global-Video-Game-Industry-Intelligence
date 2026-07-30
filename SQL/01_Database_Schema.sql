/*
===========================================================
Project : Global Video Game Industry Intelligence

Author  : Aayushi

Description:
Creates the database schema for the Global Video Game
Industry Intelligence project.

The schema consists of:
1. Historical Video Game Sales dataset
2. Steam Games dataset

Database : PostgreSQL
===========================================================
*/

-- =========================================================
-- Drop Existing Tables (Optional)
-- =========================================================

DROP TABLE IF EXISTS steam_games;
DROP TABLE IF EXISTS video_game_sales;

-- =========================================================
-- Table: video_game_sales
-- Historical Video Game Sales Dataset
-- =========================================================

CREATE TABLE video_game_sales (

    name TEXT,
    platform TEXT,
    year_of_release INTEGER,
    genre TEXT,
    publisher TEXT,

    na_sales NUMERIC,
    eu_sales NUMERIC,
    jp_sales NUMERIC,
    other_sales NUMERIC,
    global_sales NUMERIC,

    critic_score NUMERIC,
    critic_count INTEGER,

    user_score NUMERIC,
    user_count INTEGER,

    developer TEXT,
    rating TEXT

);

-- =========================================================
-- Table: steam_games
-- Steam Marketplace Dataset
-- =========================================================

CREATE TABLE steam_games (

    title TEXT,

    original_price NUMERIC,
    discounted_price NUMERIC,

    release_date DATE,
    release_year INTEGER,
    release_month TEXT,
    release_month_number INTEGER,
    release_status TEXT,

    link TEXT,

    game_description TEXT,

    developer TEXT,
    publisher TEXT,

    supported_languages TEXT,
    popular_tags TEXT,
    game_features TEXT,
    minimum_requirements TEXT,

    discount_percentage NUMERIC,
    is_free BOOLEAN,

    recent_reviews_summary TEXT,
    recent_review_percentage NUMERIC,
    recent_review_count INTEGER,

    all_reviews_summary TEXT,
    all_review_percentage NUMERIC,
    all_review_count INTEGER

);