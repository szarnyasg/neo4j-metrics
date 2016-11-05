// dimensional degree
// we omit zero values
MATCH (v)-[e]-()
RETURN
  DISTINCT type(e) AS dimension,
  v,
  COUNT(e) AS dd
ORDER BY ID(v), dimension;
