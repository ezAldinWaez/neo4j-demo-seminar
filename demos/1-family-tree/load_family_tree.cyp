// 0. Constraints
CREATE CONSTRAINT person_id_unique IF NOT EXISTS FOR (p:Person) REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT family_id_unique IF NOT EXISTS FOR (f:Family ) REQUIRE f.id IS UNIQUE;

// 1. Create People
CREATE
// Generation 1
(a1:Person { id:'p1', first_name:'Alexander', last_name:'Cruz', sex:'Male', birth_date:date('1918-01-01'), death_date:date('2003-01-01'), education:'High School Diploma', works:'Retired Navy' }),
(a2:Person { id:'p2', first_name:'Jerry', last_name:'Willow', sex:'Female', birth_date:date('1920-01-01'), death_date:date('1989-01-01'), education:'Nursing School', works:'Nurse' }),

// Generation 2
(a3:Person { id:'p3', first_name:'Jake', last_name:'Cruz', sex:'Male', birth_date:date('1945-01-01'), death_date:date('2022-01-01'), education:'PhD Physics', works:'Professor' }),
(a4:Person { id:'p4', first_name:'Taylor', last_name:'Humes', sex:'Female', birth_date:date('1955-01-01'), education:'Masters in Arts', works:'Curator' }),
(a5:Person { id:'p5', first_name:'Olivia', last_name:'Cruz', sex:'Female', birth_date:date('1960-01-01'), education:'MBA', works:'CEO Tech Corp' }),
(a6:Person { id:'p6', first_name:'Arjun', last_name:'Patel', sex:'Male', birth_date:date('1962-01-01'), education:'BSc Comp Sci', works:'CTO' }),
(a7:Person { id:'p7', first_name:'Timothy', last_name:'Cruz', sex:'Male', birth_date:date('1940-01-01'), death_date:date('2020-01-01'), education:'BArch', works:'Architect' }),
(a8:Person { id:'p8', first_name:'Emma', last_name:'Young', sex:'Female', birth_date:date('1950-01-01'), education:'Music Conservatory', works:'Violinist' }),

// Generation 3
(a9:Person { id:'p9', first_name:'Christina', last_name:'Cruz', sex:'Female', birth_date:date('1978-01-01'), education:'MD', works:'Surgeon' }),
(a10:Person { id:'p10', first_name:'Timothy', last_name:'Young', sex:'Male', birth_date:date('1970-01-01'), education:'MBA', works:'Banker' }),
(a11:Person { id:'p11', first_name:'Cullen', last_name:'Cruz', sex:'Male', birth_date:date('1975-01-01'), education:'BFA', works:'Artist' }),
(a12:Person { id:'p12', first_name:'Marie', last_name:'Cruz', sex:'Female', birth_date:date('1973-01-01'), death_date:date('2018-01-01'), education:'Law School', works:'Lawyer' }),
(a13:Person { id:'p13', first_name:'Sammie', last_name:'Chang', sex:'Female', birth_date:date('1985-01-01'), education:'PhD Chem', works:'Researcher' }),
(a14:Person { id:'p14', first_name:'Steve', last_name:'Cruz', sex:'Male', birth_date:date('1985-01-01'), education:'MSc Eng', works:'Engineer' }),
(a15:Person { id:'p15', first_name:'Arham', last_name:'Chopra', sex:'Male', birth_date:date('1983-01-01'), education:'BA History', works:'Writer' }),
(a16:Person { id:'p16', first_name:'Maria', last_name:'Young', sex:'Female', birth_date:date('1988-01-01'), education:'BSc Bio', works:'Lab Tech' }),
(a17:Person { id:'p17', first_name:'Marvin', last_name:'Young', sex:'Male', birth_date:date('1970-01-01'), education:'High School', works:'Mechanic' }),
(a18:Person { id:'p18', first_name:'Jazmine', last_name:'Brooke', sex:'Female', birth_date:date('1975-01-01'), education:'College', works:'Chef' }),

// Generation 4
(a19:Person { id:'p19', first_name:'Carrie', last_name:'Young', sex:'Female', birth_date:date('2001-01-01'), education:'High School', works:'Student' }),
(a20:Person { id:'p20', first_name:'Carlo', last_name:'Young', sex:'Male', birth_date:date('2003-01-01'), education:'High School', works:'Student' }),
(a21:Person { id:'p21', first_name:'Tay', last_name:'Young', sex:'Male', birth_date:date('2005-01-01'), education:'Middle School', works:'Student' }),
(a22:Person { id:'p22', first_name:'William', last_name:'Cruz', sex:'Male', birth_date:date('2002-01-01'), education:'High School', works:'Student' }),
(a23:Person { id:'p23', first_name:'Anna', last_name:'Cruz', sex:'Female', birth_date:date('2012-01-01'), education:'Elementary School', works:'Student' }),
(a24:Person { id:'p24', first_name:'Taylor', last_name:'Cruz', sex:'Female', birth_date:date('2009-01-01'), education:'Elementary School', works:'Student' }),
(a25:Person { id:'p25', first_name:'Amelia', last_name:'Young', sex:'Female', birth_date:date('2001-01-01'), education:'High School', works:'Student' }),
(a26:Person { id:'p26', first_name:'Jake', last_name:'Young', sex:'Male', birth_date:date('2002-01-01'), education:'High School', works:'Student' }),
(a27:Person { id:'p27', first_name:'Timothy', last_name:'Young', sex:'Male', birth_date:date('2010-01-01'), education:'Elementary School', works:'Student' }),

// 2. Create Families (Family Units)
(f1:Family { id:'f1', marriage_date:date('1943-06-15'), status:'WIDOWED' }),
(f2:Family { id:'f2', marriage_date:date('1974-05-20'), status:'WIDOWED' }),
(f3:Family { id:'f3', marriage_date:date('1984-08-12'), status:'ACTIVE' }),
(f4:Family { id:'f4', marriage_date:date('1969-11-05'), status:'WIDOWED' }),
(f5:Family { id:'f5', marriage_date:date('1999-09-09'), status:'ACTIVE' }),
(f6:Family { id:'f6', marriage_date:date('2002-06-01'), divorce_date:date('2009-01-01'), status:'DIVORCED' }),
(f7:Family { id:'f7', marriage_date:date('2010-07-20'), status:'ACTIVE' }),
(f8:Family { id:'f8', marriage_date:date('1998-03-15'), status:'ACTIVE' }),

// 3. Link Parents to Families
(a1)-[:SPOUSE_OF { role: "HUSBAND" }]->(f1), (a2)-[:SPOUSE_OF {role: "WIFE"}]->(f1),
(a3)-[:SPOUSE_OF { role: "HUSBAND" }]->(f2), (a4)-[:SPOUSE_OF {role: "WIFE"}]->(f2),
(a6)-[:SPOUSE_OF { role: "HUSBAND" }]->(f3), (a5)-[:SPOUSE_OF {role: "WIFE"}]->(f3),
(a7)-[:SPOUSE_OF { role: "HUSBAND" }]->(f4), (a8)-[:SPOUSE_OF {role: "WIFE"}]->(f4),
(a10)-[:SPOUSE_OF { role: "HUSBAND" }]->(f5), (a9)-[:SPOUSE_OF {role: "WIFE"}]->(f5),
(a14)-[:SPOUSE_OF { role: "HUSBAND" }]->(f6), (a13)-[:SPOUSE_OF {role: "WIFE"}]->(f6),
(a14)-[:SPOUSE_OF { role: "HUSBAND" }]->(f7), (a15)-[:SPOUSE_OF {role: "WIFE"}]->(f7),
(a17)-[:SPOUSE_OF { role: "HUSBAND" }]->(f8), (a18)-[:SPOUSE_OF {role: "WIFE"}]->(f8),

// 4. Link Children to Families
(a3)-[:CHILD_OF]->(f1), (a5)-[:CHILD_OF]->(f1), (a7)-[:CHILD_OF]->(f1),
(a9)-[:CHILD_OF]->(f2), (a11)-[:CHILD_OF]->(f2), (a12)-[:CHILD_OF]->(f2),
(a14)-[:CHILD_OF]->(f3),
(a16)-[:CHILD_OF]->(f4), (a17)-[:CHILD_OF]->(f4),
(a19)-[:CHILD_OF]->(f5), (a20)-[:CHILD_OF]->(f5), (a21)-[:CHILD_OF]->(f5),
(a22)-[:CHILD_OF]->(f6),
(a23)-[:CHILD_OF]->(f7), (a24)-[:CHILD_OF]->(f7),
(a25)-[:CHILD_OF]->(f8), (a26)-[:CHILD_OF]->(f8), (a27)-[:CHILD_OF]->(f8);
