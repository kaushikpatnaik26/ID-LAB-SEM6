SELECT ID, Name, Department
FROM Faculty_Info
WHERE Salary = (SELECT MAX(Salary) FROM Faculty_Info);


-- 	ID NAME 					      DEPARTMENT
-- ---------- -------------------------------------------------- --------------------
--      22222 Einstein					      Physics
