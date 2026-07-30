/*
===========================================================
Project : Global Video Game Industry Intelligence

Author  : Aayushi

Description:
Business analysis queries used to analyze historical
video game sales and Steam marketplace data.

Database : PostgreSQL
===========================================================
*/

/*
===========================================================
Business Question 1
Top 10 Best-Selling Video Games
===========================================================
*/

SELECT
    name,
    publisher,
    platform,
    global_sales
FROM video_game_sales
ORDER BY global_sales DESC
LIMIT 10;

/*
===========================================================
Business Question 2
Top Publishers by Global Sales
===========================================================
*/

SELECT
    publisher,
    ROUND(SUM(global_sales),2) AS total_global_sales
FROM video_game_sales
GROUP BY publisher
ORDER BY total_global_sales DESC
LIMIT 10;

/*
===========================================================
Business Question 3
Top Genres by Global Sales
===========================================================
*/

SELECT
    genre,
    ROUND(SUM(global_sales),2) AS total_sales
FROM video_game_sales
GROUP BY genre
ORDER BY total_sales DESC;

/*
===========================================================
Business Question 4
Platform Performance
===========================================================
*/

SELECT
    platform,
    COUNT(*) AS total_games,
    ROUND(SUM(global_sales),2) AS global_sales
FROM video_game_sales
GROUP BY platform
ORDER BY global_sales DESC;

/*
===========================================================
Business Question 5
Regional Sales Comparison
===========================================================
*/

SELECT
    ROUND(SUM(na_sales),2) AS north_america,
    ROUND(SUM(eu_sales),2) AS europe,
    ROUND(SUM(jp_sales),2) AS japan,
    ROUND(SUM(other_sales),2) AS other_regions
FROM video_game_sales;

/*
===========================================================
Business Question 6
Top 10 Developers by Global Sales
===========================================================
*/

SELECT
    developer,
    COUNT(*) AS total_games,
    ROUND(SUM(global_sales),2) AS total_global_sales
FROM video_game_sales
WHERE developer IS NOT NULL
GROUP BY developer
ORDER BY total_global_sales DESC
LIMIT 10;

/*
===========================================================
Business Question 7
Top Games by Critic Score
===========================================================
*/

SELECT
    name,
    platform,
    critic_score
FROM video_game_sales
WHERE critic_score IS NOT NULL
ORDER BY critic_score DESC
LIMIT 10;

/*
===========================================================
Business Question 8
Top Games by User Score
===========================================================
*/

SELECT
    name,
    platform,
    user_score
FROM video_game_sales
WHERE user_score IS NOT NULL
ORDER BY user_score DESC
LIMIT 10;

/*
===========================================================
Business Question 9
Average Global Sales by Genre
===========================================================
*/

SELECT
    genre,
    ROUND(AVG(global_sales),2) AS avg_global_sales
FROM video_game_sales
GROUP BY genre
ORDER BY avg_global_sales DESC;

/*
===========================================================
Business Question 10
Game Releases by Year
===========================================================
*/

SELECT
    year_of_release,
    COUNT(*) AS total_games
FROM video_game_sales
WHERE year_of_release IS NOT NULL
GROUP BY year_of_release
ORDER BY year_of_release;

/*
===========================================================
Business Question 11
Average Critic Score by Genre
===========================================================
*/

SELECT
    genre,
    ROUND(AVG(critic_score),2) AS avg_critic_score
FROM video_game_sales
WHERE critic_score IS NOT NULL
GROUP BY genre
ORDER BY avg_critic_score DESC;

/*
===========================================================
Business Question 12
Average User Score by Genre
===========================================================
*/

SELECT
    genre,
    ROUND(AVG(user_score),2) AS avg_user_score
FROM video_game_sales
WHERE user_score IS NOT NULL
GROUP BY genre
ORDER BY avg_user_score DESC;

/*
===========================================================
Business Question 13
Distribution of Games by ESRB Rating
===========================================================
*/

SELECT
    rating,
    COUNT(*) AS total_games
FROM video_game_sales
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_games DESC;

/*
===========================================================
Business Question 14
Top Publishers by Number of Games Released
===========================================================
*/

SELECT
    publisher,
    COUNT(*) AS total_games
FROM video_game_sales
GROUP BY publisher
ORDER BY total_games DESC
LIMIT 10;

/*
===========================================================
Business Question 15
Highly Rated Games by Critics and Users
===========================================================
*/

SELECT
    name,
    platform,
    critic_score,
    user_score,
    global_sales
FROM video_game_sales
WHERE critic_score >= 90
  AND user_score >= 9
ORDER BY global_sales DESC;


