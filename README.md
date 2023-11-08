# Graph Database --Neo4j

Updated 2023-11-12

![](img/Graph%20Database%20Neo4j%2020230.png)

# Zack Dai

# Content (PLEASE USE THE PPT VERSION FOR CLASSES AFTER 2023 FALL)

ppt version: [Graph Database_V2.pptx](https://github.com/Goodman-School/GraphDatabase/raw/main/Graph%20Database%20Neo4j%202023v2.pptx)

* Part1 Graph Database Introduction
  * Graph Database
  * Comparison SQL with Neo4j
  * Use case of Neo4j
* Part2 Practice with Neo4j
  * Neo4j playground online
  * Import data to Neo4j
  * Basic Queries
  * Advanced usage
* Appendix: Learning Resources

Graph Database Introduction

# Part 1

# Graph Database

A graph is composed of two elements: a node and a relationship\.

Each node represents an entity \(a person\, place\, thing\, category or other piece of data\)\, and each relationship represents how two nodes are associated\.

![](img/Graph%20Database%20Neo4j%2020231.png)

Twitter is a perfect example of a graph database connecting 313 million monthly active users\. In the illustration to the right\, we have a small slice of Twitter users represented in a graph data model\.

![](img/Graph%20Database%20Neo4j%2020232.png)

![](img/Graph%20Database%20Neo4j%2020233.png)

# SQL vs NEO4j

SQL

NEO4j

![](img/Graph%20Database%20Neo4j%2020234.png)

![](img/Graph%20Database%20Neo4j%2020235.png)

# Advantages of NEO4j

![](img/Graph%20Database%20Neo4j%2020236.png)

Easy to Use

Visualization

Open Source

Fast

Support Network Algorism

Free Training and Certificate\!

# Neo4j Use Case

Fraud Detection

Knowledge Graph

Network and Infrastructure Monitoring

Recommendation System

Social Network Graph

AI and Analytics

Northwind database

# Part 2

# Northwind database

![](img/Graph%20Database%20Neo4j%2020237.jpg)

[Get the sample SQL Server databases for ADO\.NET code samples \- ADO\.NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql/linq/downloading-sample-databases)

# Preloaded Northwind sandbox

![](img/Graph%20Database%20Neo4j%2020238.png)

I created a northwind sandbox  <span style="color:#FF0000">\(valid until  Mar 22, 2023</span>  <span style="color:#FF0000">th</span>  <span style="color:#FF0000"> 8am\, 2022\)</span>

[http://54\.236\.57\.197:7474/browser/](http://54.236.57.197:7474/browser/)

Username:  _neo4j_

Password:  <span style="color:#0070C0">crown\-ways\-ammonia</span>

# Graph Schema

![](img/Graph%20Database%20Neo4j%2020239.png)

<span style="color:#0070C0">call </span>  <span style="color:#0070C0">db\.schema\.visualization</span>  <span style="color:#0070C0">\(\) </span>

# Basic Queries (Read)

Match \(p:Product\) return count\(p\)

Match \(p:Product \{productID: "16"\}\) return p

Match \(p:Product\) where p\. productName contains "an" return p

match \(c:Customer\)\-\[:ORDERED\]\->\(p:Product\) where c\.customerID= "RICSU" return c\,p

match \(c:Customer\)\-\[:ORDERED\]\->\(p:Product\) where c\.customerID= "RICSU" return p\.productName

match \(p:Product\)<\-\[r\]\-\(c:Customer\) return count\(r\)

# Compare Graph vs SQL

Answer the questions by SQL and Cypher

What products does “Aux joyeux ecclésiastiques” \(id 18\)  supply?

Which company supply the most types of product in “Seafood” category? show the supplier name\, descending sort by number of products\.

Who \(customer\) did “Andrew” \(Employee\, firstName\) served?

* <span style="color:#FF0000">MySQL sandbox \(Use chrome\, edge might have error\)</span>
  * <span style="color:#0563C1">[https://www\.w3schools\.com/sql](https://www.w3schools.com/sql)</span>  <span style="color:#0563C1">  </span>

# SQL Answer

SELECT p\.ProductName FROM Suppliers s inner join Products p on\(s\.SupplierID = p\.SupplierID\) where s\.SupplierName = 'Aux joyeux ecclésiastiques'

SELECT s\.SupplierName\, count\(distinct p\.ProductID\) counts FROM Suppliers s inner join Products p on\(s\.SupplierID = p\.SupplierID\) inner join Categories ct on\(p\.CategoryID = ct\.CategoryID\) where ct\.CategoryName = 'Seafood' group by s\.SupplierName order by counts desc;

SELECT c\.CustomerID\, c\.CustomerName\, c\.ContactName FROM Employees e join Orders o on\(e\.employeeID = o\.employeeID\) join Customers c on \(o\.customerID = c\.customerID\) where e\.FirstName = 'Andrew';

# Cypher Answer

* Match \(s:Supplier\)\-\[:SUPPLIES\]\->\(p:Product\) where s\.SupplierName='Aux joyeux ecclésiastiques' return p\.ProductName;
* MATCH \(n:Category\)\-\-\(p:Product\)\-\-\(s:Supplier\) where n\.CategoryName = 'Seafood' RETURN s\.SupplierName\, count\(p\) as prods order by prods desc;
* MATCH \(n:Employee\)\-\-\(o:Order\)\-\-\(c:Customer\) where n\.FirstName = 'Andrew' return c\.CustomerID\, c\.CustomerName\, c\.ContactName;
  * or
    * MATCH \(n:Employee\)\-\[\*2\]\-\(c:Customer\) where n\.FirstName = 'Andrew' return c\.CustomerID\, c\.CustomerName\, c\.ContactName;

Build your own

# Part 3

![](img/Graph%20Database%20Neo4j%20202310.png)

# Neo4j sanbox

[https://neo4j\.com/sandbox/](https://neo4j.com/sandbox/)

Register an account\.

Create a new sanbox

\(Spreadsheet Grapher\)

![](img/Graph%20Database%20Neo4j%20202311.png)

![](img/Graph%20Database%20Neo4j%20202312.png)

# Open database

Follow the instruction to open your sandbox database

![](img/Graph%20Database%20Neo4j%20202313.png)

# Basic Queries (Create)

<span style="color:#859900">create</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\{</span>  <span style="color:#333333">name</span>  <span style="color:#586E75">:</span>  <span style="color:#B58900">"your</span>  <span style="color:#B58900"> name"</span>  <span style="color:#586E75">\}\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">merge</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\{</span>  <span style="color:#333333">name</span>  <span style="color:#586E75">:</span>  <span style="color:#B58900">"your</span>  <span style="color:#B58900"> name"</span>  <span style="color:#586E75">\}\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">create</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\{</span>  <span style="color:#333333">name</span>  <span style="color:#586E75">:</span>  <span style="color:#B58900">"your</span>  <span style="color:#B58900"> name"</span>  <span style="color:#586E75">\,</span>  <span style="color:#333333"> id</span>  <span style="color:#586E75">:</span>  <span style="color:#2AA198">2</span>  <span style="color:#586E75">\}\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">CREATE</span>  <span style="color:#333333"> </span>  <span style="color:#859900">CONSTRAINT</span>  <span style="color:#333333"> </span>  <span style="color:#333333">order\_id</span>  <span style="color:#333333"> </span>  <span style="color:#859900">FOR</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">REQUIRE</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">name</span>  <span style="color:#333333"> </span>  <span style="color:#859900">IS</span>  <span style="color:#333333"> </span>  <span style="color:#859900">UNIQUE</span>  <span style="color:#586E75">;</span>

<span style="color:#859900">create</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">t</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Teacher</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\{</span>  <span style="color:#333333">name</span>  <span style="color:#586E75">:</span>  <span style="color:#B58900">"Dr</span>  <span style="color:#B58900">\. Yuan"</span>  <span style="color:#586E75">\}\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> t;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">t</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Teacher</span>  <span style="color:#586E75">\)\,</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">name</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">=</span>  <span style="color:#333333"> </span>  <span style="color:#B58900">"your name"</span>  <span style="color:#333333"> </span>  <span style="color:#859900">and</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#586E75">=</span>  <span style="color:#2AA198">2</span>  <span style="color:#333333"> </span>  <span style="color:#859900">create</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">t</span>  <span style="color:#586E75">\)\-\[:</span>  <span style="color:#333333">TEACHES</span>  <span style="color:#586E75">\]\->\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> </span>  <span style="color:#333333">t</span>  <span style="color:#586E75">\,</span>  <span style="color:#333333">s</span>  <span style="color:#333333">;</span>

# Basic Queries (Delete/Update)

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#586E75">=</span>  <span style="color:#2AA198">2</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> id</span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\)=</span>  <span style="color:#2AA198">1</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> id</span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\)=</span>  <span style="color:#2AA198">1</span>  <span style="color:#333333"> </span>  <span style="color:#859900">detach</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">t</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Teacher</span>  <span style="color:#586E75">\)\-\[</span>  <span style="color:#333333">r</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">TEACHES</span>  <span style="color:#586E75">\]\->\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#586E75">=</span>  <span style="color:#2AA198">2</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> r</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">name</span>  <span style="color:#586E75">=</span>  <span style="color:#B58900">"your name"</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">S</span>  <span style="color:#333333">tudent</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">delete</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">name</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">=</span>  <span style="color:#333333"> </span>  <span style="color:#B58900">"your name"</span>  <span style="color:#333333"> </span>  <span style="color:#859900">and</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">=</span>  <span style="color:#333333"> </span>  <span style="color:#2AA198">2</span>  <span style="color:#333333"> </span>  <span style="color:#859900">remove</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">where</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">name</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">=</span>  <span style="color:#333333"> </span>  <span style="color:#B58900">"your name"</span>  <span style="color:#333333"> </span>  <span style="color:#859900">set</span>  <span style="color:#333333"> </span>  <span style="color:#333333">s</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">id</span>  <span style="color:#333333"> = 9 </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> s;</span>

<span style="color:#859900">match</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\(</span>  <span style="color:#333333">t</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Teacher</span>  <span style="color:#586E75">\)\-\[</span>  <span style="color:#333333">r</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">TEACHES</span>  <span style="color:#586E75">\]\->\(</span>  <span style="color:#333333">s</span>  <span style="color:#586E75">:</span>  <span style="color:#333333">Student</span>  <span style="color:#586E75">\)</span>  <span style="color:#333333"> </span>  <span style="color:#859900">set</span>  <span style="color:#333333"> </span>  <span style="color:#333333">r</span>  <span style="color:#586E75">\.</span>  <span style="color:#333333">course</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">=</span>  <span style="color:#333333"> </span>  <span style="color:#B58900">"5P16"</span>  <span style="color:#333333"> </span>  <span style="color:#859900">return</span>  <span style="color:#333333"> </span>  <span style="color:#586E75">\*;</span>

# Load data with Neo4j data importer

* Step 1 Download data:
  * <span style="color:#0070C0">[https://github\.com/Goodman\-School/GraphDatabase/raw/main/data/W3Cnorthwind\.zip](https://github.com/Goodman-School/GraphDatabase/raw/main/data/W3Cnorthwind.zip)</span>
* Step 2 find your db credentials
  * [https://sandbox\.neo4j\.com/](https://sandbox.neo4j.com/)
* Step 3 Load data
  * Write cypher
  * Data importer:

![](img/Graph%20Database%20Neo4j%20202314.png)

[https://data\-importer\.neo4j\.io/versions/latest/](https://data-importer.neo4j.io/versions/latest/)

# Upload files and add nodes

![](img/Graph%20Database%20Neo4j%20202315.png)

![](img/Graph%20Database%20Neo4j%20202316.png)

# Add more nodes and relationships

# Load online data with query

# Learn more advanced technology

Follow the sanbox demo \(Crime detection\)

![](img/Graph%20Database%20Neo4j%20202317.png)

# Appendix: Learning Resources

Download Neo4j [https://neo4j\.com/download/?ref=product](https://neo4j.com/download/?ref=product)

Use Neo4j on sanbox [https://neo4j\.com/sandbox/](https://neo4j.com/sandbox/)

Neo4j data importer [https://data\-importer\.neo4j\.io/versions/latest/](https://data-importer.neo4j.io/versions/latest/)

Free official ebooks [https://neo4j\.com/books/](https://neo4j.com/books/)

Get Certificate [https://neo4j\.com/graphacademy/neo4j\-certification/](https://neo4j.com/graphacademy/neo4j-certification/)

