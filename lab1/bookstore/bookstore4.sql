SELECT isbn
FROM book b
WHERE genre = 'Horror'
   OR EXISTS (
       SELECT 1 FROM promotion p 
       WHERE p.isbn = b.isbn AND p.promo_month = 'August'
   );