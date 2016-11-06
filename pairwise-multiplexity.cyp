// pairwise multiplexity
MATCH (v)
WITH toFloat(COUNT(DISTINCT v)) AS numberOfVertices
MATCH (v)-[e]-()
WITH DISTINCT numberOfVertices,  type(e) AS d1
MATCH (v)-[e]-()
WITH DISTINCT numberOfVertices, d1, type(e) AS d2
OPTIONAL MATCH ()-[e1]-(v)-[e2]-()
WHERE type(e1) = d1 AND type(e2) = d2
WITH DISTINCT numberOfVertices, d1, d2, v
WITH DISTINCT d1, d2, COUNT(v)/numberOfVertices AS pairwise_multiplexity
RETURN d1, d2, round(10^4 * toFloat(pairwise_multiplexity))/10^4 AS pairwise_multiplexity
ORDER BY d1, d2
