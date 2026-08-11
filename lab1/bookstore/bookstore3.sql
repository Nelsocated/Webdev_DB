SELECT a.name
FROM author a, book b
WHERE a.author_id=b.author_id
    AND b.price>12.00;