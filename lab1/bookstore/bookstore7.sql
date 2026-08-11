SELECT DISTINCT a.name
FROM book b, author a, publisher p, inventory i, store_branch s
WHERE b.author_id = a.author_id
    AND b.pub_id = p.pub_id
    AND b.isbn = i.isbn
    AND i.branch_id = s.branch_id
    AND p.country='UK'
    AND i.stock_quantity>0
    AND s.branch_name='Chicago Books';