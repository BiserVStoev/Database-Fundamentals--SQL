SELECT w.DepositGroup, SUM(w.DepositAmount) as TotalSum FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup;