/*
SELECT DISTINCT name AS 'Cereal Name', mfr AS 'Manufacturer', type AS 'Cereal Type'
FROM Breakfast_cereals
ORDER BY name


SELECT *
FROM Breakfast_cereals
GROUP BY name, mfr, type, calories, protein, fat, sodium, fiber, carbo, sugars, potass, vitamins, shelf, weight, cups, rating
HAVING COUNT(*) > 1;



SELECT *
FROM Breakfast_cereals
WHERE name IS NULL 
   OR mfr IS NULL 
   OR calories IS NULL
   OR carbo IS NULL
   OR sugars IS NULL
   OR fiber IS NULL
   OR potass IS NULL

--1. Finding which type of Breakfast cereal (Hot or Cold) dominate the market

SELECT type,
       COUNT(*) AS cereal_count
FROM Breakfast_cereals
GROUP BY type;

--2.  Average Rating of cereals by Manufacturer
Code – 
SELECT mfr, COUNT(*) AS cereal_count, AVG(rating) AS avg_rating
FROM Breakfast_cereals
GROUP BY mfr
ORDER BY rating DESC


--3. Compare Nutrients between different brands(manufacturers)and which brand has the lowest sugar on average or the highest sodium
Code-
SELECT mfr as Brands,
       AVG(calories) AS avg_calories,
       AVG(sugars) AS avg_sugars,
	   AVG(fiber) AS avg_fiber,
       AVG(sodium) AS avg_sodium
FROM Breakfast_cereals
GROUP BY mfr
ORDER BY avg_sugars ASC;


--4. top 10 Heart healthy Cereals

SELECT name, mfr,sodium, sugars,fat
FROM Breakfast_cereals
order by sodium ASC, sugars ASC, fat ASC
LIMIT 10

--5. Measuring Healthiness of a cereal using a formula (fiber + protein) - (sugars/2.0 + fat) AS Healthy Score) ranking from the healthiest to least healthy option

SELECT name,
              mfr,
              fiber,
              protein,
              sugars,
              sodium,
              (fiber + protein) - (sugars/2.0 + sodium) AS Healthy_Score
FROM Breakfast_cereals
ORDER BY Healthy_Score DESC
LIMIT 10


7.ranking by healthy score and identify which cereals are both healthy and popular

SELECT name, 
		mfr,
		fiber,
		protein,
		sugars,
		sodium,
		rating, 
        (fiber + protein) - (sugars/2.0 + sodium) AS Healthy_Score
FROM Breakfast_cereals
ORDER BY Healthy_score DESC,rating DESC
LIMIT 20

