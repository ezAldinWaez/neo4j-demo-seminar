// Count the total number of members in each family
MATCH (f:Family)
OPTIONAL MATCH (p:Person)-[:CHILD_OF]->(f)
OPTIONAL MATCH (s:Person)-[:SPOUSE_OF]->(f)
WITH f, count(DISTINCT p) + count(DISTINCT s) AS total_members, count(DISTINCT p) AS children_count
RETURN f.id AS FamilyID, total_members, children_count
ORDER BY total_members DESC;
