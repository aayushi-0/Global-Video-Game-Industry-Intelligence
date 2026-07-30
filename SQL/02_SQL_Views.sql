/*
===========================================================
Project : Global Video Game Industry Intelligence

Author  : Aayushi

Description:
Creates the SQL view used to combine historical video game
sales data with Steam marketplace data for business analysis
and Power BI dashboard development.

Database : PostgreSQL
===========================================================
*/

CREATE OR REPLACE VIEW vw_game_analysis_matched AS

WITH game_sales AS (

    SELECT
        name,
        publisher,
        genre,
        developer,
        SUM(global_sales) AS total_global_sales,
        SUM(na_sales) AS na_sales,
        SUM(eu_sales) AS eu_sales,
        SUM(jp_sales) AS jp_sales,
        SUM(other_sales) AS other_sales

    FROM video_game_sales

    GROUP BY
        name,
        publisher,
        genre,
        developer

)

SELECT

    gs.name,
    gs.publisher,
    gs.genre,
    gs.developer,

    gs.total_global_sales,
    gs.na_sales,
    gs.eu_sales,
    gs.jp_sales,
    gs.other_sales,

    s.discounted_price,
    s.original_price,
    s.discount_percentage,

    s.all_review_percentage,
    s.all_review_count,

    s.recent_review_percentage,
    s.recent_review_count,

    s.is_free,
    s.release_year,

    CASE
        WHEN s.all_review_percentage >= 90 THEN 'Excellent'
        WHEN s.all_review_percentage >= 80 THEN 'Very Good'
        WHEN s.all_review_percentage >= 70 THEN 'Good'
        ELSE 'Average'
    END AS review_category

FROM game_sales gs

INNER JOIN steam_games s
ON LOWER(gs.name) = LOWER(s.title);

