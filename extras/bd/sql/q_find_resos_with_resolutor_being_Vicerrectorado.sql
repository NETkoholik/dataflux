-- Encontrar resoluciones cuyo órgano resolutor sea "Vicerrectorado" (unión de tabla principal con FK a tabla auxiliar con PK)
SELECT t1.numero, t1.anho, t1.titulo, t2.denominacion
	FROM t_resoluciones t1
		LEFT JOIN ta_organos_resolutores AS t2 ON t1.organo_resolutor = t2.id
	WHERE
		t2.denominacion = 'Vicerrectorado';