SELECT title, price - (price * .10) AS "Discounted_Price"
FROM book
WHERE genre = 'Mystery';
