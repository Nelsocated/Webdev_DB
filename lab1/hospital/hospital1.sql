SELECT name, salary
FROM doctor
WHERE specialty='Cardiology' and salary BETWEEN 100000 AND 130000
ORDER BY salary DESC;