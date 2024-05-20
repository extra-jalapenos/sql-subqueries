WITH DC_AC_PER_PLANT AS (
	SELECT ROUND(AVG(DC_POWER),2) As AVG_DC,
	ROUND(AVG(AC_POWER),2) AS AVG_AC,
	PLANT_ID
	FROM `sql-sandbox-20240505.SolarPower.Generation_Data`
	GROUP BY PLANT_ID
)

SELECT *, ROUND(AVG_AC / AVG_DC, 3) AS INV_EFFICIENCY
FROM DC_AC_PER_PLANT
