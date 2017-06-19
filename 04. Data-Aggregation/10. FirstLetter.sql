SELECT DISTINCT LEFT(names.FirstName, 1) as first_letter  
FROM (SELECT FirstName FROM WizzardDeposits AS w
WHERE w.DepositGroup = 'Troll Chest') AS names
ORDER BY first_letter;
