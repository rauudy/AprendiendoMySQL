-- ! Between sirve como un filtro de rango, para filtrar los resultados de una consulta.

-- Filtrar los resultados de la columna edad entre 20 y 30
SELECT * FROM users WHERE age BETWEEN 20 AND 30

-- Filtrar los resultados de la columna edad entre 20 y 30 y el nombre sea raudy
SELECT * FROM users WHERE age BETWEEN 20 AND 30 AND name = 'raudy'

-- Filtrar los resultados de la columna edad entre 20 y 30 y el nombre sea raudy o carlos
SELECT * FROM users WHERE age BETWEEN 20 AND 30 AND name IN ('raudy', 'carlos')

-- Filtrar los resultados de la columna edad entre 20 y 30 y el nombre sea raudy o carlos y el id sea 1
SELECT * FROM users WHERE age BETWEEN 20 AND 30 AND name IN ('raudy', 'carlos') AND id = 1

-- Filtrar los resultados de la columna edad entre 20 y 30 y el nombre sea raudy o carlos y el id sea 1 o 2
SELECT * FROM users WHERE age BETWEEN 20 AND 30 AND name IN ('raudy', 'carlos') AND id IN (1, 2)

-- Filtrar los resultados de la columna edad entre 20 y 30 y el nombre sea raudy o carlos y el id sea 1 o 2 y el email sea
SELECT * FROM users WHERE age BETWEEN 20 AND 30 AND name IN ('raudy', 'carlos') AND id IN (1, 2) AND email LIKE '%@gmail.com'