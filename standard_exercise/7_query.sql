WITH WEATHER_INVERTER AS (
	SELECT source_key AS source_key
	FROM `sql-sandbox-20240505.SolarPower.Weather_Sensor_Data` AS WEATHER
	GROUP BY source_key
)

SELECT GEN.source_key, WEATHER_INVERTER.source_key
FROM `sql-sandbox-20240505.SolarPower.Generation_Data` AS GEN
INNER JOIN WEATHER_INVERTER ON GEN.source_key=WEATHER_INVERTER.source_key
