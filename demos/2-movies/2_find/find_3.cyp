// Find 10 people...
MATCH (people:Person)
RETURN people.name
LIMIT 10