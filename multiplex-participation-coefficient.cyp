// mpc
MATCH (v)-[e]-()
WITH
  toFloat(COUNT(e)) AS degreeTotal,
  toFloat(COUNT(DISTINCT type(e))) AS numberOfDimensions

MATCH (v)-[e]-()
WITH v, type(e) AS dimension, COUNT(e) AS dimensionalDegree, degreeTotal, numberOfDimensions
WITH v, COLLECT(dimensionalDegree) AS dimensionalDegrees, toFloat(SUM(dimensionalDegree)) AS vertexDegreeTotal, degreeTotal, numberOfDimensions
RETURN
  v,
  numberOfDimensions / (numberOfDimensions-1) *
  (1 - REDUCE(deg = 0.0, x in dimensionalDegrees | deg + (x/vertexDegreeTotal)^2)) AS mpc;
