// node activity
MATCH (v)-[e]-()
RETURN v, COUNT(DISTINCT type(e)) AS na;
