SELECT Course_id, Title, Credits 
FROM Course 
WHERE Department IN ('Physics', 'Music', 'Finance', 'Biology');

-- COURSE_I TITLE				   CREDITS
-- -------- ------------------------------ ----------
-- BIO-101  Intro. to Biology			 4
-- BIO-301  Genetics				 4
-- BIO-399  Computational Biology			 3
-- FIN-201  Investment Banking			 3
-- MU-199	 Music Video Production 		 3
-- PHY-101  Physical Principles			 4

-- 6 rows selected.
