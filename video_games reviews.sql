CREATE DATABASE videogames_db;
USE videogames_db;
CREATE TABLE IF NOT EXISTS video_game_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_title VARCHAR(255),
    platform VARCHAR(100),
    release_date DATE,
    price DECIMAL(10,2),
    genre VARCHAR(100),
    game_mode VARCHAR(50),
    user_rating DECIMAL(3,1),
    age_group VARCHAR(50),
    review_text TEXT
);

-- 1. Total number of games
SELECT COUNT(*) AS total_games FROM video_game_reviews;

-- 2. Unique platforms
SELECT DISTINCT platform FROM video_game_reviews;

-- 3. Count by platform
SELECT platform, COUNT(*) AS total_games FROM video_game_reviews GROUP BY platform;

-- 4. Count by genre
SELECT genre, COUNT(*) AS total FROM video_game_reviews GROUP BY genre ORDER BY total DESC;

-- 5. Average user rating
SELECT ROUND(AVG(user_rating), 2) AS avg_rating FROM video_game_reviews;

-- 6. Top 10 highest-rated games
SELECT game_title, user_rating FROM video_game_reviews ORDER BY user_rating DESC LIMIT 10;

-- 7. Lowest-rated games
SELECT game_title, user_rating FROM video_game_reviews ORDER BY user_rating ASC LIMIT 10;

-- 8. Average rating by platform
SELECT platform, ROUND(AVG(user_rating), 2) AS avg_rating FROM video_game_reviews GROUP BY platform;

-- 9. Average rating by genre
SELECT genre, ROUND(AVG(user_rating), 2) AS avg_rating FROM video_game_reviews GROUP BY genre;

-- 10. Average price by genre
SELECT genre, ROUND(AVG(price), 2) AS avg_price FROM video_game_reviews GROUP BY genre;

-- 11. Games priced over $50 with rating over 8
SELECT game_title, price, user_rating FROM video_game_reviews WHERE price > 50 AND user_rating > 8;

-- 12. Free games (price = 0)
SELECT game_title, user_rating FROM video_game_reviews WHERE price = 51.73;

-- 13. Games suitable for kids
SELECT game_title, age_group FROM video_game_reviews WHERE age_group = 'Kids';

-- 14. Offline games with rating > 9
SELECT game_title, user_rating FROM video_game_reviews WHERE game_mode = 'Offline' AND user_rating > 35.0;

-- 15. Games released in the last 5 years
SELECT game_title, release_date FROM video_game_reviews WHERE release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- 16. Total games by age group
SELECT age_group, COUNT(*) AS total FROM video_game_reviews GROUP BY age_group;

-- 17. Average rating by game mode
SELECT game_mode, ROUND(AVG(user_rating), 2) AS avg_rating FROM video_game_reviews GROUP BY game_mode;

-- 18. Number of games per release year
SELECT YEAR(release_date) AS year, COUNT(*) AS total FROM video_game_reviews GROUP BY year ORDER BY year;

-- 19. Games with long reviews (more than 100 characters)
SELECT game_title, LENGTH(review_text) AS review_length FROM video_game_reviews WHERE LENGTH(review_text) > 30;

-- 20. Games where review mentions 'amazing'
SELECT game_title, review_text FROM video_game_reviews WHERE review_text LIKE '%amazing%';

-- 21. Categorize games by rating tier
SELECT 
  game_title,
  user_rating,
  CASE 
    WHEN user_rating >= 45 THEN 'Top Rated'
    WHEN user_rating >= 30 THEN 'Mid Tier'
    ELSE 'Low Rated'
  END AS rating_category
FROM video_game_reviews;

-- 22. Count of games in each rating tier
SELECT 
  CASE 
    WHEN user_rating >= 45 THEN 'Top Rated'
    WHEN user_rating >= 30 THEN 'Mid Tier'
    ELSE 'Low Rated'
  END AS rating_category,
  COUNT(*) AS total
FROM video_game_reviews
GROUP BY rating_category;

-- 23. Average price by age group
SELECT age_group, ROUND(AVG(price), 2) AS avg_price FROM video_game_reviews GROUP BY age_group;

-- 24. Most expensive games
SELECT game_title, price FROM video_game_reviews ORDER BY price DESC LIMIT 10;

-- 25. Games with both high price and high rating
SELECT game_title, price, user_rating FROM video_game_reviews WHERE price > 50 AND user_rating > 35;









