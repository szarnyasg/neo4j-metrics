// activity vector
MATCH (v)-[e]-()
WITH DISTINCT type(e) AS d

MATCH (v)
OPTIONAL MATCH (v)-[e]-(w)
WHERE e IS NULL OR type(e) = d

WITH DISTINCT v, d, CASE w WHEN NULL THEN 0 ELSE 1 END AS activity
RETURN v, COLLECT(activity) AS activity_vector
ORDER BY v.name
