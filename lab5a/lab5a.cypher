//Your Neo4j code goes here
CREATE (Miles:Person {name:'Miles Hosen', born:1991})
CREATE (Nikki:Person {name:'Nikki Davis', born:1989})
CREATE (Hallie:Person {name:'Hallie Knudsen', born:2010})
CREATE (Melody:Person {name:'Melody Parks', born:1965})
CREATE (Mitch:Person {name:'Mitch Hosen', born:1958})
CREATE (Michelle:Person {name:'Michelle Powell', born:1996})
CREATE (Richard:Person {name:'Richard Powell', born:1997})
CREATE (Andy:Person {name:'Andy Davis', born:1987})
CREATE
  (Miles)-[:SPOUSE {married:[2012]}]->(Nikki),
  (Nikki)-[:SPOUSE {married:[2012]}]->(Miles),
  (Hallie)-[:CHILD {type:['daughter']}]->(Nikki),
  (Hallie)-[:CHILD {type:['daughter']}]->(Miles),
  (Nikki)-[:PARENT {type:['mother']}]->(Hallie),
  (Miles)-[:PARENT {type:['father']}]->(Hallie),
  (Miles)-[:CHILD {type:['son']}]->(Melody),
  (Melody)-[:PARENT {type:['mother']}]->(Miles),
  (Melody)-[:PARENT {type:['mother']}]->(Michelle),
  (Mitch)-[:PARENT {type:['father']}]->(Miles),
  (Mitch)-[:PARENT {type:['father']}]->(Michelle),
  (Michelle)-[:SPOUSE {married:[2020]}]->(Richard),
  (Richard)-[:SPOUSE {married:[2020]}]->(Michelle),
  (Andy)-[:SIBLING {type:['brother']}]->(Nikki),
  (Miles)-[:SIBLING {type:['brother']}]->(Michelle),
  (Michelle)-[:SIBLING {type:['sister']}]->(Miles)
;
