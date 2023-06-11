SELECT
	s.DESCRIPCION  AS INSTITUCION,
	(COUNT(*) / (SELECT COUNT(*) FROM covid.COVID19MEXICO2021 cm WHERE cm.CLASIFICACION_FINAL < 4)) * 100 AS PORCENTAJE
FROM 
	covid.COVID19MEXICO2021 cm
INNER JOIN 
	covid.Sector s  ON s.CLAVE = cm.SECTOR  
WHERE 
	cm.CLASIFICACION_FINAL < 4 /* cualquier valor menor a 4 indica que el caso fue considerado como positivo */
GROUP BY
	s.DESCRIPCION 
ORDER BY
	PORCENTAJE DESC