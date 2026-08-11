SELECT DISTINCT isbn
FROM promotion p
WHERE EXISTS (SELECT 1 FROM promotion WHERE isbn = p.isbn AND promo_month = 'August')
  AND EXISTS (SELECT 1 FROM promotion WHERE isbn = p.isbn AND promo_month = 'September');