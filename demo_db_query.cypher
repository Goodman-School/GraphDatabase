// 1. Clear existing data (Optional: Use with caution)
MATCH (n) DETACH DELETE n;

// 2. Create the nodes with their respective properties
CREATE (c:Class {name: '5P16'})
CREATE (p:Professor {name: 'Shuai Yuan'})
CREATE (s:Student {name: 'your name'})
CREATE (ta:TeachingAssistant {name: 'Zack Dai'})

// 3. Create the 'TEACHES' relationships
// Based on the 'TEACHES' relationship shown in your sidebar
CREATE (p)-[:TEACHES]->(c)
CREATE (ta)-[:TEACHES]->(c);
