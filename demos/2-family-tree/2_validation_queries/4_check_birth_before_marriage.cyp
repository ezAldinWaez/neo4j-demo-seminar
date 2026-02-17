// Check 4: Birth date validity (Born before Marriage)
MATCH (p:Person)-[:SPOUSE_OF]->(f:Family)
WHERE p.birth_date > f.marriage_date
RETURN p.first_name, p.last_name, p.birth_date, f.marriage_date, "Error: Born after marriage" as Message;
