// Count the total number of members in each family
MATCH (p:Person)-[:CHILD_OF]->(f:Family)<-[:SPOUSE_OF](s:Person)
WITH f, count(DISTINCT p) + count(DISTINCT s) AS total_members, count(DISTINCT p) AS children_count
RETURN f.id AS FamilyID, total_members, children_count
ORDER BY total_members DESC;
