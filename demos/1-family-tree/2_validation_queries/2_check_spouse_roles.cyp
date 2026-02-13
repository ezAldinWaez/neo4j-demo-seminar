// Check 2: Families missing HUSBAND or WIFE roles
MATCH (f:Family)
OPTIONAL MATCH (h:Person)-[:SPOUSE_OF {role:'HUSBAND'}]->(f)
OPTIONAL MATCH (w:Person)-[:SPOUSE_OF {role:'WIFE'}]->(f)
WITH f, h, w
WHERE h IS NULL OR w IS NULL
RETURN f.id as FamilyID, 
       CASE WHEN h IS NULL THEN 'Missing Husband' ELSE 'Has Husband' END as HusbandStatus,
       CASE WHEN w IS NULL THEN 'Missing Wife' ELSE 'Has Wife' END as WifeStatus;
