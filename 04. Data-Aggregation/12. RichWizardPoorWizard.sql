SELECT SUM(d.Difference) AS 'SumDifference' FROM(
SELECT w.FirstName AS HostWizard, 
		w.DepositAmount AS 'Host Wizard Deposit',
		w2.FirstName AS 'Guest Wizard',
		w2.DepositAmount AS 'Guest Wizard Deposit',
		(w.DepositAmount - w2.DepositAmount) AS 'Difference' FROM WizzardDeposits AS w
LEFT OUTER JOIN WizzardDeposits AS w2
ON w.Id = w2.Id - 1) AS d;