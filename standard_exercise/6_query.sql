SELECT COUNT(DISTINCT source_key) AS distinct_Inverters,
PLANT_ID
FROM `sql-sandbox-20240505.SolarPower.Generation_Data`
GROUP BY PLANT_ID;
-- 22 per plant

SELECT COUNT(DISTINCT source_key) AS distinct_Inverters,
PLANT_ID
FROM `sql-sandbox-20240505.SolarPower.Weather_Sensor_Data`
GROUP BY PLANT_ID;
-- 1 per plant
