-- Encontrar todas las resoluciones del año 2023, del 1 de enero al 31 de diciembre
SELECT numero, titulo, organo_resolutor
	FROM t_resoluciones
	WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';