-- Query the NAME for all American cities in the CITY table with populations larger than 130,000. The CountryCode for America is USA.
SELECT Name
FROM City
WHERE CountryCode = 'USA' AND
      Id IN (SELECT CityId FROM Population WHERE Population > 130000);


-- Query the NAME for the smallest city in Canada. The CountryCode for Canada is CN.
SELECT TOP 1 Name
FROM City
WHERE CountryCode = 'CN'
ORDER BY Id;


-- Find the total population of each country, including the number of cities and the total population for each country.
SELECT CountryCode, COUNT(*) AS NumberOfCities, SUM(Population) AS TotalPopulation
FROM City
JOIN Population ON City.Id = Population.CityId
GROUP BY CountryCode;

-- Retrieve the top 3 cities with the highest population in the table, along with their respective populations.
SELECT TOP 3 Name, Population
FROM City
JOIN Population ON City.Id = Population.CityId
ORDER BY Population DESC;


-- Find the city with the highest number of cars (CarAmount) and display its name.
SELECT TOP 1 City.Name
FROM City
JOIN CarAmount ON City.Id = CarAmount.CityId
ORDER BY Amount DESC;


-- List the countries with more than 2 cities in the database.
SELECT CountryCode, COUNT(*) AS NumberOfCities
FROM City
GROUP BY CountryCode
HAVING COUNT(*) > 2;






