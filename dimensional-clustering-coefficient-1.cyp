// dimensional clustering coefficient 1
MATCH (v)
OPTIONAL MATCH (v)-[r1]-(a1), (v)-[q1]-(b1)
WHERE a1 <> b1 AND type(r1) = type(q1)
WITH DISTINCT v, a1, b1
WITH DISTINCT v, toFloat(COUNT(a1)) AS possible
WHERE possible <> 0

OPTIONAL MATCH (v)-[r2]-(a2)-[s2]-(b2)-[q2]-(v)
WHERE a2 <> b2 AND type(r2) = type(q2) AND type(r2) <> type(s2)
WITH DISTINCT v, a2, b2, possible
WITH DISTINCT v, COUNT(a2) AS actual, possible
RETURN v, actual/possible AS dc1;
