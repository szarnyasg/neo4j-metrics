// nda, ndc, eda, edc
MATCH (v)
OPTIONAL MATCH (v)-[e]-()
WITH
  toFloat(COUNT(DISTINCT v)) AS numberOfVertices,
  toFloat(COUNT(DISTINCT e)) AS numberOfEdges

MATCH (v)-[e]-()
RETURN
  DISTINCT type(e) AS dimension,
  COUNT(DISTINCT v) AS nda,
  COUNT(DISTINCT v)/numberOfVertices AS ndc,
  COUNT(DISTINCT e) AS eda,
  COUNT(DISTINCT e)/numberOfEdges AS edc

ORDER BY dimension;
