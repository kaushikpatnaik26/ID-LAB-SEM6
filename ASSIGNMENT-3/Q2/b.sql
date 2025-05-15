SELECT Department, AVG(Salary) AS Avg_Salary
FROM Faculty_Info
GROUP BY Department;


-- DEPARTMENT	     AVG_SALARY
-- -------------------- ----------
-- Elec. Eng.		  80000
-- Physics 		  91000
-- Comp. Sci.	     77333.3333
-- Finance 		  85000
-- Biology 		  72000
-- Music			  40000
-- History 		  61000

-- 7 rows selected.

