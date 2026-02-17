// Check 5: Death date validity (Died after Birth)
MATCH (p:Person)
WHERE p.death_date IS NOT NULL AND p.death_date < p.birth_date
RETURN p.first_name, p.last_name, p.birth_date, p.death_date, "Error: Died before birth" as Message;
