# SQL Cheat Sheet 🐬

Quick, simple, example-first. Read in preview mode.

---

## 1. Basic Query: `SELECT`, `FROM`, `WHERE`

```sql
SELECT name, price
FROM products
WHERE price > 100;
```
> Pick columns (`SELECT`), pick table (`FROM`), filter rows (`WHERE`).

---

## 2. `ORDER BY` (`ASC` / `DESC`)

```sql
SELECT name, price
FROM products
ORDER BY price ASC;    -- lowest to highest (default, so you can even skip it)

SELECT name, price
FROM products
ORDER BY price DESC;   -- highest to lowest
```
| Keyword | Meaning |
|---|---|
| `ASC` | ascending → smallest/lowest value first, going up |
| `DESC` | descending → biggest/highest value first, going down |

---

## 3. Combining Conditions: `AND`, `OR`, `BETWEEN`

```sql
-- AND: BOTH conditions must be true
SELECT * FROM products
WHERE price > 50 AND stock > 0;

-- OR: AT LEAST ONE condition must be true
SELECT * FROM products
WHERE category = 'Snacks' OR category = 'Drinks';

-- BETWEEN: value inside a range (inclusive of both ends)
SELECT * FROM products
WHERE price BETWEEN 50 AND 100;   -- same as price >= 50 AND price <= 100
```

---

## 4. Pattern Matching: `LIKE`, `%`, `_`, `NOT`

| Symbol | Meaning | Example |
|---|---|---|
| `%` | any number of characters | `'A%'` → starts with A |
| `_` | exactly one character | `'_at'` → "cat", "bat" |
| `NOT` | negation | `NOT LIKE`, `NOT IN`, `NOT NULL` |

```sql
SELECT * FROM students
WHERE name LIKE 'Jo%'        -- starts with "Jo"
AND name NOT LIKE '%son';    -- doesn't end with "son"
```

---

## 5. Renaming & Joining Columns: `AS`, `USING`

```sql
SELECT s.name AS student_name, c.name AS course_name
FROM students s
JOIN enrolled e USING (student_id)   -- both tables share column "student_id"
JOIN courses c USING (course_id);
```
> `AS` = alias (rename column/table). `USING` = shortcut for `JOIN ... ON` when both tables have the **same column name**.

---

## 6. `UNIQUE` vs `DISTINCT`

- **`UNIQUE`** → a **table constraint**, no duplicate values allowed when inserting.
- **`DISTINCT`** → a **query keyword**, removes duplicates from the result.

```sql
-- constraint (table creation)
email VARCHAR(100) UNIQUE

-- query
SELECT DISTINCT department FROM employees;
```

---

## 7. Set Operations: `UNION`, `INTERSECT`, `EXCEPT`

Same number/type of columns required in both queries.

```sql
SELECT name FROM teachers
UNION                        -- combines, removes duplicates (UNION ALL keeps them)
SELECT name FROM students;

SELECT name FROM teachers
INTERSECT                    -- only rows in BOTH
SELECT name FROM students;

SELECT name FROM teachers
EXCEPT                       -- in first, but NOT in second
SELECT name FROM students;
```

---

## 8. Aggregate Functions

```sql
SELECT AVG(price), MIN(price), MAX(price), SUM(price), COUNT(*)
FROM products;
```
| Function | Meaning |
|---|---|
| `AVG` | average |
| `MIN` / `MAX` | smallest / largest |
| `SUM` | total |
| `COUNT` | how many rows |

---

## 9. `GROUP BY` (+ `HAVING`)

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;   -- filters groups (WHERE can't be used on aggregates)
```
> `WHERE` filters rows **before** grouping. `HAVING` filters groups **after** grouping.

---

## 10. `INSERT`, `UPDATE`, `DELETE`

```sql
-- INSERT
INSERT INTO students (id, name, age)
VALUES (1, 'Nelson', 19);

-- UPDATE
UPDATE students
SET age = 20
WHERE id = 1;

-- DELETE
DELETE FROM students
WHERE id = 1;
```
⚠️ Always use `WHERE` in `UPDATE`/`DELETE`, or it affects **all** rows.

---

## 11. Types of `JOIN`

```sql
SELECT a.name, b.grade
FROM students a
INNER JOIN grades b ON a.id = b.student_id;   -- only matching rows in both
```

| Join | Result |
|---|---|
| `INNER JOIN` | only rows that match in both tables |
| `LEFT JOIN` | all of left table + matches (else `NULL`) |
| `RIGHT JOIN` | all of right table + matches (else `NULL`) |
| `FULL JOIN` | all rows from both, matched where possible |
| `CROSS JOIN` | every row of A paired with every row of B (no `ON`) |

```sql
SELECT a.name, b.grade
FROM students a
LEFT JOIN grades b ON a.id = b.student_id; -- keep all students, even ungraded ones
```

### `ON` vs `USING`

| | `ON` | `USING` |
|---|---|---|
| When to use | column names are **different** in each table | column name is **exactly the same** in both tables |
| Syntax | `ON a.id = b.student_id` | `USING (student_id)` |
| Result columns | keeps both `a.id` and `b.student_id` separately | merges into a single `student_id` column |

```sql
-- ON: different column names
SELECT a.name, b.grade
FROM students a
JOIN grades b ON a.id = b.student_id;

-- USING: same column name on both sides
SELECT s.name, e.course_id
FROM students s
JOIN enrolled e USING (student_id);
```
> `USING` is just a shortcut for `ON` — only works when both tables share the identical column name.

---

## 12. Subqueries (query inside a query)

A subquery always runs **inside parentheses** and can sit in `WHERE`, `FROM`, or `SELECT`.

### a) Subquery in `WHERE` — filter using another query's result
```sql
SELECT name
FROM students
WHERE id IN (SELECT student_id FROM enrolled WHERE course_id = 3);
```

### b) Scalar subquery — returns a **single value**, use with `=`, `>`, `<`
```sql
SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
```

### c) `ANY` / `ALL` — compare to multiple values
```sql
SELECT name FROM products
WHERE price > ALL (SELECT price FROM products WHERE category = 'Snacks');
-- price must be bigger than EVERY snack price
```

### d) `EXISTS` — checks if subquery returns **any row at all** (true/false)
```sql
SELECT name FROM students s
WHERE EXISTS (
    SELECT 1 FROM enrolled e WHERE e.student_id = s.id
);
-- students who are enrolled in at least one course
```

### e) Subquery in `FROM` — treat a query result like a temporary table
```sql
SELECT dept, avg_salary
FROM (
    SELECT department AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg
WHERE avg_salary > 30000;
```

### f) Correlated subquery — inner query depends on the outer query (runs per row)
```sql
SELECT name, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary) FROM employees e2 WHERE e2.department = e1.department
);
-- employees earning more than their OWN department's average
```
> Non-correlated = runs once, independent. Correlated = runs once **per row** of the outer query, references outer table inside it.

---

## 13. Creating & Modifying Tables

### `CREATE TABLE` (with constraints, `FK`, `DEFAULT`)
```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
        ON DELETE CASCADE          -- if dept is deleted, delete related students too
);
```
| Keyword | Meaning |
|---|---|
| `PRIMARY KEY` | unique row identifier |
| `FOREIGN KEY (col) REFERENCES table(col)` | links to another table |
| `DEFAULT` | value used if none is given |
| `ON DELETE CASCADE` | auto-delete/update child rows when parent row is deleted |
| `NOT NULL` | column can't be empty |

### `ALTER TABLE` — change structure
```sql
ALTER TABLE students ADD COLUMN email VARCHAR(100);
ALTER TABLE students DROP COLUMN status;
ALTER TABLE students ALTER COLUMN name SET NOT NULL;
```

### `DROP` — remove table or values
```sql
DROP TABLE students;              -- deletes whole table + structure
DELETE FROM students WHERE id=1;  -- deletes just rows (table stays)
TRUNCATE TABLE students;          -- deletes ALL rows fast (keeps structure)
```

### `VIEW` — saved query you can treat like a table
```sql
CREATE VIEW active_students AS
SELECT id, name FROM students WHERE status = 'active';

SELECT * FROM active_students;   -- use it like a normal table

DROP VIEW active_students;       -- delete the view
```

---

## 14. Writing Order vs Execution Order

**You type it like this:**
```
SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
```

**SQL actually runs it like this:**
```
FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```
> This is why you **can't** use a `SELECT` alias in `WHERE`, but you **can** in `ORDER BY` — `WHERE` runs before `SELECT`, `ORDER BY` runs after.

---

## Full Example (mixing a bunch of it)

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE hire_date > '2020-01-01'
GROUP BY department
HAVING AVG(salary) > (
    SELECT AVG(salary) FROM employees   -- subquery: company-wide average
)
ORDER BY avg_salary DESC;
```
> Departments hired after 2020 whose average salary beats the whole company's average, highest first.