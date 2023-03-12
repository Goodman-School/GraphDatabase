// must from a empty database
// Create orders
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/orders.csv' AS row
MERGE (order:Order {OrderID: row.OrderID})
  ON CREATE SET order.OrderDate=row.OrderDate;
// Create products
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/products.csv' AS row
MERGE (product:Product {ProductID: row.ProductID})
  ON CREATE SET product.ProductName = row.ProductName, product.Price = toFloat(row.Price);
// Create suppliers
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/suppliers.csv' AS row
MERGE (supplier:Supplier {SupplierID: row.SupplierID})
  ON CREATE SET supplier.SupplierName = row.SupplierName, supplier.ContactName = row.ContactName;
// Create employees
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/employees.csv' AS row
MERGE (e:Employee {EmployeeID:row.EmployeeID})
  ON CREATE SET e.FirstName = row.FirstName, e.LastName = row.LastName, e.title = row.Title;
// Create categories
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/categories.csv' AS row
MERGE (c:Category {CategoryID: row.CategoryID})
  ON CREATE SET c.CategoryName = row.CategoryName, c.Description = row.Description;
// Create customers
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/customers.csv' AS row
MERGE (customer:Customer {CustomerID: row.CustomerID, CustomerName:row.CustomerName, ContactName:row.ContactName, City:row.City, Address:row.Address,PostalCode:row.PostalCode,Country:row.Country});
//Create shippers
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/shippers.csv' AS row
MERGE (shipper:Shipper {ShipperID: row.ShipperID})
  ON CREATE SET shipper.ShipperName = row.ShipperName, shipper.Phone = row.Phone;

//add INDEX
CREATE INDEX product_id FOR (p:Product) ON (p.ProductID);
CREATE INDEX product_name FOR (p:Product) ON (p.ProductName);
CREATE INDEX supplier_id FOR (s:Supplier) ON (s.SupplierID);
CREATE INDEX employee_id FOR (e:Employee) ON (e.EmployeeID);
CREATE INDEX category_id FOR (c:Category) ON (c.CategoryID);
CREATE CONSTRAINT order_id FOR (o:Order) REQUIRE o.OrderID IS UNIQUE;
CREATE CONSTRAINT customer_id FOR (C:Customer) REQUIRE C.CustomerID IS UNIQUE;
CREATE CONSTRAINT shipper_id FOR (S:Shipper) REQUIRE S.ShipperID IS UNIQUE;
CALL db.awaitIndexes();
// Create relationships between orders and products
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/order_details.csv' AS row
MATCH (order:Order {OrderID: row.OrderID})
MATCH (product:Product {ProductID: row.ProductID})
MERGE (order)-[op:CONTAINS]->(product)
  ON CREATE SET op.Quantity = toFloat(row.Quantity);
// Create relationships between orders and employees
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/orders.csv' AS row
MATCH (order:Order {OrderID: row.OrderID})
MATCH (employee:Employee {EmployeeID: row.EmployeeID})
MERGE (employee)-[:SOLD]->(order);
// Create relationships between orders and shippers
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/orders.csv' AS row
MATCH (order:Order {OrderID: row.OrderID})
MATCH (shipper:Shipper {ShipperID: row.ShipperID})
MERGE (shipper)-[:SHIPPED]->(order);
// Create relationships between products and suppliers
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/products.csv
' AS row
MATCH (product:Product {ProductID: row.ProductID})
MATCH (supplier:Supplier {SupplierID: row.SupplierID})
MERGE (supplier)-[:SUPPLIES]->(product);
// Create relationships between products and categories
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/products.csv
' AS row
MATCH (product:Product {ProductID: row.ProductID})
MATCH (category:Category {CategoryID: row.CategoryID})
MERGE (product)-[:PART_OF]->(category);
// Create relationships between orders and customer
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Goodman-School/GraphDatabase/main/data/orders.csv' AS row
MATCH (order:Order {OrderID: row.OrderID})
MATCH (customer:Customer {CustomerID: row.CustomerID})
MERGE (customer)-[:ORDERED]->(order);
