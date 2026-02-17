// Find all surviving spouses (Widows/Widowers)
MATCH (s:Person)-[r:SPOUSE_OF]->(f:Family {status: 'WIDOWED'})
WITH f, s
WHERE s.death_date IS NULL
RETURN s.first_name, s.last_name, s.sex, f.id as FamilyID;
