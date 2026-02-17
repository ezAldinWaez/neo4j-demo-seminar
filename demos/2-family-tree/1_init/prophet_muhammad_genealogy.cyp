// 0. Constraints
CREATE CONSTRAINT person_id_unique IF NOT EXISTS FOR (p:Person) REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT family_id_unique IF NOT EXISTS FOR (f:Family) REQUIRE f.id IS UNIQUE;

// 1. Create People and Families
CREATE

// Core ancestors
(m1:Person { id:'m1', name:'Murra', sex:'Male' }),
(m3:Person { id:'m3', name:'Yaqza', sex:'Male' }),
(m4:Person { id:'m4', name:'Kilab', sex:'Male' }),

// Yaqza line
(m6:Person { id:'m6', name:'Makhzum', sex:'Male' }),
(m8:Person { id:'m8', name:'Imran', sex:'Male' }),
(m10:Person { id:'m10', name:'Abd', sex:'Male' }),
(m11:Person { id:'m11', name:"A'ez", sex:'Male' }),
(m13:Person { id:'m13', name:'Sakhra', sex:'Male' }),
(m15:Person { id:'m15', name:'Amru', sex:'Female' }),
(m16:Person { id:'m16', name:'Fatima', sex:'Female' }),

// Kilab line
(m18:Person { id:'m18', name:'Qusai', sex:'Male' }),
(m19:Person { id:'m19', name:'Zuhra', sex:'Male' }),

// Qusai descendants
(m21:Person { id:'m21', name:'Abd Manaf', sex:'Male' }),
(m22:Person { id:'m22', name:'Abdul Uzza', sex:'Male' }),
(m23:Person { id:'m23', name:'Abd Addar', sex:'Male' }),
(m25:Person { id:'m25', name:'Hashim', sex:'Male' }),
(m26:Person { id:'m26', name:'Salma', sex:'Female' }),
(m27:Person { id:'m27', name:'Abdul Muttalib', sex:'Male' }),
(m29:Person { id:'m29', name:'Assad', sex:'Male' }),
(m31:Person { id:'m31', name:'Um Habib', sex:'Female' }),
(m33:Person { id:'m33', name:'Barra', sex:'Female' }),
(m35:Person { id:'m35', name:'Othman', sex:'Male' }),
(m37:Person { id:'m37', name:'Abdul Uzza', sex:'Male' }),
(m39:Person { id:'m39', name:'Atika', sex:'Female' }),

// Zuhra descendants
(m41:Person { id:'m41', name:'Abd Manaf', sex:'Male' }),
(m42:Person { id:'m42', name:'Wahab', sex:'Male' }),

// Final generation
(m43:Person { id:'m43', name:'Abdullah', sex:'Male' }),
(m44:Person { id:'m44', name:'Amina', sex:'Female' }),
(m45:Person { id:'m45', name:'Muhammad', sex:'Male' }),

// Families
(fm1:Family { id:'fm1' }),
(fm2:Family { id:'fm2' }),
(fm3:Family { id:'fm3' }),
(fm4:Family { id:'fm4' }),
(fm5:Family { id:'fm5' }),
(fm6:Family { id:'fm6' }),
(fm7:Family { id:'fm7' }),
(fm8:Family { id:'fm8' }),
(fm9:Family { id:'fm9' }),
(fm10:Family { id:'fm10' }),
(fm11:Family { id:'fm11' }),
(fm12:Family { id:'fm12' }),
(fm13:Family { id:'fm13' }),
(fm14:Family { id:'fm14' }),
(fm15:Family { id:'fm15' }),
(fm16:Family { id:'fm16' }),
(fm17:Family { id:'fm17' }),
(fm18:Family { id:'fm18' }),
(fm19:Family { id:'fm19' }),
(fm20:Family { id:'fm20' }),
(fm21:Family { id:'fm21' }),
(fm22:Family { id:'fm22' }),

// 2. Link Parents to Families
(m1)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm1),
(m3)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm2),
(m6)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm3),
(m8)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm4),
(m10)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm5),
(m11)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm6),
(m13)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm7), (m15)-[:SPOUSE_OF { role:'WIFE' }]->(fm7),
(m4)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm8),
(m18)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm9),
(m21)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm10),
(m25)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm11), (m26)-[:SPOUSE_OF { role:'WIFE' }]->(fm11),
(m27)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm12), (m16)-[:SPOUSE_OF { role:'WIFE' }]->(fm12),
(m43)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm13), (m44)-[:SPOUSE_OF { role:'WIFE' }]->(fm13),
(m23)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm14),
(m35)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm15),
(m37)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm16),
(m19)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm17),
(m41)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm18), (m39)-[:SPOUSE_OF { role:'WIFE' }]->(fm18),
(m22)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm19), (m28)-[:SPOUSE_OF { role:'WIFE' }]->(fm19),
(m29)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm20),
(m31)-[:SPOUSE_OF { role:'WIFE' }]->(fm21),
(m42)-[:SPOUSE_OF { role:'HUSBAND' }]->(fm22), (m33)-[:SPOUSE_OF { role:'WIFE' }]->(fm22),

// 3. Link Children to Families
(m3)-[:CHILD_OF]->(fm1), (m4)-[:CHILD_OF]->(fm1),
(m6)-[:CHILD_OF]->(fm2),
(m8)-[:CHILD_OF]->(fm3),
(m10)-[:CHILD_OF]->(fm4), (m11)-[:CHILD_OF]->(fm4),
(m13)-[:CHILD_OF]->(fm5),
(m15)-[:CHILD_OF]->(fm6),
(m16)-[:CHILD_OF]->(fm7),
(m18)-[:CHILD_OF]->(fm8), (m19)-[:CHILD_OF]->(fm8),
(m21)-[:CHILD_OF]->(fm9), (m22)-[:CHILD_OF]->(fm9), (m23)-[:CHILD_OF]->(fm9),
(m25)-[:CHILD_OF]->(fm10),
(m27)-[:CHILD_OF]->(fm11),
(m43)-[:CHILD_OF]->(fm12),
(m45)-[:CHILD_OF]->(fm13),
(m35)-[:CHILD_OF]->(fm14),
(m37)-[:CHILD_OF]->(fm15),
(m39)-[:CHILD_OF]->(fm16),
(m41)-[:CHILD_OF]->(fm17),
(m42)-[:CHILD_OF]->(fm18),
(m29)-[:CHILD_OF]->(fm19),
(m31)-[:CHILD_OF]->(fm20),
(m33)-[:CHILD_OF]->(fm21),
(m44)-[:CHILD_OF]->(fm22);

// Source: https://en.wikipedia.org/wiki/Genealogy_of_Muhammad
