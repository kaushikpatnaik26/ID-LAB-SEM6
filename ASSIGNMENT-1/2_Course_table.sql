CREATE TABLE Course (
    Course_id VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(30) NOT NULL,
    Dept_name VARCHAR(20) NOT NULL,
    Credits NUMBER(2)
);


INSERT INTO Course VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4);
INSERT INTO Course VALUES ('BIO-301', 'Genetics', 'Biology', 4);
INSERT INTO Course VALUES ('BIO-399', 'Computational Biology', 'Biology', 3);
INSERT INTO Course VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
INSERT INTO Course VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4);
INSERT INTO Course VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO Course VALUES ('FIN-201', 'Investment Banking', 'Finance', 3);
INSERT INTO Course VALUES ('HIS-351', 'World History', 'History', 3);
INSERT INTO Course VALUES ('MU-199', 'Music Video Production', 'Music', 3);
INSERT INTO Course VALUES ('PHY-101', 'Physical Principles', 'Physics', 4);


-- CREATE TABLE Course (
--     Course_id VARCHAR(10) PRIMARY KEY,
--     Title VARCHAR(30) NOT NULL,
--     Dept_name VARCHAR(20) NOT NULL,
--     Credits INT(2) CHECK (Credits >= 0)
-- );



