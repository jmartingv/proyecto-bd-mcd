SELECT 
	COUNT(*) AS Defunciones_Totales
FROM
	covid.COVID19MEXICO2021 cm 
WHERE 
	cm.FECHA_DEF != '9999-99-99'