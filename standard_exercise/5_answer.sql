-- 5. What can you say about the hourly distribution of power generated? Why are there zeros in the resulting table?
-- solar plants like full solar radiation mostly when they're not hot/ air is not hot yet, which explains why the midday hours aren't the most efficient

-- I also don't have zeroes in my table? see:
SELECT AC_POWER, DC_POWER,
	EXTRACT(HOUR FROM DATE_TIME) AS UTC_HOUR
	FROM `sql-sandbox-20240505.SolarPower.Generation_Data`
	WHERE PLANT_ID = 4136001 AND (DC_POWER = 0 OR AC_POWER = 0)
	ORDER BY UTC_HOUR DESC;

SELECT extract(hour from DATE_TIME) as hour_of_day,
 avg(DC_POWER) as avg_dc_power,
 avg(AC_POWER) as avg_ac_power,
 round(avg(case when AC_POWER <> 0 then AC_POWER end)/avg(case when DC_POWER <> 0 then DC_POWER end)*100, 2) as pct_inverter_efficiency
FROM `sql-sandbox-20240505.SolarPower.Generation_Data`
WHERE plant_id = 4136001
GROUP BY hour_of_day
ORDER BY pct_inverter_efficiency DESC


