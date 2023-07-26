--recursive CTE to create company's hierarchy tree 

select * from Employees
select * from AssociatedPersons

With
EmployeesCTE (EmployeeId, Name, Surname, ManagerId, [Level])
as
	(
	Select e.ID, ap.Name, ap.Surname, e.ManagerID, 1 --one hardcoded as this is the CEO, to retrieve the CEO record
	from Employees e
	inner join AssociatedPersons ap
		ON e.AssociatedPersonID = ap.ID
	where e.ManagerId is null

	union all  --adding records to first row

	Select e.ID, ap.Name, ap.Surname, e.ManagerID, cte.[Level] + 1 --loop and increment by one
	from Employees e
	inner join AssociatedPersons ap
		ON e.AssociatedPersonID = ap.ID
	inner join EmployeesCTE cte
		ON e.ManagerID = cte.EmployeeId
	)
-- SELECT * FROM EmployeesCTE
Select EmpCTE.Name as Name, EmpCTE.Surname as Surname, 
	ISNULL(MgrCTE.Name, 'CEO,') + ' ' + ISNULL(MgrCTE.Surname, 'no supervisor')  as DirectSupervisor, 
	EmpCTE.[Level] 
from EmployeesCTE EmpCTE
	left join EmployeesCTE MgrCTE  --to display also CEO record that do not have supervisors
	on EmpCTE.ManagerId = MgrCTE.EmployeeId
order by [Level] asc