// Find all surviving spouses (Widows/Widowers)
MATCH (p:Person)-[r:SPOUSE_OF]->(f:Family {status: 'WIDOWED'})
WITH f, collect(p) as spouses
UNWIND spouses as s
WITH s, f
WHERE s.death_date IS NULL
RETURN s.first_name, s.last_name, s.sex, f.id as FamilyID;
