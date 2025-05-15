SELECT Name, Department, 
       (Salary + (Salary * 0.105) + (Salary * 0.2)) AS Gross_Salary, 
       ((Salary + (Salary * 0.105) + (Salary * 0.2)) - (Salary * 0.3)) AS Net_Salary 
FROM Faculty_Info;


-- NAME						   DEPARTMENT		GROSS_SALARY NET_SALARY
-- -------------------------------------------------- -------------------- ------------ ----------
-- Srinivasan					   Comp. Sci.		       84825	  65325
-- Wu						   Finance		      117450	  90450
-- Mozart						   Music		       52200	  40200
-- Einstein					   Physics		      123975	  95475
-- El Said 					   History		       78300	  60300
-- Gold						   Physics		      113535	  87435
-- Katz						   Comp. Sci.		       97875	  75375
-- Califieri					   History		       80910	  62310
-- Singh						   Finance		      104400	  80400
-- Crick						   Biology		       93960	  72360
-- Brandt						   Comp. Sci.		      120060	  92460
-- Kim						   Elec. Eng.		      104400	  80400
