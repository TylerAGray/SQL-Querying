-- FURTHER STUDY 

-- FS1. Find the name, rating, and category of the top-rated apps in each category,
-- among apps that have been installed at least 50,000 times.
-- This query retrieves the name, rating, and category of the highest-rated apps in each category,
-- where the apps have been installed at least 50,000 times.
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

-- FS2. Find all the apps that have a name similar to "facebook".
-- This query retrieves all app records where the app name contains "facebook",
-- using a case-insensitive pattern match.
SELECT * FROM analytics 
  WHERE app_name ILIKE '%facebook%';

-- FS3. Find all the apps that have more than one genre.
-- This query retrieves all app records where the app has exactly two genres listed.
SELECT * FROM analytics 
  WHERE  array_length(genres, 1) = 2;

-- FS4. Find all the apps that have "Education" as one of their genres.
-- This query retrieves all app records where the genres array includes "Education".
SELECT * FROM analytics 
  WHERE genres @> '{"Education"}';
