SELECT
	r.DESCRIPCION AS INMUNOSUPRIMIDO,
	(COUNT(*) / (SELECT COUNT(*) FROM covid.COVID19MEXICO2021 cm WHERE cm.FECHA_DEF != '9999-99-99')) * 100 AS PORCENTAJE_DEF
FROM 
	covid.COVID19MEXICO2021 cm
INNER JOIN 
	covid.Respuestas r ON r.CLAVE = cm.INMUSUPR 
WHERE 
	FECHA_DEF != '9999-99-99'
GROUP BY
	r.DESCRIPCION 
ORDER BY
	r.DESCRIPCION DESC