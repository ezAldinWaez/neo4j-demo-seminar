// Delete all nodes and relationships
MATCH (n) DETACH DELETE n;

// Drop constraints
DROP CONSTRAINT person_id_unique IF EXISTS;

DROP CONSTRAINT family_id_unique IF EXISTS;
