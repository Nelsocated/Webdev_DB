SELECT s.branch_name AS "Branch", b.title as "Book_Title", p.discount_pct as "October_Discount"
FROM book b, store_branch s, promotion p, inventory i
WHERE b.isbn=p.isbn
    AND b.isbn = i.isbn
    AND s.branch_id = i.branch_id
    AND b.genre='Fantasy'
    AND i.stock_quantity>0 AND s.city='New York'
    AND p.promo_month='October';