// Check 3: Gender consistency (Husbands should be Male, Wives should be Female)
MATCH (p:Person)-[r:SPOUSE_OF]->(f:Family)
WHERE (r.role = 'HUSBAND' AND p.sex <> 'Male') OR (r.role = 'WIFE' AND p.sex <> 'Female')
RETURN p.first_name, p.last_name, p.sex, r.role, f.id, "Error: Spouse gender mismatch" as Message;
