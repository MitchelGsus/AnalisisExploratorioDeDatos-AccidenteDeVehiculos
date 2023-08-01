CREATE DATABASE vhac
GO
USE vhac
GO
SELECT * FROM accidente
SELECT * FROM vehiculo

--Pregunta 1: ¿Cuántos accidentes han ocurrido en áreas urbanas versus áreas rurales?
SELECT DISTINCT Area FROM accidente
SELECT AREA, COUNT(AREA) AS TOTAL FROM  accidente GROUP BY Area

--Pregunta 2: ¿Qué día de la semana tiene el mayor número de accidentes?
SELECT * FROM accidente
SELECT TOP 3 Dia, COUNT(Dia) AS TOTAL FROM accidente GROUP BY Dia ORDER BY Dia

--Pregunta 3: ¿Cuál es la edad promedio de los vehículos involucrados en accidentes según su tipo?

SELECT * FROM vehiculo
SELECT * FROM accidente

SELECT AVG(EdadVehiculo) PromedioEdad FROM vehiculo

SELECT TipoVehiculo, COUNT(AccidenteIndex) AS TotalAccidente, AVG(EdadVehiculo) AS EdadPromVehiculo FROM vehiculo
GROUP BY TipoVehiculo ORDER BY TotalAccidente DESC

SELECT COUNT(AccidenteIndex) FROM vehiculo GROUP BY AccidenteIndex

SELECT COUNT(*) FROM vehiculo

SELECT SUM(Contador) AS Total
FROM (
    SELECT COUNT(AccidenteIndex) AS Contador
    FROM vehiculo
    GROUP BY AccidenteIndex
) AS Resultados;

--Pregunta 4: identificar alguna tendencia en los accidentes según la edad de los vehículos involucrados


SELECT COUNT(*) AS Nulos FROM vehiculo WHERE EdadVehiculo is null


SELECT EdadGrupo, COUNT(EdadGrupo) AS EdadCount, AVG(EdadVehiculo) AS PromedioEdad FROM(
SELECT EdadVehiculo,
	CASE
	WHEN EdadVehiculo BETWEEN 0 AND 5 THEN 'nuevo'
	WHEN EdadVehiculo BETWEEN 6 and 10 THEN 'regular'
	ELSE 'viejo'
	END AS EdadGrupo
FROM vehiculo WHERE EdadVehiculo is not null) AS SubQuery
GROUP BY EdadGrupo

--Pregunta 5: ¿Existen condiciones climáticas específicas que contribuyan a accidentes fatales?

SELECT * FROM accidente

SELECT DISTINCT Gravedad FROM accidente

SELECT Condiciones_climaticas , COUNT(Gravedad) 'Accidentes_Totales'
FROM accidente WHERE Gravedad = 'Fatal' GROUP BY Condiciones_climaticas ORDER BY Accidentes_Totales DESC

--Pregunta 6: ¿Los accidentes suelen implicar impactos en el lado izquierdo de los vehículos?

SELECT * FROM vehiculo

SELECT ManoIzquierda, COUNT(ManoIzquierda) AS Accidentes_Totales FROM vehiculo
WHERE ManoIzquierda is not null GROUP BY ManoIzquierda 


--Pregunta 7: ¿Existe alguna relación entre los propósitos del viaje y la gravedad de los accidentes?
SELECT * FROM vehiculo

SELECT * FROM accidente

SELECT v.PropositoViaje, a.Gravedad FROM vehiculo v JOIN accidente a ON v.AccidenteIndex = a.AccidenteIndex

SELECT v.PropositoViaje, COUNT(a.Gravedad) AS TotalGravedad,
CASE
	WHEN COUNT(a.Gravedad) BETWEEN 0 AND 1000 THEN 'Bajo'
	WHEN COUNT(a.Gravedad) BETWEEN 1001 AND 3000 THEN 'Moderado'
	ELSE 'Alto'
END AS 'Nivel'
FROM vehiculo v JOIN accidente a ON v.AccidenteIndex = a.AccidenteIndex
GROUP BY v.PropositoViaje
ORDER BY TotalGravedad DESC

--Pregunta 8: Calcular la antigüedad promedio de los vehículos involucrados en accidentes, considerando Luz diurna y punto de impacto Frontal:

USE vhac

SELECT * FROM vehiculo
SELECT * FROM accidente

SELECT a.Condiciones_de_luz, v.PuntoImpacto, CAST(AVG(v.EdadVehiculo) AS int) AS Promedio_Años
FROM vehiculo v JOIN accidente a ON v.AccidenteIndex = a.AccidenteIndex
--WHERE a.Condiciones_de_luz = 'Luz'
GROUP BY a.Condiciones_de_luz, v.PuntoImpacto
HAVING a.Condiciones_de_luz  = 'Luz' AND v.PuntoImpacto = 'Frontal'

--Pregunta 9: Calcular el Porcentaje de Gravedad
SELECT * FROM accidente
SELECT COUNT(*) FROM accidente

SELECT COUNT(Gravedad) FROM accidente

SELECT COUNT(Gravedad) AS TotalGravedad FROM accidente GROUP BY Gravedad
-- Sí
SELECT Gravedad,
COUNT(Gravedad) AS GravedadTotal,
(COUNT(Gravedad) * 100 / (SELECT COUNT(*) FROM accidente)) AS Porcentaje
FROM accidente GROUP BY Gravedad 

SELECT Gravedad,
COUNT(Gravedad) AS GravedadTotal,
ROUND(COUNT(Gravedad) / CAST((SELECT COUNT(*) FROM accidente) AS float) *100, 2) AS Porcentaje
FROM accidente GROUP BY Gravedad 


--Pregunta 10: Contar el número total de accidentes agrupados por la gravedad y las condiciones del camino
SELECT Gravedad, Condiciones_del_camino, COUNT(Condiciones_del_camino) AS Total
FROM accidente GROUP BY Gravedad, Condiciones_del_camino ORDER BY Total DESC


--Pregunta 10: Contar el número total de accidentes agrupados por propósito de viaje y gravedad de accidentes?
SELECT v.PropositoViaje, a.Gravedad, COUNT(a.Gravedad) AS Total
FROM vehiculo v JOIN accidente a ON v.AccidenteIndex = a.AccidenteIndex
GROUP BY v.PropositoViaje, a.Gravedad ORDER BY 1 DESC;
