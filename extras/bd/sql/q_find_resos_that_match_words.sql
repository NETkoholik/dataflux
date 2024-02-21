-- Encontrar resoluciones cuyo título coincida con la palabra "Santiago Brizuela" en algún lugar del texto
SELECT *
	FROM t_resoluciones
	WHERE titulo LIKE '%Santiago%Brizuela%';