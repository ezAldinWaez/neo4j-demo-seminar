// Check 1: Families with incorrect number of spouses (should be exactly 2)
MATCH (f:Family)
OPTIONAL MATCH (p:Person)-[r:SPOUSE_OF]->(f)
with f, count(r) as spouse_count
WHERE spouse_count <> 2
RETURN f.id as FamilyID, spouse_count as Spouses, "Error: Family must have exactly 2 spouses" as Message;
