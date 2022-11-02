Match (n) detach delete n;
CALL apoc.schema.assert({},{},true) YIELD label, key
RETURN *;
