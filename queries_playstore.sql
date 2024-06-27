-- Query 0: Retrieve all records from the 'analytics' table
SELECT * FROM analytics;

-- 1. Find the entire record for the app with an ID of `1880`.
-- This query retrieves all columns for the app with the specific ID.
SELECT * FROM analytics 
  WHERE id = 1880;

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
-- This query retrieves the IDs and names of apps that have a specific last updated date.
SELECT id, app_name FROM analytics
   WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category.
-- This query groups the apps by category and counts the number of apps in each category.
SELECT category, COUNT(*) FROM analytics 
  GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
-- This query retrieves the records of the top 5 apps with the most reviews.
SELECT * FROM analytics 
  ORDER BY reviews DESC 
  LIMIT 5;

-- 5. Find the full record of the app that has the most reviews with a rating greater than or equal to 4.8.
-- This query retrieves the record of the highest reviewed app with a rating of at least 4.8.
SELECT * FROM analytics 
  WHERE rating >= 4.8 
  ORDER BY reviews DESC
  LIMIT 1;

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
-- This query groups the apps by category and calculates the average rating for each category, then orders by the average rating.
SELECT category, AVG(rating) FROM analytics 
  GROUP BY category 
  ORDER BY AVG(rating) DESC;

-- 7. Find the name, price, and rating of the most expensive app with a rating that's less than 3.
-- This query retrieves the name, price, and rating of the most expensive app that has a rating below 3.
SELECT app_name, price, rating FROM analytics 
  WHERE rating < 3 
  ORDER BY price DESC 
  LIMIT 1;

-- 8. Find all records with a minimum install count not exceeding 50, that have a rating.
-- This query retrieves records where the minimum installs are 50 or fewer and the rating is not null, ordered by rating.
SELECT * FROM analytics 
  WHERE min_installs <= 50 
    AND rating IS NOT NULL 
  ORDER BY rating DESC;

-- 9. Find the names of all apps that are rated less than 3 with at least 10,000 reviews.
-- This query retrieves the names of apps with a rating below 3 and at least 10,000 reviews.
SELECT app_name FROM analytics
  WHERE rating < 3 AND reviews >= 10000;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
-- This query retrieves the top 10 most-reviewed apps that have a price between $0.10 and $1.00.
SELECT * FROM analytics
  WHERE price BETWEEN 0.1 AND 1 
  ORDER BY reviews DESC 
  LIMIT 10;

-- 11. Find the most out-of-date app.
-- Option 1: Using a subquery
-- This query finds the record of the app that has the earliest last updated date using a subquery.
SELECT * FROM analytics 
  WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Option 2: Without a subquery
-- This query directly orders the apps by the last updated date and limits the result to the first one.
SELECT * FROM analytics
  ORDER BY last_updated 
  LIMIT 1;

-- 12. Find the most expensive app.
-- Option 1: Using a subquery
-- This query finds the record of the app that has the highest price using a subquery.
SELECT * FROM analytics 
  WHERE price = (SELECT MAX(price) FROM analytics);

-- Option 2: Without a subquery
-- This query directly orders the apps by price in descending order and limits the result to the first one.
SELECT * FROM analytics
  ORDER BY price DESC 
  LIMIT 1;

-- 13. Count all the reviews in the Google Play Store.
-- This query calculates the sum of all reviews from the 'analytics' table.
SELECT SUM(reviews) AS "All the Reviews" FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
-- This query groups the apps by category and filters for categories with more than 300 apps.
SELECT category FROM analytics 
  GROUP BY category 
  HAVING COUNT(*) > 300;

-- 15. Find the app that has the highest proportion of reviews to min_installs, among apps that have been installed at least 100,000 times.
-- Display the name of the app along with the number of reviews, the min_installs, and the proportion.
-- This query calculates the proportion of reviews to min_installs for apps with at least 100,000 installs and orders by the highest proportion.
SELECT app_name, reviews, min_installs, reviews / min_installs AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;

