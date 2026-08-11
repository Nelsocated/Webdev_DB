SELECT title
FROM book b, inventory i, store_branch s
WHERE b.isbn=i.isbn
    AND i.branch_id=s.branch_id
    AND i.stock_quantity=0
    AND s.city='Seattle';