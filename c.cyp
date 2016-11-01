MATCH (v)
OPTIONAL MATCH (v)-[r1]-(a1), (v)-[q1]-(b1)
WHERE a1 <> b1 AND r1 <> q1
WITH DISTINCT v, a1, b1
WITH DISTINCT v, toFloat(COUNT(a1)) AS possible

OPTIONAL MATCH (v)-[r2]-(a2)-[]-(b2)-[q2]-(v)
WHERE a2 <> b2 AND r2 <> q2
WITH DISTINCT v, a2, b2, possible
WHERE possible <> 0
WITH DISTINCT v, COUNT(a2) AS actual, possible
RETURN v, actual/possible AS c;
